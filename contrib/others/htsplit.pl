#! /usr/bin/perl -w
# found at http://www.cpan.org/authors/id/F/FJ/FJC/htsplit-1.0.0

use strict;
use HTML::Parser;
use Getopt::Long;
use constant ( TAIL => "\t</body>\n</html>\n" );

no warnings 'deprecated';
my $VERSION = 1.0.0;
use warnings;
my ($opt_b, $opt_h, $opt_usage, $opt_tidy);
my $head =''; # xml declaration through </head>
my $current = 0; # to form basename$current.html filenames

# collect_head
# Collect the head material and adjust the parser to
# handle the bulk of the document.
sub collect_head {
    my $p = shift;
    $head = shift;
    my $tag = shift;
    $head .= "<$tag>\n";
    $p->handler(start => \&generate_file, 'skipped_text, tag');
    $p->handler(end_document => \&generate_final_file, 'skipped_text');
    $p->report_tags(($opt_h));
}

sub generate_file {
    my $text = shift;
    my $tag = '';
    $tag = '<' . shift() . '>' if $current; # skip heading tag on first file
    $current++;
    my $curfile = filename($current);
    warn "\n\n##### making $curfile #####\n\n";
    open OUTFILE, "> $curfile" or die "can't open $curfile for writing ($!)\n";
    print OUTFILE $head, $tag, $text, TAIL;
    close OUTFILE;
    tidy($curfile) if $opt_tidy;
}

sub generate_final_file {
    my $text = shift;
    my $tag = '';
    $tag = '<' . $opt_h . '>';
    return unless $current; # 0 here means never found our hn tag
    $current++;
    my $curfile = filename($current);
    warn "\n\n##### making $curfile #####\n\n";
    open OUTFILE, "> $curfile" or die "can't open $curfile for writing ($!)\n";
    print OUTFILE $head, $tag, $text;
    close OUTFILE;
    tidy($curfile) if $opt_tidy;
}

sub filename {
	my $number = shift;
    if ($number<10) {
        return "${opt_b}00${number}.html";
        }
    elsif (($number>9)&&($number<100)) {
        return "${opt_b}0${number}.html";
        }
    else  {
        return "${opt_b}${number}.html";
        }
}

sub tidy {
    my $filename = shift;
    unless (length($filename)) {
        warn "No filename passed to tidy; skipping\n";
        return;
    }
    my @tidy_args = qw(tidy -m -i);
    push @tidy_args, $filename;
    system(@tidy_args) == 0
        or warn "Calling tidy failed: $?; exit value: ", $? >> 8, "\n";
}

sub usage {
	my $V = sprintf('%vd', $VERSION);
    print << "E";
Usage:
htsplit [options] [[<] filename]

Options:

  --heading n : heading level, 1 through 6, on which to split
                (just the number, not the 'h'); required
  --basename name : name prefix for the generated files
                    (default 'slide'); optional
  --tidy : run tidy -m -i on the output files; optional
  --help : show the help text and exit
  --version : show the help text and exit

version $V
E
    exit;
}

GetOptions('heading=i'  => \$opt_h,
           'basename=s' => \$opt_b,
           'tidy'       => \$opt_tidy,
           'help'       => \$opt_usage,
           'version'    => \$opt_usage,
);
usage() if $opt_usage;
no warnings;
$opt_h = int $opt_h;
usage() unless 0 < $opt_h and $opt_h < 7;
$opt_h = 'h' . $opt_h;
$opt_b ||= 'slide';
use warnings;
my $tidy_prog;
if ($opt_tidy) {
    my @tidy_locs = qw(
        /usr/local/bin/tidy
        /opt/local/bin/tidy
        /sw/local/bin/tidy
    );
    $opt_tidy = 0;
    foreach my $prog (@tidy_locs) {
        if (-x $prog) {
            $opt_tidy = 1;
            $tidy_prog = $prog;
            last;
        }
    }
    warn "Tidy not found; will process without tidying\n" unless $opt_tidy;
}

# set up initial report_tags and handlers
# these will change once we see the body tag
my $p = HTML::Parser->new(
    report_tags => ['body'],
     start_h => [\&collect_head, 'self, skipped_text, tag'],
     xml_mode => 1,
);

my $filename = shift;
if ($filename) {
    open F, $filename or die "can't open $filename ($!)\n";
    *INFILE = *F;
}
else {
    *INFILE = *STDIN;
}
$p->parse_file(*INFILE);
warn "Found no headings of level $opt_h; no files generated.\n" unless $current;
warn "\nTotal files generated: $current\n";

=head1 NAME

htsplit - split XHTML files into separate, complete HTML files based on
a specified heading level (1..6).

=head1 DESCRIPTION

htsplit creates complete XHTML files from an input XHTML file, copying
the XML declaration, DOCTYPE declaration, and head element from the
original file into each new file. This can be useful for breaking large
files representing, say, entire books or a sequence of slides for a
presentation, into individual files that load quickly.

This script is a partial replacement for the -slides option that used to
be part of HTML tidy (L<http://tidy.sf.net/>). It is more flexible than
that option, because tidy was hard coded to split on <h2>, whereas
htsplit accepts any user-specified heading level.

=head1 README

Installation: copy this script to any directory in your path.

Options:

  --heading n : heading level, 1 through 6, on which to split
                (just the number, not the 'h')
  --basename name : name prefix for the generated files
                    (optional, default 'slide')
  --tidy : optionally run tidy -m -i on the output files
  --help : show the help text and exit
  --version : show the help text and exit

=head1 COPYRIGHT

Copyright E<copy> 2003 Fred Condo. This program is free software; you can
redistribute it and/or modify it under the same terms as Perl itself.

=head1 PREREQUISITES

constant
strict
HTML::Parser
Getopt::Long

=pod SCRIPT CATEGORIES

Web

=cut


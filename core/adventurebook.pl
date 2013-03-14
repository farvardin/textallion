#! /usr/bin/perl -w
# 
# adapted from Christophe Chailloleau-Leclerc's code


use strict;

my $NumPage=0;
my $NumChoice='A';
my $Text='';

while (<>)
{
  chomp;
  if (/^== ([0-9]+) ==$/) # Page line 
  {
    $NumPage=$1;
    $NumChoice='A'; # Reinitialize choice for new page
    $Text='';
  }
  elsif (/^$/) # Empty line
  {
    if ($Text ne '')
    {
      print "The Page${NumPage} is a page. \"${Text}\".\n";
    }
    print "\n";
  }
  elsif (/^- (.*): ([0-9]+)$/) # Choice line
  {
    my ($ChoiceText,$TargetPage)=($1,$2);
    print "A choice called Page${NumPage}Choice${NumChoice} is for Page${NumPage}. \"${ChoiceText}\". It triggers Page${TargetPage}.\n";
    $NumChoice++;
  }
  elsif (/^- (.*) ([0-9]+)$/) # Choice line 2
  {
    my ($ChoiceText,$TargetPage)=($1,$2);
    print "A choice called Page${NumPage}Choice${NumChoice} is for Page${NumPage}. \"${ChoiceText} ****\". It triggers Page${TargetPage}.\n";
    $NumChoice++;
  }
  else # Text line
  {
    $Text .= $_;
  }
}


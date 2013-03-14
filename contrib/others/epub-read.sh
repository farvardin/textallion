#!/bin/bash

# v 1.0 (after some previous unnumbered versions) [12-09-2009]
# v 1.1 (option for reading epub in lynx. SBT) [09-12-2011]

# by Jellby http://www.mobileread.com/forums/member.php?u=14253 and SBT
# source http://www.mobileread.com/forums/showthread.php?t=51267

get_data() {
  OPF=$(sed -n -e '/<rootfile /s/.*full-path="\([^"]*\)".*/\1/p' META-INF/container.xml)
  BASEDIR=$(dirname $OPF)
  # Handle lynx' inability to deal with xml:base and meta charset:
  lynx_base=
  if (( LYNX_VIEWER )); then
     lynx_base="${BASEDIR}/"
     find ${BASEDIR} -name "*html" -exec sed -i s/'<[^>]*charset=[^>]*>'//I {} \;
     cat > lynx.config << EOF
     INCLUDE:/etc/lynx.cfg
     SUFFIX_ORDER:PRECEDENCE_HERE
     SUFFIX:.xhtml:text/html
EOF
  fi

  dos2unix "$OPF"
  TITLE=$(sed -n -e '/<dc:title/s/.*<dc:title>\(.*\)<\/dc:title>/\1/p' "$OPF")
  NCX=$(sed -n -e '/<spine/s/.*toc="\(.[^"]*\)".*/\1/p' "$OPF")
  NCX=$(sed -n -e "/id=\"$NCX\"/s/.*href=\"\(.[^\"]*\)\".*/\1/p" "$OPF")
  NCX=$BASEDIR/$NCX
  dos2unix "$NCX"
}

write_css() {
cat > indexAAA.css << EOF
body {
  margin: auto auto;
  padding: 2%;
  max-width: 35em;
  text-align: justify;
  font-size: 12pt;
  font-family: serif;
  background-color: white;
}

div.pagebreak {
  border: dashed;
  border-width: 1px 0 0 0;
  margin: 0 -2.05% 0 -2.05%;
}
EOF
}

write_html() {
cat > indexAAA.html << EOF
<html>
<head>
  <title>$TITLE</title>
  <script lang="javascript" type="text/javascript">
  function AddCSS() {
    var NewStyle=book.document.createElement("link");
    NewStyle.setAttribute("rel","stylesheet");
    NewStyle.setAttribute("type","text/css");
    NewStyle.setAttribute("href","$(readlink -f indexAAA.css)");
    book.document.getElementsByTagName("head")[0].appendChild(NewStyle);
  }
  function ChangeTitle() {
    document.title=book.document.title;
  }
  </script>
</head>
<frameset cols="25%,75%">
  <frame src="indexAAA.xhtml"/>
  <frame src="$BASEDIR/${files[0]}" name="book" onload="AddCSS(); ChangeTitle()"/>
</frameset>
</html>
EOF
}

write_xhtml() {
cat > indexAAA.xhtml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:base="$BASEDIR/">
<head>
  <style>
body {
  margin-top: 4em;
  background-color: white;
}
div.top {
  position: fixed;
  top: 0;
  margin: 0 auto 0 auto;
  background-color: white;
  color: black;
  width: 100%;
}
div.top a {
  color: inherit;
  text-decoration: none;
  font-weight: bold;
}
div.top a.deact {
  opacity: 0.3;
}
div.top table {
  width: 100%;
}
div.top td {
  width: 25%;
  text-align: center;
}
p {
  text-indent: -1em;
  margin: 0;
}
.level1 {
  margin: 1em 0 0 1em;
}
.level2 {
  margin: 0.5em 0 0 1.5em;
}
.level3 {
  margin: 0 0 0 2em;
}
.big {
  font-size: 150%;
  font-weight: bold;
}
.small {
  font-size: 80%;
  color: red;
}
.show {
  display: block;
}
.hide {
  display: none;
}
  </style>
  <script lang="javascript" type="text/javascript">
<![CDATA[
var num = 0;
var html = document.getElementsByTagName("html");
var basedir = html[0].getAttribute("base");
EOF

echo -n 'var files = [' >> indexAAA.xhtml
echo -n "'${files[0]}'" >> indexAAA.xhtml
for (( i=1; i<${#files[*]}; i++ )); do
  if [[ ${linears[$i]} -eq 1 ]]; then echo -n ", '${files[$i]}'" >> indexAAA.xhtml; fi
done
echo '];' >> indexAAA.xhtml

cat >> indexAAA.xhtml << EOF
function nextFile() {
  if (num < files.length-1) {
    num = Math.floor(num);
    num++;
    parent.book.location.href=basedir + files[num];
    setLinks(num);
  }
}
function prevFile() {
  if (num > 0) {
    num = Math.ceil(num);
    num--;
    parent.book.location.href=basedir + files[num];
    setLinks(num);
  }
}
function setLinks(number) {
  num = number;
  if (Math.floor(num) == Math.ceil(num)) {
    if (num <= 0) {
      document.getElementById('prev').setAttribute('class','deact');
      document.getElementById('prev').href=files[0];
    } else {
      document.getElementById('prev').setAttribute('class','act');
      document.getElementById('prev').href=files[num-1];
    }
    if (num >= files.length-1) {
      document.getElementById('next').setAttribute('class','deact');
      document.getElementById('next').href=files[files.length-1];
    } else {
      document.getElementById('next').setAttribute('class','act');
      document.getElementById('next').href=files[num+1];
    }
  } else {
    document.getElementById('prev').setAttribute('class','act');
    document.getElementById('prev').href=files[Math.floor(num)];
    if (Math.ceil(num) >= files.length-1) {
      document.getElementById('next').setAttribute('class','deact');
      document.getElementById('next').href=window.event.srcElement.href;
    } else {
      document.getElementById('next').setAttribute('class','act');
      document.getElementById('next').href=files[Math.ceil(num)+1];
    }
  }
}
function setSpine() {
  document.getElementById('current').innerHTML='SPINE';
  document.getElementById('change').innerHTML='TOC';
  document.getElementById('change').setAttribute('onclick','setToc()');
  document.getElementById('spine').setAttribute('class','show');
  document.getElementById('toc').setAttribute('class','hide');
}
function setToc() {
  document.getElementById('current').innerHTML='TOC';
  document.getElementById('change').innerHTML='SPINE';
  document.getElementById('change').setAttribute('onclick','setSpine()');
  document.getElementById('toc').setAttribute('class','show');
  document.getElementById('spine').setAttribute('class','hide');
}
]]>
  </script>
</head>
<body>

<div class="top">
<table><tr>
<td><a href="${files[0]}" target="book" onclick="setLinks(0);">&lt;&lt;&lt;</a></td>
<td><a class="deact" id="prev" href="${files[0]}" target="book" onclick="prevFile(); return false;">&lt;</a></td>
<td><a id="next" href="${files[1]}" target="book" onclick="nextFile(); return false;">&gt;</a></td>
<td><a href="${files[${#files[*]}-1]}" target="book" onclick="setLinks(files.length-1);">&gt;&gt;&gt;</a></td>
</tr><tr>
<td id="current" class="big" colspan="2">TOC</td>
<td id="change" class="small" onclick="setSpine();">SPINE</td>
</tr></table>
</div>

<div id="spine" class="hide">
EOF

j=-1
for (( i=0; i<${#ids[*]}; i++ )); do
  if [[ ${linears[$i]} -eq 0 ]]; then
    j=$(echo "scale=0; k=($j+1)/1-$j; scale=10; if ($j >= 0) $j+k/2 else 0" | bc)
    echo -n "* " >> indexAAA.xhtml
   else
    j=$(echo "scale=0; ($j+1)/1" | bc);
  fi
  echo "<a href=\"${lynx_base}${files[$i]}\" target=\"book\" onclick=\"setLinks($j);\">${ids[$i]}</a><br/>" >> indexAAA.xhtml
  index[${#index[*]}]=$j
done

cat >> indexAAA.xhtml << EOF
</div>

<div id="toc" class="show">
EOF

for (( i=0; i<${#items[*]}; i++ )); do
  k=-1
  check=$(expr ${srcs[$i]} : '\([^#]*\)#\?.*$')
  for (( j=0; j<${#files[*]}; j++ )); do
    if [[ "$check" == "${files[$j]}" ]]; then k=$j; fi
  done
  echo "<p class=\"level${levels[$i]}\">&bull; <a href=\"${lynx_base}${srcs[$i]}\" target=\"book\" onclick=\"setLinks(${index[$k]});\">${items[$i]}</a></p>" >> indexAAA.xhtml
done

cat >> indexAAA.xhtml << EOF
</div>

</body>
</html>
EOF
}

read_spine() {
  ORIGIFS=$IFS
  IFS=`echo -en "\n\b"`
  for id in $(sed -n -e '/<itemref/s/.*idref="\(.[^"]*\)".*/\1/p' "$OPF"); do
    file=$(sed -n -e "/id=\"$id\"/s/.*href=\"\(.[^\"]*\)\".*/\1/p" "$OPF")
    linear=$(sed -n -e "/idref=\"$id\"/s/.*linear=\"\([^\"]*\)\".*/\1/p" "$OPF")
    if [[ $linear == "no" ]]; then linear=0; else linear=1; fi
    ids[${#ids[*]}]=$id
    files[${#files[*]}]=$file
    linears[${#linears[*]}]=$linear
  done
  IFS=$ORIGFS
}

read_toc() {
  ORIGIFS=$IFS
  IFS=`echo -en "\n\b"`
  level=0
  for line in $(cat "$NCX"); do
    if (( $(expr $line : '\s*<navPoint') )); then
      level=$(($level+1))
    elif (( $(expr $line : '\s*<\/navPoint') )); then
      level=$(($level-1))
    elif (( $(expr $line : '\s*<text') )); then
      if (( $level > 0 )); then
        item=$(echo $line | sed -n -e 's/.*<text>\(.*\)<\/text>.*/\1/p')
        items[${#items[*]}]=$item
        levels[${#levels[*]}]=$level
      fi
    elif (( $(expr $line : '\s*<content') )); then
      if (( $level > 0 )); then
        src=$(echo $line | sed -n -e 's/.*src="\(.[^"]*\)".*/\1/p')
        srcs[${#srcs[*]}]=$src
      fi
    fi
  done
  IFS=$ORIGFS
}

#=================================================

while getopts ":o:v" OPTION; do
  case "$OPTION" in
    o ) OPEN=1 ;;
    v ) LYNX_VIEWER=1 ;;
  esac
done
shift $(($OPTIND-1))

DIR=$PWD
EPUB=$(readlink -f "$1")
TEMPDIR=$(mktemp -td epub.XXXXXX) || exit 1
[ -d $TEMPDIR ] || mkdir $TEMPDIR

cd $TEMPDIR
unzip -qo "$EPUB"

get_data
read_spine
read_toc
write_css
write_html
write_xhtml

echo -e "\n$(readlink -f indexAAA.html)\n"

if (( $OPEN )); then
  kfmclient exec file:$(readlink -f indexAAA.html)
fi

if (( $LYNX_VIEWER )); then
   lynx -cfg=lynx.config indexAAA.xhtml
fi

read -p "Press <ENTER> to delete the temporary files" END

cd $DIR
rm -r $TEMPDIR
exit

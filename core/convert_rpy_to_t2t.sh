
cat script.rpy |\
perl -pe 's/label (.*):/== \1 ==/g' |\
perl -pe 's/menu://g' |\
perl -pe 's/        "(.*)":/- \1:/g' |\
perl -pe 's/jump (.*)/jump \[\1 #\1]/g' |\
sed -e :a -e '$!N;s/\n *jump / /;ta' -e 'P;D' |\
perl -pe 's/    "(.*)"/\n\1\n/g' |\
perl -pe 's/\.:/:/g' |\
perl -pe 's/    hide/    {rpy}hide/' |\
perl -pe 's/    with/    {rpy}with/' |\
perl -pe 's/    show/    {rpy}show/' |\
perl -pe 's/    play/    {rpy}play/' |\
perl -pe 's/    stop/    {rpy}stop/' |\
perl -pe 's/    else/    {rpy}else/' |\
perl -pe 's/    scene/    {rpy}scene/' |\
perl -pe 's/    return/    {rpy}return/' |\
perl -pe 's/    if/    {rpy}if/' |\
perl -pe 's/    image/    {rpy}image/' |\
perl -pe 's/    (.*) "(.*)"/\n{rpya}\1\{\/rpya\}\2\n/' |\
perl -pe 's/    \$/    {rpy}\$/' 


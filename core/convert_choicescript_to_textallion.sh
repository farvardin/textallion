cat $1 |\
perl -pe 's/\*label (.*)/== \1 ==/g' |\
perl -pe 's/\[b\](.*)\[\/b\]/**\1**/g' |\
perl -pe 's/\*choice/\n/g' |\
perl -pe 's/#(.*)/- \1\n/g' |\
perl -pe 's/        //g' |\
perl -pe 's/    //g' |\
perl -pe 's/\*goto (.*)/[#\1]/g' 


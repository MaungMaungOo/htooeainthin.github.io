#!/bin/bash
#---
#title: သက်ငြိမ်
#layout: post
#date: '2020-07-01 22:55:00 +0630'
#background: https://obobeatz.files.wordpress.com/2011/08/293399_145639582187284_100002237283781_266322_7611634_n.jpg
#tags:
#- HtooEainThin
#- Music
#subtitle: သက်ငြိမ်
#artist: Manson Kit
#---

inputfile=$1
currenttime=$(date "+%F %T %Z")
prefixtime=$(date +%F)
read -rp 'title: ' titlevar
echo "please type in Burglish and Space for _"
read -rp 'file name: ' filename
echo "Please past image URL"
read -rp 'image-url: ' bgvar
read -rp 'tags: ' taggvar
read -rp 'subtitle: ' subvar
read -rp 'artist: ' artistvar
checkurl(){
	regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
	string="$bgvar"
	if [[ "$string" =~ $regex ]]
		then
	    echo "Link valid"
	else
	    echo "Link not valid"
	    bgvar=""
	fi
}
checkurl

savemd="$prefixtime"-"$filename"
savefile="$savemd".md

echocall(){
	echo "---" >> "$savefile"
	echo "title: $titlevar" >> "$savefile"
	echo "layout: post" >> "$savefile"
	echo "date: $currenttime" >> "$savefile"
	echo "backgroud: $bgvar" >> "$savefile"
	echo "tags: $tagvar" >> "$savefile"
	echo "subtitle: $subvar" >> "$savefile"
	echo "artist: $artistvar" >> "$savefile"
	echo "---" >> "$savefile"
	echo "\n" >> "$savefile"
	echo "save as: $savefile"
}

convertfile(){
	pandoc -f text -t markdown -s "$inputfile" -o "$savemd"
}
appendfile(){
	cat "$savemd" >> "$savefile"
}
echocall
convertfile
appendfile

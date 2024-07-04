#! /usr/bin/env sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}

case $kind in
	directory)
		eza --git -hl --color=always --icons "$1"
		;;
	image)
		chafa "$1"
		exiftool "$1"
		;;
	vnd.openxmlformats-officedocument.spreadsheetml.sheet | vnd.ms-excel)
		in2csv "$1" | xsv table | bat -ltsv --color=always
		;;
	text)
		bat --color=always "$1"
		;;
	*)
		lesspipe.sh "$1" | bat --color=always
		;;
esac

_fzf_complete_less() {
  fd --type f --hidden --follow --exclude .git | read | fzf --ansi --preview 'lessfilter.sh {}'
}
#! /bin/bash


function show_info {
	echo $'\e[32m'$1$'\e[30m'
}


function show_error {
	echo $'\e[31m'$1$'\e[30m'
}


function show_help {
	echo 'Usage:'
	echo "make" - to make the pdf file
	echo "make clean" - to clean the work directory
}


function clean_up {
	
	rm adjust.aux
	rm basic_info.aux
	rm epilogue.aux
	rm prologue.aux
	rm ch01.aux
	rm main.aux
	rm main.toc
	rm main.log
	rm ch02.aux

}


function build_pdf {
	xelatex main.tex
	xelatex main.tex #second round to build content
}

if [ $# -eq 0 ]; then
	clean_up
	build_pdf
	show_info "pdf built, enjoy it ;D"
else
	if [ $# -eq 1 -a $1 == 'clean' ]; then
		clean_up
	else
		show_error "wrong parameter :-("
		show_help
	fi
fi

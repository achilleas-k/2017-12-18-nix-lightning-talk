pdf := slideshow.pdf
h5ls := code/h5ls.out
nixfile := code/mydata.nix
fakedata := code/bunch-o-numbers.npz

$(pdf): $(h5ls) slideshow.tex figures/*
	pdflatex -shell-escape slideshow.tex

$(h5ls): $(nixfile)
	cd code; h5ls -r mydata.nix > h5ls.out

$(nixfile): $(fakedata) code/nixify-data.py
	cd code; python nixify-data.py

$(fakedata): code/create-fake-data.py
	cd code; python create-fake-data.py

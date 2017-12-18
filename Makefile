pdf := slideshow.pdf
h5ls := code/h5ls.out
nixfile := code/mydata.nix
fakedata := code/bunch-o-numbers.npz

$(pdf): $(h5ls)
	pdflatex -shell-escape slideshow.tex

$(h5ls): $(nixfile)
	cd code; h5ls -r mydata.nix > h5ls.out

$(nixfile): $(fakedata)
	cd code; python nixify-data.py

$(fakedata):
	cd code; python create-fake-data.py


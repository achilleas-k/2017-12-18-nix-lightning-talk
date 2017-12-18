pdf: lsout
	pdflatex -shell-escape slideshow.tex

lsout: nixfile
	cd code; h5ls -r mydata.nix > h5ls.out

nixfile: fakedata
	cd code; python nixify-data.py

fakedata:
	cd code; python create-fake-data.py


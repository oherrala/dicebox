OPENSCAD=~/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

all: images/dicebox.png images/lid.png

images/dicebox.png: common.scad dicebox.scad
	$(OPENSCAD) -o $@ --autocenter --viewall --render dicebox.scad

images/lid.png: common.scad lid.scad
	$(OPENSCAD) -o $@ --autocenter --viewall --render lid.scad

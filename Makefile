.PHONY: clean build

clean:
	cd build; \
	rm -rf *

build: clean
	cd build; \
	cmake ..

deps:
	mkdir build; \
	mkdir lib; \
	cd lib; \
	git clone https://gitlab.gnome.org/GNOME/libxml2.git; \
	git clone https://github.com/google/googletest.git

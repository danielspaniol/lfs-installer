PKG_USER=man-pages
PKG_HOME=/usr/src/$(PKG_USER)
PKG_DESC='The Man-pages package contains over 2,200 man pages.'
PKG_SRC=man-pages-4.16.tar.xz 
PKG_URL=https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.16.tar.xz
PKG_DIR=man-pages-4.16

.PHONY: all download install uninstall with-local-sources

all:
	@echo "Creating the package user... "
	@echo 'Please run `make install` once you are the package user'
	@mkdir -p $(PKG_HOME)
	@cp Makefile $(PKG_HOME)
	@cp install.sh $(PKG_HOME)
	@install_package $(PKG_DESC) $(PKG_USER) $(PKG_USER) || su $(PKG_USER)

with-local-sources:
	@echo "Creating the package user... "
	@echo 'Please run `make install` once you are the package user'
	@mkdir -p $(PKG_HOME)
	@cp Makefile $(PKG_HOME)
	@cp install.sh $(PKG_HOME)
	@cp /sources/$(PKG_SRC) $(PKG_HOME)
	@install_package $(PKG_DESC) $(PKG_USER) $(PKG_USER) || su $(PKG_USER)

$(PKG_DIR): $(PKG_SRC)
	@echo "Extracting... "
	@tar -xf $(PKG_SRC) 

download: $(PKG_SRC)
$(PKG_SRC):
	@echo "Downloading... "
	@wget -cq --show-progress $(PKG_URL)

build:
	@echo "Building... "
	@cd $(PKG_DIR); ../build.sh > ../build.log

install: $(PKG_DIR) build
	@echo "Installing... "
	@cd $(PKG_DIR); ../install.sh > ../install.log


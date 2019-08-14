PKG_USER=linux-libc-headers
PKG_HOME=/usr/src/$(PKG_USER)
PKG_DESC='Linux Headers'
PKG_SRC=linux-4.20.12.tar.xz 
PKG_URL=https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.20.12.tar.xz
PKG_DIR=linux-4.20.12/

.PHONY: all download install uninstall with-local-sources

all:
	@echo "Creating the package user... "
	@echo "Please run `make install` once you are the package user"
	@mkdir -p $(PKG_HOME)
	@cp Makefile $(PKG_HOME)
	@cp install.sh $(PKG_HOME)
	@install_package $(PKG_DESC) $(PKG_USER) $(PKG_USER) > /dev/null

with-local-sources:
	@echo "Creating the package user... "
	@echo "Please run `make install` once you are the package user"
	@mkdir -p $(PKG_HOME)
	@cp Makefile $(PKG_HOME)
	@cp install.sh $(PKG_HOME)
	@cp /sources/$(PKG_SRC) $(PKG_HOME)
	@install_package 'Linux Headers' $(PKG_USER) $(PKG_USER) > /dev/null

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


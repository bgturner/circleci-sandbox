#!/usr/bin/env bash
set -e

VERSION=$1

# The PHP version to compile
if [ "$VERSION" == "" ]; then
	echo "PHP version required."
	echo "    Usage: ./compile-php.sh <version>"
	exit 1
fi

# WORKDIR is the location where source is downloaded and compilation occurs
if [ "$WORKDIR" == "" ]; then
	WORKDIR="../source"
fi

mkdir -p "${WORKDIR}"

COMPILE_DIR=$WORKDIR/php

# PHP_INSTALL_DIR is the location that 'make install' installs to. Absolute paths only!
if [ "$PHP_INSTALL_DIR" == "" ]; then
	PHP_INSTALL_DIR="$(pwd)/../builds/php-${VERSION}"
fi
PHP_BIN_DIR="${PHP_INSTALL_DIR}/bin"

################################################################################
# Download source tarballs
################################################################################
if [ ! -f "${WORKDIR}/php-${VERSION}.tar.gz" ]; then
	echo "Downloading php-${VERSION}.tar.gz to ${WORKDIR}"
	curl https://www.php.net/distributions/php-$VERSION.tar.gz -o "${WORKDIR}/php-${VERSION}.tar.gz"
else
	echo "PHP source exists: ${WORKDIR}/php-${VERSION}.tar.gz"
fi

################################################################################
# Extract source
################################################################################
echo ""
echo "Removing and extracting source directories..."
echo ""
rm -rf $COMPILE_DIR
rm -rf $PHP_INSTALL_DIR
mkdir -p $COMPILE_DIR

tar xzf "${WORKDIR}/php-${VERSION}.tar.gz" -C $COMPILE_DIR
echo "Extracting ${WORKDIR}/php-${VERSION}.tar.gz to $COMPILE_DIR"

################################################################################
# Compiling PHP
################################################################################
echo ""
echo "Compiling PHP..."
echo ""
cd "$COMPILE_DIR/php-$VERSION"
echo "Changing to php build directory:"
echo "     $(pwd)"

./configure \
  --with-openssl \
	--enable-option-checking=fatal \
	--prefix="$PHP_INSTALL_DIR" \

make -j $(nproc)

echo ""
echo "Installing PHP..."
echo ""
make install

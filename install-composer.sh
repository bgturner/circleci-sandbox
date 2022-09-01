#!/usr/bin/env bash

export php_bin="$1"

if [ "$php_bin" == "" ]; then
	echo "Path to PHP binary required."
	echo "    Usage: ./install-composer.sh </path/to/php-version/bin/php>"
	exit 1
fi

EXPECTED_CHECKSUM="$(${php_bin} -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
"${php_bin}" -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(${php_bin} -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

"${php_bin}" composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
exit $RESULT

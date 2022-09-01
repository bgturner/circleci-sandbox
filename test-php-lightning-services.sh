#!/usr/bin/env bash

mkdir -p lightning-services

write_banner() {
  version="$1"
  echo ""
  echo "################################################################################"
  echo "Testing Lightning Service ${version}"
  echo "################################################################################"
  echo ""
}

extract_php_service() {
  version="$1"
  if [ ! -f "lightning-services/${version}/bin/php" ]; then
    echo "Extracting php-${version}.tar.gz"
    (
        cd lightning-services/${version} && tar xzf "php-${version}.tar.gz"
    )
  else
    echo "PHP binary already extracted in lightning-services/${version}/bin/php"
  fi
}

get_php_service() {
  version="$1"
  platform="$2"

    if [ ! -f "lightning-services/${version}/php-${version}.tar.gz" ]; then
        mkdir -p "lightning-services/${version}"
        echo "Downloading: https://cdn.localwp.com/site-services-lightning/php/${version}/bin-${platform}.tar.gz"
        curl "https://cdn.localwp.com/site-services-lightning/php/${version}/bin-${platform}.tar.gz" -o "lightning-services/${version}/php-${version}.tar.gz"
    else
        echo "PHP Lightning Service already exists: ${version}/php-${version}.tar.gz"
    fi
}

install_composer_deps() {
  version="$1"
  php_bin="lightning-services/${version}/bin/php"
  rm -rf vendor composer.lock
  $php_bin ./composer install
}

test_php_binary() {
  version="$1"
  php_bin="lightning-services/${version}/bin/php"
  $php_bin ./vendor/bin/pest
}

while IFS= read -r VERSION || [[ -n "$VERSION" ]]; do
  write_banner "$VERSION"
  get_php_service "$VERSION" "linux"
  # get_php_service "$VERSION" "darwin"
  extract_php_service "$VERSION"
  install_composer_deps "$VERSION"
  test_php_binary "$VERSION"
  echo ""
done <<EOF
5.6.39+11
7.3.5+11
7.4.1+18
7.4.30+1
8.0.0+3
8.0.22+1
EOF


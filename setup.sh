#!/bin/bash
#
# This is a setup script for this program


echo "## Welcome To Xcitic's World ##"

declare yarn=$(which yarn)
declare npm=$(which npm)
declare packagemanager

if [[ -n $yarn ]]; then
  packagemanager=yarn
elif [[ -n $npm ]]; then
  packagemanager=npm
else
  echo 'Please install NPM or Yarn'
  exit 1
fi

composer install
$packagemanager install

cp .env.example .env
php artisan key:generate
composer dump-autoload
php artisan serve

#!/bin/bash
# @file
# Behat integration - Install step.

set -e $DRUPAL_TI_DEBUG

cd "$TRAVIS_BUILD_DIR/$DRUPAL_TI_BEHAT_DIR"

composer install --no-interaction --prefer-source --dev

# Ensure drush webserver can be started for PHP 5.3.
drupal_ti_ensure_php_for_drush_webserver

# Ensure that drush is installed.
drupal_ti_ensure_drush

# Install firefox
drupal_ti_apt_get update >/dev/null
drupal_ti_apt_get install -y firefox

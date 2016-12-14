# Changelog

### [Check compatibility with Neard](https://github.com/crazy-max/neard/wiki/binPHP#latest) before downloading.

## r11 (2016/12/15)

* New bundle : 7.1.0 ([Issue #178](https://github.com/crazy-max/neard/issues/178))
* Move custom PHP extensions to a distinct folder ([Issue #188](https://github.com/crazy-max/neard/issues/188))
* Upgrade Imagick extension ([Issue #187](https://github.com/crazy-max/neard/issues/187))

## r10 (2016/11/29)

* New bundles : 5.6.28, 7.0.13
* Misconfiguration on PHP 7.0.11

## r9 (2016/10/06)

* New bundles : 5.5.37, 5.5.38, 5.6.23, 5.6.26, 7.0.8, 7.0.11
* Add Memcache extension
* Enable php_pdo_pgsql and php_pgsql extensions (required by PostgreSQL)

## r8 (2016/06/20)

* New bundles : 5.5.36, 5.6.22, 7.0.7
* Forgot .nrd file in 7.0.6

## r7 (2016/05/05)

* New bundles : 5.5.35, 5.6.21, 7.0.6
* Bug with APC extension on PHP 5.3 and 5.4

## r6 (2016/04/18)

* New bundles : 5.5.34, 5.6.20, 7.0.5
* Imagick unecessary for 5.2.17

## r5 (2016/02/09)

* New bundles : 5.5.32, 5.6.18, 7.0.3
* Bug in neard.conf for 5.6.17 and 7.0.2 ([Issue #110](https://github.com/crazy-max/neard/issues/110))
* Missing Xdebug dll in PHP 5.5.31 bundle ([Issue #111](https://github.com/crazy-max/neard/issues/111))

## r4 (2016/01/28)

* New bundles : 5.5.31, 5.6.17, 7.0.2
* Bug in php.ini for 5.2.17
* Disable APC / OPCache by default
* Missing dlls for 5.6.16
* pear-install update

## r3 (2015/12/13)

* New bundle : 7.0.0

## r2 (2015/12/13)

* New bundle : 5.4.45, 5.5.30, 5.6.16
* Adding pear-install batch and default go-pear.phar
* Completely review PEAR integration
* PEAR does not work on PHP 5.2.17 ([Issue #102](https://github.com/crazy-max/neard/issues/102))

## r1 (2015/12/07)

* Init repo with PHP bundles from [Neard](https://github.com/crazy-max/neard)
* Create template files (.nrd) for future Neard release

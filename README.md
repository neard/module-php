This a sub-repo of [Neard project](https://github.com/crazy-max/neard) involving PHP binary bundles.

## Installation

* Download and install [Neard](https://github.com/crazy-max/neard).
* If you already have installed Neard, stop it.
* Download [a PHP bundle](#download).
* Use a file archiver that supports [7z format](http://www.7-zip.org/7z.html) like [7zip](http://www.7-zip.org/) and extract the archive in `neard\bin\php\`.

Directory structure example :
```
[-] neard
 | [-] bin
 |  | [-] php
 |  |  | [-] php5.3.13
 |  |     | neard.conf
 |  |  | [-] php5.6.14
 |  |     | neard.conf
 ```

* Start Neard.
* Switch to the PHP version you have extracted on Neard (check [compatibility table](#compatibility-table) first) :

![](https://raw.github.com/crazy-max/neard-bin-php/master/img/switchVersion-20151214.png)

* If you have the warning icon on your PHP version, **you will have to switch the Apache version first**.

## Download

![](https://raw.github.com/crazy-max/neard-bin-php/master/img/star-20151214.png) : Default bundle on Neard.

### 5.2

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 5.2.17** | 2011/01/06 | [r6](https://github.com/crazy-max/neard-bin-php/releases/tag/r6) | [neard-php-5.2.17-r6.7z](https://github.com/crazy-max/neard-bin-php/releases/download/r6/neard-php-5.2.17-r6.7z) |

### 5.3

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 5.3.13** ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/star-20151214.png) | 2012/05/08 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.3.13-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.3.13-r4.zip) |
| **PHP 5.3.28** | 2013/12/12 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.3.28-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.3.28-r4.zip) |
| **PHP 5.3.29** | 2014/08/14 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.3.29-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.3.29-r4.zip) |

### 5.4

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 5.4.16** | 2013/06/06 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.16-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.16-r4.zip) |
| **PHP 5.4.26** | 2014/03/06 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.26-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.26-r4.zip) |
| **PHP 5.4.30** | 2014/06/26 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.30-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.30-r4.zip) |
| **PHP 5.4.31** | 2014/07/24 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.31-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.31-r4.zip) |
| **PHP 5.4.40** | 2015/04/16 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.40-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.40-r4.zip) |
| **PHP 5.4.45** | 2015/09/03 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.4.45-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.4.45-r4.zip) |

### 5.5

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 5.5.10** | 2014/03/06 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.5.10-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.5.10-r4.zip) |
| **PHP 5.5.14** | 2014/06/26 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.5.14-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.5.14-r4.zip) |
| **PHP 5.5.16** | 2014/08/21 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.5.16-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.5.16-r4.zip) |
| **PHP 5.5.24** | 2015/04/16 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.5.24-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.5.24-r4.zip) |
| **PHP 5.5.30** | 2015/10/01 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.5.30-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.5.30-r4.zip) |
| **PHP 5.5.31** | 2016/01/06 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-5.5.31-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-5.5.31-r5.zip) |
| **PHP 5.5.32** | 2016/02/04 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-5.5.32-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-5.5.32-r5.zip) |
| **PHP 5.5.34** | 2016/03/30 | [r6](https://github.com/crazy-max/neard-bin-php/releases/tag/r6) | [neard-php-5.5.34-r6.7z](https://github.com/crazy-max/neard-bin-php/releases/download/r6/neard-php-5.5.34-r6.7z) |

### 5.6

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 5.6.0**  | 2014/08/28 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.6.0-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.6.0-r4.zip) |
| **PHP 5.6.8**  | 2015/04/16 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.6.8-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.6.8-r4.zip) |
| **PHP 5.6.14** | 2015/10/01 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.6.14-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.6.14-r4.zip) |
| **PHP 5.6.16** | 2015/11/26 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-5.6.16-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-5.6.16-r4.zip) |
| **PHP 5.6.17** | 2016/01/06 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-5.6.17-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-5.6.17-r5.zip) |
| **PHP 5.6.18** | 2016/02/04 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-5.6.18-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-5.6.18-r5.zip) |
| **PHP 5.6.20** | 2016/04/01 | [r6](https://github.com/crazy-max/neard-bin-php/releases/tag/r6) | [neard-php-5.6.20-r6.7z](https://github.com/crazy-max/neard-bin-php/releases/download/r6/neard-php-5.6.20-r6.7z) |

### 7.0

|                | PHP release date | Neard release | Download |
| -------------- |:----------------:|:-------------:|:--------:|
| **PHP 7.0.0**  | 2015/12/03 | [r4](https://github.com/crazy-max/neard-bin-php/releases/tag/r4) | [neard-php-7.0.0-r4.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r4/neard-php-7.0.0-r4.zip) |
| **PHP 7.0.2**  | 2016/01/06 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-7.0.2-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-7.0.2-r5.zip) |
| **PHP 7.0.3**  | 2016/02/04 | [r5](https://github.com/crazy-max/neard-bin-php/releases/tag/r5) | [neard-php-7.0.3-r5.zip](https://github.com/crazy-max/neard-bin-php/releases/download/r5/neard-php-7.0.3-r5.zip) |
| **PHP 7.0.5**  | 2016/03/30 | [r6](https://github.com/crazy-max/neard-bin-php/releases/tag/r6) | [neard-php-7.0.5-r6.7z](https://github.com/crazy-max/neard-bin-php/releases/download/r6/neard-php-7.0.5-r6.7z) |

## Compatibility table

|               | Apache 2.2.x  | Apache 2.4.x |
| ------------- |:-------------:|:------------:|
| **PHP 5.2.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ko-20151214.png) |
| **PHP 5.3.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) |
| **PHP 5.4.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) |
| **PHP 5.5.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ko-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) |
| **PHP 5.6.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ko-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) |
| **PHP 7.0.x** | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ko-20151214.png) | ![](https://raw.github.com/crazy-max/neard-bin-php/master/img/ok-20151214.png) |

## Sources

* http://windows.php.net/

## Contribute

If you want to contribute to this bundle and create new bundles, you have to download [neard-dev](https://github.com/crazy-max/neard-dev) in the parent folder of the bundle.
Directory structure example :

```
[-] neard-dev
 | [-] build
 |  |  | build-commons.xml 
[-] neard-bin-php
 |  | build.xml
```

To create a new bundle :
* Do not forget to increment the `build.release` in the `build.properties` file.
* If you want you can change the `build.path` (default `C:\neard-build`).
* Open a command prompt in your bundle folder and call the Ant target `release` : `ant release`.
* Upload your release on a file hosting system like [Sendspace](https://www.sendspace.com/).
* Create an [issue on Neard repository](https://github.com/crazy-max/neard/issues) to integrate your release.

## Issues

Issues must be reported on [Neard repository](https://github.com/crazy-max/neard/issues).<br />
Please read [Found a bug?](https://github.com/crazy-max/neard#found-a-bug) section before reporting an issue.

@echo off
REM PHP_CodeSniffer tokenises PHP code and detects violations of a
REM defined set of coding standards.
REM 
REM PHP version 5
REM 
REM @category  PHP
REM @package   PHP_CodeSniffer
REM @author    Greg Sherwood <gsherwood@squiz.net>
REM @author    Marc McIntyre <mmcintyre@squiz.net>
REM @copyright 2006-2014 Squiz Pty Ltd (ABN 77 084 670 600)
REM @license   https://github.com/squizlabs/PHP_CodeSniffer/blob/master/licence.txt BSD Licence
REM @version   CVS: $Id: phpcs.bat,v 1.3 2007-11-04 22:02:16 squiz Exp $
REM @link      http://pear.php.net/package/PHP_CodeSniffer

"~NEARD_WIN_PATH~\bin\php\php5.3.13\php.exe" -d auto_append_file="" -d auto_prepend_file="" -d include_path="'~NEARD_WIN_PATH~\bin\php\php5.3.13\pear\pear'" -f "~NEARD_WIN_PATH~\bin\php\php5.3.13\pear\phpcs" -- %*

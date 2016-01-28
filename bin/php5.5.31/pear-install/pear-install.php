<?php

$startTime = Utils::getMicrotime();

if (!isset($_SERVER['argv']) || !isset($_SERVER['argv'][1])) {
    echo 'ERROR: Missing args' . PHP_EOL;
    exit(1);
}

$phpPath = Utils::formatUnixPath($_SERVER['argv'][1]);
$phpVersion = phpversion();
$pearPath = $phpPath . '/pear';
$pearVersion = Utils::getPearVersion($pearPath . '/pear.bat');
if (!is_dir($phpPath) || !is_file($phpPath . '/php.exe')) {
    echo 'ERROR: Invalid PHP path' . PHP_EOL;
    exit(1);
}
if ($pearVersion == null) {
    echo 'ERROR: Cannot retrieve PEAR version' . PHP_EOL;
    exit(1);
}

echo 'PHP path: ' . $phpPath . PHP_EOL;
echo 'PHP version: ' . $phpVersion . PHP_EOL;
echo 'PEAR path: ' . $pearPath . PHP_EOL;
echo 'PEAR version: ' . $pearVersion . PHP_EOL . PHP_EOL;

// Change paths
echo 'Changing paths to placeholders...' . PHP_EOL;
$countChangedOcc = 0;
$countChangedFiles = 0;
$unixFromPath = Utils::formatUnixPath($phpPath);
$windowsFromPath = Utils::formatWindowsPath($phpPath);
$unixToPath = Utils::formatUnixPath('~NEARD_LIN_PATH~/bin/php/php' . $phpVersion);
$windowsToPath = Utils::formatWindowsPath('~NEARD_WIN_PATH~/bin/php/php' . $phpVersion);

$filesToScan = Utils::getFilesToScan(array(
    $pearPath => array('.php', '.bat', '.ini', '.reg', '.inc')
));

foreach ($filesToScan as $fileToScan) {
    $tmpCountChangedOcc = 0;
    $fileContentOr = file_get_contents($fileToScan);
    $fileContent = $fileContentOr;
    
    preg_match('#' . $unixFromPath . '#i', $fileContent, $unixMatches);
    if (!empty($unixMatches)) {
        $fileContent = str_replace($unixFromPath, $unixToPath, $fileContent, $countChanged);
        //echo 'Replace ' . $unixFromPath . ' with ' . $unixToPath . ' in ' . $fileToScan . PHP_EOL;
        $tmpCountChangedOcc += $countChanged;
    }
    preg_match('#' . str_replace('\\', '\\\\', $windowsFromPath) . '#i', $fileContent, $windowsMatches);
    if (!empty($windowsMatches)) {
        $fileContent = str_replace($windowsFromPath, $windowsToPath, $fileContent, $countChanged);
        //echo 'Replace ' . $windowsFromPath . ' with ' . $windowsToPath . ' in ' . $fileToScan . PHP_EOL;
        $tmpCountChangedOcc += $countChanged;
    }
    
    if ($fileContentOr != $fileContent) {
        $countChangedFiles++;
        $countChangedOcc += $tmpCountChangedOcc;
        file_put_contents($fileToScan, $fileContent);
        file_put_contents($fileToScan . '.nrd', $fileContent);
    }
}
echo round(Utils::getMicrotime() - $startTime, 3) . 's => ' . $countChangedFiles . ' files and ' . $countChangedOcc . ' occurences changed' . PHP_EOL . PHP_EOL;

// Write neard.conf
echo 'Writing neard.conf...' . PHP_EOL . PHP_EOL;
file_put_contents($pearPath . '/neard.conf', 'pearVersion = "' . $pearVersion . '"');

// Clean
echo 'Cleaning...' . PHP_EOL;
Utils::removeFiles($pearPath . '/tmp');
$emptyFolders = Utils::getEmptyFolders($pearPath);
foreach ($emptyFolders as $emptyFolder) {
    file_put_contents($emptyFolder . '/.gitignore', '*' . PHP_EOL . '!.gitignore' . PHP_EOL);
}

class Utils {
    
    public static function getPearVersion($pearExe) {
        $output = shell_exec('CMD /C "' . $pearExe . '" -V 2>&1');
        if (empty($output)) {
            return null;
        }
        $outputRows = explode("\n", $output);
        if (empty($outputRows)) {
            return null;
        }
        foreach ($outputRows as $outputRow) {
            if (self::startWith($outputRow, 'PEAR Version')) {
                return trim(str_replace('PEAR Version:', '', $outputRow));
            }
        }
        return null;
    }
    
    public static function getFilesToScan($path) {
        $result = array();
        foreach ($path as $pathToScan => $toFind) {
            $findFiles = self::findFiles($pathToScan, $toFind);
            foreach ($findFiles as $findFile) {
                $result[] = $findFile;
            }
        }
        return $result;
    }
    
    public static function findFiles($startPath, $findFiles = array('')) {
        $result = array();
    
        $handle = @opendir($startPath);
        if (!$handle) {
            return $result;
        }
        
        while ($file = readdir($handle)) {
            if ($file == '.' || $file == '..') {
                continue;
            }
            if (is_dir($startPath . '/' . $file)) {
                $tmpResults = self::findFiles($startPath . '/' . $file, $findFiles);
                foreach($tmpResults as $tmpResult) {
                    $result[] = $tmpResult;
                }
            } elseif (is_file($startPath . '/' . $file)) {
                foreach ($findFiles as $findFile) {
                    if (self::endWith($file, $findFile) || $file == $findFile || empty($findFile)) {
                        $result[] = self::formatUnixPath($startPath . '/' . $file);
                    }
                }
            }
        }
        
        closedir($handle);
        return $result;
    }
    
    public static function removeFiles($path, $startPath = '') {
        if (empty($startPath)) {
            $startPath = $path;
        }
        $files = glob($path . '/*');
        foreach ($files as $file) {
            is_dir($file) ? self::removeFiles($file, $startPath) : unlink($file);
        }
        if ($path != $startPath) {
            rmdir($path);
        }
    }
    
    public static function getEmptyFolders($startPath, $findEmptyFolders = array('')) {
        $result = array();
    
        $handle = @opendir($startPath);
        if (!$handle) {
            return $result;
        }
        
        while ($file = readdir($handle)) {
            if ($file == '.' || $file == '..' || !is_dir($startPath . '/' . $file)) {
                continue;
            }
            if (count(scandir($startPath . '/' . $file)) == 2) {
                $result[] = $startPath . '/' . $file;
            } else {
                $tmpResults = self::getEmptyFolders($startPath . '/' . $file, $findEmptyFolders);
                foreach($tmpResults as $tmpResult) {
                    $result[] = $tmpResult;
                }
            }
        }
        
        closedir($handle);
        return $result;
    }
    
    public static function formatWindowsPath($path) {
        return str_replace('/', '\\', $path);
    }
    
    public static function formatUnixPath($path) {
        return str_replace('\\', '/', $path);
    }
    
    public static function startWith($string, $search) {
        $length = strlen($search);
        return (substr($string, 0, $length) === $search);
    }
    
    public static function endWith($string, $search) {
        $length = strlen($search);
        $start  = $length * -1;
        return (substr($string, $start) === $search);
    }
    
    public static function getMicrotime() {
        list($usec, $sec) = explode(" ", microtime());
        return ((float)$usec + (float)$sec);
    }
}

<?php
$parts = 8; // На сколько частей бить файл

$connect = "
set names utf8;
set sql dialect 3;
set clientlib 'gds32.dll';
connect '127.0.0.1:A4ON' user 'SYSDBA' password 'masterkey';
";

$file = file('all.sql', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

$lines_per_part = round(count($file) / $parts, 0) + 1;

$split = array();
$pi = 0;
for ($i = 0; $i < count($file); $i++) {
    $split[$pi][] = $file[$i];
    if ((($i + 1) % $lines_per_part) == 0) {
        $pi++;
    }
}

$run = "";
for ($i = 0; $i < count($split); $i++) {
    $sql = implode(PHP_EOL, $split[$i]);
    file_put_contents("$i.sql", $connect . $sql);
    file_put_contents("_$i.bat", "IBEScript.exe $i.sql");
    $run .= "start $i.bat" . PHP_EOL;
}
file_put_contents("__all.bat", $run);

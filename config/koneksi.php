<?php
	$host       = "localhost";
	$username   = "root";
	$password   = "";
	$database   = "db_spkstroke";
	$connection = mysql_connect($host, $username, $password) or die("Kesalahan Koneksi ... !!");
	mysql_select_db($database, $connection) or die("Databasenya Error");
	$db 		=  new mysqli($host, $username, $password, $database);
?>
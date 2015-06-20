<?php
	$host       = "localhost";
	$username   = "root";
	$password   = "";
	$database   = "ruri_skripsi";
	$connection = mysql_connect($host, $username, $password) or die("Kesalahan Koneksi ... !!");
	mysql_select_db($database, $connection) or die("Databasenya Error");
	$db 		=  new mysqli($host, $username, $password, $database);
?>
<?php
   
session_start();

if (($_SESSION['hak_akses'] != "admin") && ($_SESSION['hak_akses'] != "pakar") && ($_SESSION['hak_akses'] != "dokterumum"))
{
// tampilkan menu untuk user biasa
echo "<li class='active'><a href='index.php'>Beranda</a></li>";
echo "<li class='active'><a href='index.php'>Stroke</a></li>";
echo "<li class='active'><a class='putih' href=''>Faktor Resiko</a></li>";
echo "<form action='function/login_action.php?op=in' method='post'>";
echo "<br><div class='form_row'>Username <input name='username' type='text' class='inputfield' id='username' maxlength='60'/></div>";
echo "<div class='form_row'>Password <input name='password' type='password' class='inputfield' id='password' maxlength='40'/></div>";
echo "<input class='button' type='submit' name='Submit' value='Login' /></form>";
}

else if ($_SESSION['hak_akses'] == "admin")
{
echo "<li class='active'><a href='pengguna.php'>Pengguna</a></li>";
echo "<li class='active'><a href='faktorresiko.php'>Faktor Resiko</a></li>";
echo "<li class='active'><a href='resikostroke.php'>Resiko Stroke</a></li>";
echo "<li class='active'><a href='aturan.php'>Aturan</a></li>";
		$query = "select *	FROM user where username ='".$_SESSION[username]."'";
		$result = mysql_query ($query);
		$data = mysql_fetch_array($result);
		echo "<b>Selamat Datang, admin ".$data['nama']."<br>";
		echo "<a href=function/login_action.php?op=out>Log Out</a>";
		//echo "admin";
}

else if ($_SESSION['hak_akses'] == "pakar")
{
echo "<li class='active'><a href='faktorresiko.php'>Faktor Resiko</a></li>";
echo "<li class='active'><a href='resikostroke.php'>Resiko Stroke</a></li>";
echo "<li class='active'><a href='aturan.php'>Aturan</a></li>";
echo "<li class='active'><a href='diagnosa.php'>Deteksi</a></li>";
echo "<li class='active'><a href='#.html'>Riwayat Deteksi</a></li>";
		$query2 = "select *	FROM user where username ='".$_SESSION[username]."'";
		$result2 = mysql_query ($query2);
		$data2 = mysql_fetch_array($result2);
		echo "<b>Selamat Datang, Dokter ".$data2['nama']."<br>";
		echo "<a href=function/login_action.php?op=out>Log Out</a>";
//echo "pakar";
}

else if ($_SESSION['hak_akses'] == "dokterumum")
{
echo "<li class='active'><a href='faktorresiko.php'>Faktor Resiko</a></li>";
echo "<li class='active'><a href='resikostroke.php'>Resiko Stroke</a></li>";
echo "<li class='active'><a href='lihataturan.php'>Aturan</a></li>";
echo "<li class='active'><a href='diagnosa.php'>Deteksi</a></li>";
echo "<li class='active'><a href='#.html'>Riwayat Deteksi</a></li>";
		$query2 = "select *	FROM user where username ='".$_SESSION[username]."'";
		$result2 = mysql_query ($query2);
		$data2 = mysql_fetch_array($result2);
		echo "<b>Selamat Datang, Dokter ".$data2['nama']."<br>";
		echo "<a href=function/login_action.php?op=out>Log Out</a>";
}


?>
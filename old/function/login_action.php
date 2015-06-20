
<?php
session_start();
mysql_connect("localhost","root","") or die("Koneksi gagal");
mysql_select_db("stroke2");

$username = $_POST['username'];
$password = $_POST['password'];
$op = $_GET['op'];

if($op=="in"){
    $ceka = mysql_query("SELECT * FROM user WHERE username='$username' AND password='$password'");
	$data = mysql_fetch_array($ceka);

	if ($username == '' || $password == '')
	{
		echo "<script>
		alert('Isi data Anda!');
		window.location.href='../index.php';
		</script>";	
	}
	
	else if ($username != $data['username'] || $password != $data['password'])
	{
		echo "<script>
		alert('Email dan password anda salah!');
		window.location.href='../index.php';
		</script>";	
	}
	else if ($username == $data['username'] && $password == $data['password'])
	{
    $cek = mysql_query("SELECT hak_akses FROM user WHERE username='$username' AND password='$password'");
    if(mysql_num_rows($cek)==1){//jika berhasil akan bernilai 1
        $c = mysql_fetch_array($cek);
        $_SESSION['username'] = $c['username'];
        $_SESSION['hak_akses'] = $c['hak_akses'];
        if($c['hak_akses']=="admin"){
            header("location:../index.php");
        }else if($c['hak_akses']=="pakar"){
			header("location:../index.php");
        }else if($c['hak_akses']=="dokterumum"){
			header("location:../index.php");
		}
		//echo "$c[hak_akses]";
    }
	else{
    header("location:../index.php");
    }
	}
}else if($op=="out"){
    unset($_SESSION['username']);
    unset($_SESSION['hak_akses']);
    header("location:../index.php");
}

?>
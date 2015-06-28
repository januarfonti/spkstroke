<?php 
include "config/koneksi.php";
session_start();
function anti_injection($data){
  $filter = mysql_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  return $filter;
}
//Variabel yang dimasukkan	 
$username = anti_injection($_POST['username']);
$password = anti_injection(md5($_POST['password']));

if (!ctype_alnum($username) or !ctype_alnum($password))
{
	header("Location:index.php");
}
	//Queery tb_user
	$query_login = mysql_query ("select * from user where username = '$username' and password = '$password' ");
	$cek_query   = mysql_num_rows($query_login);
	$query_data  = mysql_fetch_object($query_login);	
	
	if($cek_query > 0)
	{		
			$_SESSION['id_user']   = $query_data->id_user;
			$_SESSION['username']  = $query_data->username;
			$_SESSION['hak_akses'] = $query_data->hak_akses;
			$_SESSION['nama']      = $query_data->nama;
			$_SESSION['status']    = 'WesLogin';
			header('location:diagnosa.php');

		/*if($query_data->status == 'Admin')
		{
			$_SESSION['id_user'] = $query_data->id_user;
			$_SESSION['username'] = $query_data->username;
			$_SESSION['status'] = $query_data->status;
			$_SESSION['nama_user'] = $query_data->nama_user;
			$_SESSION['kategori'] = $query_data->kategori;
			header('location:index.php');
		}
		else if($query_data->status == 'Kasir')
		{
			$_SESSION['id_user'] = $query_data->id_user;
			$_SESSION['username'] = $query_data->username;
			$_SESSION['status'] = $query_data->status;
			$_SESSION['nama_user'] = $query_data->nama_user;
			$_SESSION['nama_ukm'] = $query_data->nama_ukm;
			$_SESSION['id_ukm'] = $query_data->id_ukm;
			$_SESSION['kategori'] = $query_data->kategori;
			header("location:index.php");
		}
		else if($query_data->kategori == 'Anggota')
		{
			$_SESSION['id_user'] = $query_data->id_user;
			$_SESSION['username'] = $query_data->username;
			$_SESSION['status'] = $query_data->status;
			$_SESSION['nama_user'] = $query_data->nama_user;
			$_SESSION['nama_ukm'] = $query_data->nama_ukm;
			$_SESSION['id_ukm'] = $query_data->id_ukm;
			$_SESSION['kategori'] = $query_data->kategori;
			$_SESSION['fakultas'] = $query_data->fakultas;
			$_SESSION['telepon'] = $query_data->telepon;
			$_SESSION['jurusan'] = $query_data->jurusan;
			header("location:index.php");
		}*/
	}
	else
	{
		header("Location:index.php?&msg=1");
	}

?>
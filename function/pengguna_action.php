<?php
	include "configuration.php";
	$aksi = $_GET['aksi'];
	if ($aksi =="simpan")
	{
		simpan();
	}
	else if($aksi =="update")
	{
		update();
	}
	else if($aksi =="delete")
	{
		delete();
	}
	function simpan()
	{
		$nama		= $_GET['nama'];
		$jk			= $_GET['jk'];
		$TTL		= $_GET['TTL'];
		$pekerjaan	= $_GET['pekerjaan'];
		$username	= $_GET['username'];
		$password	= $_GET['password'];
		$hak_akses		= $_GET['hak_akses'];

		$query = "INSERT INTO user(nama,jk,tgl_lahir, pekerjaan, username, password, hak_akses)
					values ('$nama','$jk','$TTL', '$pekerjaan', '$username', '$password', '$hak_akses')";
		$result = mysql_query ($query); 
		
		if ($result== true)
		{	
			echo "Simpan berhasil";
		}
		else
		{
			echo "Simpan gagal";
		}
	}
function update()
	{
		$id_user	= $_GET['id_user'];
		$nama		= $_GET['nama'];
		$jk			= $_GET['jk'];
		$TTL		= $_GET['TTL'];
		$pekerjaan	= $_GET['pekerjaan'];
		$username	= $_GET['username'];
		$password	= $_GET['password'];
		$hak_akses		= $_GET['hak_akses'];

		$query = "UPDATE user SET nama='$nama', jk='$jk', tgl_lahir='$TTL', pekerjaan='$pekerjaan', username='$username', password='$password', hak_akses='$hak_akses'
		WHERE id_user='$id_user'" ;
		
		$result = mysql_query ($query); 
		if ($result== true)
		{
			echo "Update berhasil";
		}
		else
		{
			echo "Update gagal";
		}
	}	
	
	function delete()
	{
	$id_user = $_GET ['id_user'];
	
	$query = "DELETE FROM user WHERE id_user= '$id_user'";
	
	$result = mysql_query($query);
	if ($result == true)
	{
			echo "<script>window.location.replace(\"../pengguna.php\"); </script>";
	}
	else
	{
			echo "<script>window.location.replace(\"../pengguna.php\"); </script>";
	}
	}
	mysql_close();
	?>
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
		$nama_vitamin		= $_GET['nama_vitamin'];

		$query = "INSERT INTO data_vitamin( nama_vitamin)
					values ('$nama_vitamin')";
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
		$id_data_vitamin	= $_GET['id_data_vitamin'];
		$nama_vitamin		= $_GET['nama_vitamin'];

		$query = "UPDATE data_vitamin SET  nama_vitamin='$nama_vitamin'
		WHERE id_data_vitamin='$id_data_vitamin'" ;
		
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
	$id_data_vitamin = $_GET ['id_data_vitamin'];
	
	$query = "DELETE FROM data_vitamin WHERE id_data_vitamin= '$id_data_vitamin'";
	
	$result = mysql_query($query);
	if ($result == true)
	{
			echo "<script>window.location.replace(\"../data_vitamin.php\"); </script>";
	}
	else
	{
			echo "<script>window.location.replace(\"../data_vitamin.php\"); </script>";
	}
	}
	mysql_close();
	?>
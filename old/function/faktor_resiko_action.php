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
		$id_faktor					= $_GET['id_faktor'];
		$faktor_resiko				= $_GET['faktor_resiko'];
		$tingkat_faktor_resiko		= $_GET['tingkat_faktor_resiko'];

		$query = "INSERT INTO faktor_resiko(id_faktor,faktor_resiko,tingkat_faktor_resiko)
					values ('$id_faktor','$faktor_resiko','$tingkat_faktor_resiko')";
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
		$id_faktor						= $_GET['id_faktor'];
		$faktor_resiko					= $_GET['faktor_resiko'];
		$tingkat_faktor_resiko			= $_GET['tingkat_faktor_resiko'];

		$query = "UPDATE faktor_resiko SET faktor_resiko='$faktor_resiko', tingkat_faktor_resiko='$tingkat_faktor_resiko'
		WHERE id_faktor='$id_faktor'" ;
		
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
	$id_faktor = $_GET ['id_faktor'];
	
	$query = "DELETE FROM faktor_resiko WHERE id_faktor= '$id_faktor'";
	
	$result = mysql_query($query);
	if ($result == true)
	{
			echo "<script>window.location.replace(\"../faktorresiko.php\"); </script>";
	}
	else
	{
			echo "<script>window.location.replace(\"../pengguna.php\"); </script>";
	}
	}
	mysql_close();
	?>
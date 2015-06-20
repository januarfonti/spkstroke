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
		$id_stroke					= $_GET['id_stroke'];
		$resiko_stroke				= $_GET['resiko_stroke'];
		$deskripsi					= $_GET['deskripsi'];

		$query = "INSERT INTO resiko_stroke(id_stroke,resiko_stroke,deskripsi)
					values ('$id_stroke','$resiko_stroke','$deskripsi')";
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
		$id_stroke						= $_GET['id_stroke'];
		$resiko_stroke					= $_GET['resiko_stroke'];
		$deskripsi						= $_GET['deskripsi'];

		$query = "UPDATE resiko_stroke SET deskripsi='$deskripsi'
		WHERE id_stroke='$id_stroke'" ;
		
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
	$id_stroke = $_GET ['id_stroke'];
	
	$query = "DELETE FROM resiko_stroke WHERE id_stroke= '$id_stroke'";
	
	$result = mysql_query($query);
	if ($result == true)
	{
			echo "<script>window.location.replace(\"../resikostroke.php\"); </script>";
	}
	else
	{
			echo "<script>window.location.replace(\"../resikostroke.php\"); </script>";
	}
	}
	mysql_close();
	?>
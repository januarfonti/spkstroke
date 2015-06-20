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
		$kd_gejala		= $_GET['kd_gejala'];
		$kd_penyakit		= $_GET['kd_penyakit'];
		$nilai		= $_GET['nilai'];
		
		$querycek = "select * from gejala_penyakit";
		$resultcek = mysql_query ($querycek);
		$datacek = mysql_fetch_array ($resultcek);

		if ($nilai > 1 || $nilai < 0)
		{
			echo "Densitas antara 0-1";
		}
		else if ($kd_gejala == $datacek['kd_gejala'] && $kd_penyakit == $datacek['kd_penyakit'])
		{
			echo "Data aturan sudah ada";	
			//echo $querycek;	
		}
		else
		{
			$query = "INSERT INTO gejala_penyakit(kd_gejala,kd_penyakit,nilai)
						values ('$kd_gejala','$kd_penyakit','$nilai')";
			$result = mysql_query ($query); 
			if ($result== true)
			{	
				echo "Simpan berhasil";
							//echo $query;	

			}
			else
			{
				//echo "Simpan gagal";
				//echo $query;
				//echo $$datacek['kd_gejala'];
							echo "Data aturan sudah ada";	
	
				
			}
		}
	}
function update()
	{
		$id	= $_GET['id'];
		$kd_gejala	= $_GET['kd_gejala'];
		$kd_penyakit	= $_GET['kd_penyakit'];
		$nilai	= $_GET['nilai'];

		if ($nilai > 1 || $nilai < 0)
		{
			echo "Densitas antara 0-1";

		}
		else
		{
			$query = "UPDATE gejala_penyakit SET  nilai='$nilai'
			WHERE id='$id'" ;
			
			$result = mysql_query ($query); 
			if ($result== true)
			{
				echo "Update berhasil";
				//echo $query;
			}
			else
			{
				echo "Update gagal";
			}
		}

		
	}	
	
	function delete()
	{
	$id = $_GET ['id'];
	
	$query = "DELETE FROM gejala_penyakit WHERE id= '$id'";
	
	$result = mysql_query($query);
	if ($result == true)
	{
			echo "<script>window.location.replace(\"../aturan.php\"); </script>";
	}
	else
	{
			echo "<script>window.location.replace(\"../aturan.php\"); </script>";
	}
	}
	mysql_close();
	?>
<?php


	/**
	TEKANAN DARAH
	**/

	//$inputan = 131;
	//$inputan_diastolik = 90;

	//HASIL AKHIR

	function tekanan_darah($inputan,$inputan_diastolik)
	{

	   	if (($inputan>=0) && ($inputan <= 119))
	   	{
	   		$metune_sistolik = "rendah";
	   	}
	   	elseif (($inputan>=141) && ($inputan <= 150))
	   	{
	   		$metune_sistolik = "tinggi";
	   	}
	   	else //masuk ke pencarian dobel
	   	{
	   		if (($inputan >= 0) && ($inputan <= 130))
			{
				$hasil = "rendah";
			}

			if (isset($hasil))
			{
				$hasil = $hasil;
			}
			else
			{
				$hasil = "";
			}


			if (($inputan >= 120) && ($inputan <= 140)) {
				$hasil1 = "sedang";
			}

			if (isset($hasil1))
			{
				$hasil1 = $hasil1;
			}
			else
			{
				$hasil1 = "";
			}

			if (($inputan >= 130) && ($inputan <= 150)) {
				$hasil2 = "tinggi";
			}
			if (isset($hasil2))
			{
				$hasil2 = $hasil2;
			}
			else
			{
				$hasil2 = "";
			}


			$arrayName = array($hasil,$hasil1, $hasil2 );
			$out	= array_filter($arrayName) ;
			$keluar = array_values($out);


			if(count(array_intersect($keluar, array('rendah','sedang'))) == count(array('rendah','sedang')))
			{
		    	if (in_array("rendah", $keluar))
			   	{
			   		$rumus = (130-$inputan)/10;
			   		$rendah = $rumus;
			   	}

			   	if (in_array("sedang", $keluar))
			   	{
			   		if (($inputan>=120) && ($inputan <= 130))
			   		{
			   			$rumus1 = ($inputan-120)/10;
			   		}
			   		elseif (($inputan>130) && ($inputan <= 140))
			   		{
			   			$rumus1 = (140-$inputan)/10;
			   		}
			   		$sedang = $rumus1;
			   		//echo $rumus1."<br/>";
			   	}
			   	if ($rendah > $sedang)
			   	{
			   		$metune_sistolik = "rendah";
			   	}
			   	elseif ($rendah < $sedang) {
			   		$metune_sistolik = "sedang";
			   	}
			   	elseif ($rendah = $sedang) {
			   		$metune_sistolik = "sedang";
			   	}

			}
			elseif (count(array_intersect($keluar, array('sedang','tinggi'))) == count(array('sedang','tinggi')))
			{
				if (in_array("sedang", $keluar))
			   	{
			   		if (($inputan>120) && ($inputan <= 130))
			   		{
			   			$rumus1 = ($inputan-120)/10;
			   		}
			   		elseif (($inputan>130) && ($inputan <= 140))
			   		{
			   			$rumus1 = (140-$inputan)/10;
			   		}
			   		$sedang = $rumus1;
			   		//echo $rumus1."<br/>";
			   	}
			   	if (in_array("tinggi", $keluar))
			   	{
			   		$rumus2 = ($inputan-130)/10;
			   		$tinggi = $rumus2;
			   	}
			   	if ($sedang > $tinggi)
			   	{
			   		$metune_sistolik = "sedang";
			   	}
			   	elseif ($sedang < $tinggi) {
			   		$metune_sistolik = "tinggi";
			   	}
			   	elseif ($sedang = $tinggi) {
			   		$metune_sistolik = "tinggi";
			   	}

			}

	   	}


	   	/**

	   	DIASTOLIK

	   	**/

	   	if (($inputan_diastolik>=0) && ($inputan_diastolik <= 69))
	   	{
	   		$metune_diastolik = "rendah";
	   	}
	   	elseif (($inputan_diastolik>=91) && ($inputan_diastolik <= 100))
	   	{
	   		$metune_diastolik = "tinggi";
	   	}
	   	else //masuk ke pencarian dobel
	   	{
	   		if (($inputan_diastolik >= 0) && ($inputan_diastolik <= 80))
			{
				$hasil_diastolik = "rendah";
			}

			if (isset($hasil_diastolik))
			{
				$hasil_diastolik = $hasil_diastolik;
			}
			else
			{
				$hasil_diastolik = "";
			}


			if (($inputan_diastolik >= 70) && ($inputan_diastolik <= 90)) {
				$hasil1_diastolik = "sedang";
			}

			if (isset($hasil1_diastolik))
			{
				$hasil1_diastolik = $hasil1_diastolik;
			}
			else
			{
				$hasil1_diastolik = "";
			}

			if (($inputan_diastolik >= 80) && ($inputan_diastolik <= 100)) {
				$hasil2_diastolik = "tinggi";
			}
			if (isset($hasil2_diastolik))
			{
				$hasil2_diastolik = $hasil2_diastolik;
			}
			else
			{
				$hasil2_diastolik = "";
			}


			$arrayName_diastolik = array($hasil_diastolik,$hasil1_diastolik, $hasil2_diastolik );
			$out_diastolik	= array_filter($arrayName_diastolik) ;
			$keluar_diastolik = array_values($out_diastolik);

			if(count(array_intersect($keluar_diastolik, array('rendah','sedang'))) == count(array('rendah','sedang')))
			{
		    	//echo "rendah sedang";
		    	if (in_array("rendah", $keluar_diastolik))
			   	{
			   		$rumus_diastolik = (80-$inputan_diastolik)/10;
			   		$rendah_diastolik = $rumus_diastolik;
			   		//echo $rumus."<br/>";
			   	}

			   	if (in_array("sedang", $keluar_diastolik))
			   	{
			   		if (($inputan_diastolik>=70) && ($inputan_diastolik <= 80))
			   		{
			   			$rumus1_diastolik = ($inputan_diastolik-70)/10;
			   		}
			   		elseif (($inputan_diastolik>80) && ($inputan_diastolik <= 90))
			   		{
			   			$rumus1_diastolik = (90-$inputan_diastolik)/10;
			   		}
			   		$sedang_diastolik = $rumus1_diastolik;
			   		//echo $rumus1."<br/>";
			   	}
			   	if ($rendah_diastolik > $sedang_diastolik)
			   	{
			   		$metune_diastolik = "rendah";
			   	}
			   	elseif ($rendah_diastolik < $sedang_diastolik) {
			   		$metune_diastolik = "sedang";
			   	}
			   	elseif ($rendah_diastolik = $sedang_diastolik) {
			   		$metune_diastolik = "sedang";
			   	}
			   	//echo $metune_sistolik;

			}
			elseif (count(array_intersect($keluar_diastolik, array('sedang','tinggi'))) == count(array('sedang','tinggi')))
			{
				if (in_array("sedang", $keluar_diastolik))
			   	{
			   		if (($inputan_diastolik>=70) && ($inputan_diastolik <= 80))
			   		{
			   			$rumus1_diastolik = ($inputan_diastolik-70)/10;
			   		}
			   		elseif (($inputan_diastolik>80) && ($inputan_diastolik <= 90))
			   		{
			   			$rumus1_diastolik = (90-$inputan_diastolik)/10;
			   		}
			   		$sedang_diastolik = $rumus1_diastolik;
			   		//echo $rumus1."<br/>";
			   	}
			   	if (in_array("tinggi", $keluar_diastolik))
			   	{
			   		$rumus2_diastolik = ($inputan_diastolik-80)/10;
			   		$tinggi_diastolik = $rumus2_diastolik;
			   	}
			   	if ($sedang_diastolik > $tinggi_diastolik)
			   	{
			   		$metune_diastolik = "sedang";
			   	}
			   	elseif ($sedang_diastolik < $tinggi_diastolik) {
			   		$metune_diastolik = "tinggi";
			   	}
			   	elseif ($sedang_diastolik = $tinggi_diastolik) {
			   		$metune_diastolik = "tinggi";
			   	}

			}

	   	}


		if (($metune_sistolik=="rendah") && ($metune_diastolik=="rendah"))
		{
			$hasil_tekanan_darah = "rendah";
		}
		elseif (($metune_sistolik=="rendah") && ($metune_diastolik=="sedang"))
		{
			$hasil_tekanan_darah = "sedang";
		}
		elseif (($metune_sistolik=="rendah") && ($metune_diastolik=="tinggi"))
		{
			$hasil_tekanan_darah = "tinggi";
		}
		elseif (($metune_sistolik=="sedang") && ($metune_diastolik=="rendah"))
		{
			$hasil_tekanan_darah = "sedang";
		}
		elseif (($metune_sistolik=="sedang") && ($metune_diastolik=="sedang"))
		{
			$hasil_tekanan_darah = "sedang";
		}
		elseif (($metune_sistolik=="sedang") && ($metune_diastolik=="tinggi"))
		{
			$hasil_tekanan_darah = "tinggi";
		}
		elseif (($metune_sistolik=="tinggi") && ($metune_diastolik=="tinggi"))
		{
			$hasil_tekanan_darah = "tinggi";
		}
		elseif (($metune_sistolik=="tinggi") && ($metune_diastolik=="rendah"))
		{
			$hasil_tekanan_darah = "rendah";
		}
		elseif (($metune_sistolik=="tinggi") && ($metune_diastolik=="sedang"))
		{
			$hasil_tekanan_darah = "sedang";
		}

	return $hasil_tekanan_darah;

}

echo tekanan_darah(131,90);

	/**
	AKHIR TEKANAN DARAH
	**/

	/**
	DIABETES
	**/
	
	$inputan_diabetes = 192;



   	if (($inputan_diabetes>=0) && ($inputan_diabetes <= 179))
   	{
   		$metune_diabetes = "rendah";
   	}
   	elseif ($inputan_diabetes == 180)
   	{
   		$metune_diabetes = "sedang";
   	}
   	elseif ($inputan_diabetes >= 220)
   	{
   		$metune_diabetes = "tinggi";
   	}
   	else //masuk ke pencarian dobel
   	{
   		if (($inputan_diabetes >= 0) && ($inputan_diabetes < 180))
		{
			$hasil_diabetes = "rendah";
		}

		if (isset($hasil_diabetes))
		{
			$hasil_diabetes = $hasil_diabetes;
		}
		else
		{
			$hasil_diabetes = "";
		}


		if (($inputan_diabetes >= 160) && ($inputan_diabetes <= 200)) {
			$hasil_diabetes_1 = "sedang";
		}

		if (isset($hasil_diabetes_1))
		{
			$hasil_diabetes_1 = $hasil_diabetes_1;
		}
		else
		{
			$hasil_diabetes_1 = "";
		}

		
		if (($inputan_diabetes >= 180) && ($inputan_diabetes <= 219)) {
			$hasil_diabetes_2 = "tinggi";
		}
		if (isset($hasil_diabetes_2))
		{
			$hasil_diabetes_2 = $hasil_diabetes_2;
		}
		else
		{
			$hasil_diabetes_2 = "";
		}


		$arrayName_diabetes = array($hasil_diabetes,$hasil_diabetes_1, $hasil_diabetes_2 );
		$out_diabetes	= array_filter($arrayName_diabetes) ;
		$keluar_diabetes = array_values($out_diabetes);

		print_r($keluar_diabetes);

		/*
		if(count(array_intersect($keluar, array('rendah','sedang'))) == count(array('rendah','sedang')))
		{
	    	//echo "rendah sedang";
	    	if (in_array("rendah", $keluar))
		   	{
		   		$rumus = (130-$inputan)/10;
		   		$rendah = $rumus;
		   		//echo $rumus."<br/>";
		   	}

		   	if (in_array("sedang", $keluar))
		   	{
		   		if (($inputan>=120) && ($inputan <= 130))
		   		{
		   			$rumus1 = ($inputan-120)/10;
		   		}
		   		elseif (($inputan>130) && ($inputan <= 140))
		   		{
		   			$rumus1 = (140-$inputan)/10;
		   		}
		   		$sedang = $rumus1;
		   		//echo $rumus1."<br/>";
		   	}
		   	if ($rendah > $sedang)
		   	{
		   		$metune_sistolik = "Rendah";
		   	}
		   	elseif ($rendah < $sedang) {
		   		$metune_sistolik = "Sedang";
		   	}
		   	elseif ($rendah = $sedang) {
		   		$metune_sistolik = "Sedang";
		   	}
		   	//echo $metune_sistolik;

		}
		elseif (count(array_intersect($keluar, array('sedang','tinggi'))) == count(array('sedang','tinggi')))
		{
			if (in_array("sedang", $keluar))
		   	{
		   		if (($inputan>120) && ($inputan <= 130))
		   		{
		   			$rumus1 = ($inputan-120)/10;
		   		}
		   		elseif (($inputan>130) && ($inputan <= 140))
		   		{
		   			$rumus1 = (140-$inputan)/10;
		   		}
		   		$sedang = $rumus1;
		   		//echo $rumus1."<br/>";
		   	}
		   	if (in_array("tinggi", $keluar))
		   	{
		   		$rumus2 = ($inputan-130)/10;
		   		$tinggi = $rumus2;
		   		//echo $rumus2."<br/>";
		   	}
		   	if ($sedang > $tinggi)
		   	{
		   		$metune_sistolik = "Sedang";
		   	}
		   	elseif ($sedang < $tinggi) {
		   		$metune_sistolik = "Tinggi";
		   	}
		   	elseif ($sedang = $tinggi) {
		   		$metune_sistolik = "Tinggi";
		   	}

		}
		*/

   	}
   	




?>
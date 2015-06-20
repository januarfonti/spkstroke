<html>
<head>
    
    
    </head>

<body>
    <?php
    include "function/configuration.php";

    //pendevinisian variabel
    $sistole = $_POST["tds"];
    $diastole = $_POST["tdd"];
    $guldar = $_POST["guldar"];
    $riwayat = $_POST["riwayatkeluarga"];
    $perokok = $_POST["perokok"];
    $kol = $_POST["kolesterol"];
    $aktivitas_fisik = $_POST["aktivitas_fisik"];
    $tb = $_POST["tb"];
    $bb = $_POST["bb"];
    $fibrilasi_atrium = $_POST["fibrilasi_atrium"];
	
    //method tekanan darah
    function tekanandarah($sistole, $diastole){
		$results1	= mysql_query ("select * from penentuan_td where aturan_td = 'S1'");
		$datas1 = mysql_fetch_array ($results1);
		$results2	= mysql_query ("select * from penentuan_td where aturan_td = 'S2'");
		$datas2 = mysql_fetch_array ($results2);
		$results3	= mysql_query ("select * from penentuan_td where aturan_td = 'S3'");
		$datas3 = mysql_fetch_array ($results3);
		$resultd1	= mysql_query ("select * from penentuan_td where aturan_td = 'D1'");
		$datad1 = mysql_fetch_array ($resultd1);
		$resultd2	= mysql_query ("select * from penentuan_td where aturan_td = 'D2'");
		$datad2 = mysql_fetch_array ($resultd2);
		$resultd3	= mysql_query ("select * from penentuan_td where aturan_td = 'D3'");
		$datad3 = mysql_fetch_array ($resultd3);
		
        $nilai = 0;
				if($sistole>$datas1['range_bawah'] AND ($diastole>$datad1['range_bawah'] OR ($diastole>=$datad2['range_bawah'] AND $diastole<=$datad2['range_atas']) OR $diastole<$datad3['range_atas'])){
					$nilai = $datas1['idgejala']; 
				return $nilai;
				}
				if(($sistole>=$datas2['range_bawah'] AND $sistole<=$datas2['range_atas']) AND (($diastole>=$datad2['range_bawah'] AND $diastole<=$datad2['range_atas']) OR $diastole<$datad3['range_atas'])){
					$nilai = $datas2['idgejala']; 
				return $nilai;
				}
				if($sistole<$datas3['range_atas'] AND $diastole<$datad3['range_atas'] AND $sistole>0 AND $diastole>0){
					$nilai = $datas3['idgejala']; 
				return $nilai;
				}
				if($diastole>$datad1['range_bawah'] AND (($sistole>=$datas2['range_bawah'] AND $sistole<=$datas2['range_atas']) OR $sistole<$datas3['range_atas'])){
					$nilai = $datad1['idgejala']; 
				return $nilai;
				}
				if(($diastole>=$datad2['range_bawah'] AND $diastole<=$datad2['range_atas']) AND $sistole<$datas3['range_atas']){
					$nilai = $datad2['idgejala']; 
				return $nilai;
				}
    }
        
     function guladarah($guldar){
		$resultguldar1	= mysql_query ("select * from faktor_resiko where idgejala = '004'");
		$dataguldar1 = mysql_fetch_array ($resultguldar1);
		$resultguldar2	= mysql_query ("select * from faktor_resiko where idgejala = '005'");
		$dataguldar2 = mysql_fetch_array ($resultguldar2);
		$resultguldar3	= mysql_query ("select * from faktor_resiko where idgejala = '006'");
		$dataguldar3 = mysql_fetch_array ($resultguldar3);
		
		$nilai2 = 0;
        if($guldar>$dataguldar1['range_bawah']){
            $nilai2 = $dataguldar1['idgejala']; 
        return $nilai2;
		}
        if($guldar>=$dataguldar2['range_bawah'] AND $guldar<=$dataguldar2['range_atas'] ){
        $nilai2 = $dataguldar2['idgejala'];
            return $nilai2;
        }
        if($guldar<$dataguldar3['range_atas'] AND $guldar>0){
        $nilai2 = $dataguldar3['idgejala'];
            return $nilai2;
        }
    }

     function kol($kol){
		$resultkol1	= mysql_query ("select * from faktor_resiko where idgejala = '013'");
		$datakol1 = mysql_fetch_array ($resultkol1);
		$resultkol2	= mysql_query ("select * from faktor_resiko where idgejala = '014'");
		$datakol2 = mysql_fetch_array ($resultkol2);
		$resultkol3	= mysql_query ("select * from faktor_resiko where idgejala = '015'");
		$datakol3 = mysql_fetch_array ($resultkol3);
		
		$nilai3 = 0;
        if($kol>$datakol1['range_bawah']){
            $nilai3 = $datakol1['idgejala']; 
        return $nilai3;
		}
        if($kol>=$datakol2['range_bawah'] AND $kol<=$datakol2['range_atas'] ){
        $nilai3 = $datakol2['idgejala'];
            return $nilai3;
        }
        if($kol<$datakol3['range_atas'] AND $kol>0){
        $nilai3 = $datakol3['idgejala'];
            return $nilai3;
        }
    }

     function diet($tb,$bb){
		$resultdiet1	= mysql_query ("select * from faktor_resiko where idgejala = '019'");
		$datadiet1 = mysql_fetch_array ($resultdiet1);
		$resultdiet2	= mysql_query ("select * from faktor_resiko where idgejala = '020'");
		$datadiet2 = mysql_fetch_array ($resultdiet2);
		$resultdiet3	= mysql_query ("select * from faktor_resiko where idgejala = '021'");
		$datadiet3 = mysql_fetch_array ($resultdiet3);
		
			$nilai4 = 0;
		    $tb = $tb/100;
			$tb2 = $tb*$tb;
			if ($tb2 == 0) {
				$IMT = "";
			} else {
				$IMT = $bb/$tb2;
				if($bb == 'null' || tb == 'null'){
						$nilai4 = ""; 
					return $nilai4;
				}
				else if ($tb != 'null' || tb != 'null')
				{
					if($IMT>$datadiet1['range_bawah']){
						$nilai4 = $datadiet1['idgejala']; 
					return $nilai4;
					}
					if($IMT>=$datadiet2['range_bawah'] AND $IMT<=$datadiet2['range_atas'] ){
					$nilai4 = $datadiet2['idgejala'];
						return $nilai4;
					}
					if($IMT<$datadiet3['range_atas']){
					$nilai4 = $datadiet3['idgejala'];
						return $nilai4;
					}
				}
		}
    }



//Hasil Klasifikais Tingkat Gejala 
$tekanan_darah = tekanandarah($sistole,$diastole);
$diabetes = guladarah($guldar);
$kolesterol = kol($kol);
$diet =  diet($tb,$bb);


//TES
/*echo $tekanan_darah;
echo $fibrilasi_atrium;
echo $perokok;
echo $kolesterol;
echo $diabetes;
echo $aktivitas_fisik;
echo $diet;
echo $riwayat;
*/

$hasil = $tekanan_darah.$fibrilasi_atrium.$perokok.$kolesterol.$diabetes.$aktivitas_fisik.$diet.$riwayat;
$deteksifaktor = array($tekanan_darah,$fibrilasi_atrium,$perokok,$kolesterol,$diabetes,$aktivitas_fisik,$diet,$riwayat);


echo $hasil;
$gejalas = array_filter($deteksifaktor);
echo "<br>";
$hitungfaktor = count(array_filter($deteksifaktor));
echo $hitungfaktor;
echo "<br>";
//$gejalas = explode("&",$hasil);
	//	echo $gejalas;
		
		
		if (count($gejalas) > 1){
			//echo "banyak";
			foreach($gejalas as $i => $gejala) { 
				if($i==0){ //perhitungan gejala pertama
					$penyakit = array();
					$densitasTertinggi = 0;
					$plausability = 0;
					//ambil penyakit berdasarkan gejala yg dimasukkan
					$query="SELECT id, idpenyakit, idgejala, densitas FROM aturan WHERE idgejala='$gejala' ORDER BY densitas DESC";
					$sqlI=mysql_query($query);
					$j = 0;
					
					echo $query;
					
				
				}
			
			}
			
			
		}
		else
		{
			echo "cuma 1";
		
		}


    

    ?>
    
    
    </body>
</html>
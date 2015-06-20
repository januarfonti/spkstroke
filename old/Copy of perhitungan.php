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
					$nilai = $datas1['id_faktor']; 
				return $nilai;
				}
				if(($sistole>=$datas2['range_bawah'] AND $sistole<=$datas2['range_atas']) AND (($diastole>=$datad2['range_bawah'] AND $diastole<=$datad2['range_atas']) OR $diastole<$datad3['range_atas'])){
					$nilai = $datas2['id_faktor']; 
				return $nilai;
				}
				if($sistole<$datas3['range_atas'] AND $diastole<$datad3['range_atas'] AND $sistole>0 AND $diastole>0){
					$nilai = $datas3['id_faktor']; 
				return $nilai;
				}
				if($diastole>$datad1['range_bawah'] AND (($sistole>=$datas2['range_bawah'] AND $sistole<=$datas2['range_atas']) OR $sistole<$datas3['range_atas'])){
					$nilai = $datad1['id_faktor']; 
				return $nilai;
				}
				if(($diastole>=$datad2['range_bawah'] AND $diastole<=$datad2['range_atas']) AND $sistole<$datas3['range_atas']){
					$nilai = $datad2['id_faktor']; 
				return $nilai;
				}
    }
        
     function guladarah($guldar){
		$resultguldar1	= mysql_query ("select * from faktor_resiko where id_faktor = 'G004'");
		$dataguldar1 = mysql_fetch_array ($resultguldar1);
		$resultguldar2	= mysql_query ("select * from faktor_resiko where id_faktor = 'G005'");
		$dataguldar2 = mysql_fetch_array ($resultguldar2);
		$resultguldar3	= mysql_query ("select * from faktor_resiko where id_faktor = 'G006'");
		$dataguldar3 = mysql_fetch_array ($resultguldar3);
		
		$nilai2 = 0;
        if($guldar>$dataguldar1['range_bawah']){
            $nilai2 = $dataguldar1['id_faktor']; 
        return $nilai2;
		}
        if($guldar>=$dataguldar2['range_bawah'] AND $guldar<=$dataguldar2['range_atas'] ){
        $nilai2 = $dataguldar2['id_faktor'];
            return $nilai2;
        }
        if($guldar<$dataguldar3['range_atas'] AND $guldar>0){
        $nilai2 = $dataguldar3['id_faktor'];
            return $nilai2;
        }
    }

     function kol($kol){
		$resultkol1	= mysql_query ("select * from faktor_resiko where id_faktor = 'G013'");
		$datakol1 = mysql_fetch_array ($resultkol1);
		$resultkol2	= mysql_query ("select * from faktor_resiko where id_faktor = 'G014'");
		$datakol2 = mysql_fetch_array ($resultkol2);
		$resultkol3	= mysql_query ("select * from faktor_resiko where id_faktor = 'G015'");
		$datakol3 = mysql_fetch_array ($resultkol3);
		
		$nilai3 = 0;
        if($kol>$datakol1['range_bawah']){
            $nilai3 = $datakol1['id_faktor']; 
        return $nilai3;
		}
        if($kol>=$datakol2['range_bawah'] AND $kol<=$datakol2['range_atas'] ){
        $nilai3 = $datakol2['id_faktor'];
            return $nilai3;
        }
        if($kol<$datakol3['range_atas'] AND $kol>0){
        $nilai3 = $datakol3['id_faktor'];
            return $nilai3;
        }
    }

     function diet($tb,$bb){
		$resultdiet1	= mysql_query ("select * from faktor_resiko where id_faktor = 'G019'");
		$datadiet1 = mysql_fetch_array ($resultdiet1);
		$resultdiet2	= mysql_query ("select * from faktor_resiko where id_faktor = 'G020'");
		$datadiet2 = mysql_fetch_array ($resultdiet2);
		$resultdiet3	= mysql_query ("select * from faktor_resiko where id_faktor = 'G021'");
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
						$nilai4 = $datadiet1['id_faktor']; 
					return $nilai4;
					}
					if($IMT>=$datadiet2['range_bawah'] AND $IMT<=$datadiet2['range_atas'] ){
					$nilai4 = $datadiet2['id_faktor'];
						return $nilai4;
					}
					if($IMT<$datadiet3['range_atas']){
					$nilai4 = $datadiet3['id_faktor'];
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
echo array_filter($deteksifaktor);
echo "<br>";
$hitungfaktor = count(array_filter($deteksifaktor));
echo $hitungfaktor;
echo "<br>";

	$combine = array();
    $densitas = 0;
    if($hitungfaktor>1){
        //echo "ada banyak";
		$cnt = 1;
        $length = $hitungfaktor;
        foreach(array_filter($deteksifaktor) as $key=>$val){
            $query = "select * from faktor_resiko where id_faktor='".$val."'";
			$res = mysql_query($query);
            $gejala = mysql_fetch_assoc($res);

            $text ="<br><br> Gejala ".($key+1)." : ".$gejala['tingkat_faktor_resiko'];
			
			//echo $text;
			//echo "$query";
			//echo "kodegejala = $val";

            //list penyakit yang memiliki gejala bersangkutan
            $que="select a.*,p.resiko_stroke,count(a.id_faktor) as jumlah,sum(CAST(a.densitas AS DECIMAL(10,2))) as jumdens from aturan a left join faktor_resiko g on g.id_faktor=a.id_faktor left join resiko_stroke p on p.id_stroke=a.id_stroke where a.id_faktor = '$val' group by a.id_stroke order by id_stroke desc,jumdens desc";
			
			//echo $que;
			
			$res=mysql_query($que);
            while($row=mysql_fetch_assoc($res)){
                $penyakit[]=$row['resiko_stroke'];
                $idpenyakit[]=$row['id_stroke'];
            if($row['densitas']>$densitas)$densitas=$row['densitas'];
				
				//echo $row['resiko_stroke'];
            }
			
			
			
            $combine[$cnt]['idpenyakit'] = implode(',',$idpenyakit);
            $combine[$cnt]['densitas']['id'] = $idpenyakit;
            $combine[$cnt]['densitas']['value'] = $densitas;
            $combine[$cnt]['teta']['id'] = 'teta';
            $combine[$cnt]['teta']['value'] = 1 - $densitas;

            //penyakit
            $tempc['id']=$idpenyakit;
            $tempc['value']=$densitas;
            $tempcombine[$cnt][]=$tempc;

            //teta
            $tempc['id']=array('teta');
            $tempc['value']=1-$densitas;
            $tempcombine[$cnt][]=$tempc;


            $text .="<br> Penyakit yang memungkinkan yaitu ".implode(',',$penyakit)." .";
            $text .="<br> m".$cnt."{".implode(',',$penyakit)."} = ".$densitas;
            $text .="<br> m".$cnt."{teta} = ".(1-$densitas);

			echo $text;
			echo implode(',',$idpenyakit);

            }
    }
	elseif($hitungfaktor==1)
	{
       echo "cuma 1";

    }



/*    //dempster shafer
	if($_REQUEST['act']=='add'){
    //var_dump($_REQUEST);die;
    $arrgejala = substr($_REQUEST['arraygejala'], 0, -1);

    $arrgejala = explode(',',$arrgejala);

    $text ="<br> Nama Pengguna : ".$_SESSION['logged_in_user'];
    $text .="<br> Tanggal Diagnosa : ".date('d-m-Y')." <br>";

    $combine = array();
    $densitas = 0;

    if(count($arrgejala)>1){
        
    }
	elseif(count($arrgejala)==1)
	{
       

    }
*/

    

    ?>
    
    
    </body>
</html>
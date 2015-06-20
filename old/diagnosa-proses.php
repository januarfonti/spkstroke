<div class="container">
<?php
		session_start();
error_reporting(0);
	
	 include "function/configuration.php"; 
	include "atas.php"; 
	
	?>
    <script type="text/javascript" src="css/bootstrap.min.js"></script>

    <? 
	
	$nama = $_POST["nama"];
    $jk = $_POST["jk"];
    $tgl_lahir = $_POST["tgl_lahir"];
    $tgl_periksa = $_POST["tgl_periksa"];
    
	
	
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
		$resultguldar1	= mysql_query ("select * from gejala where kd_gejala = 'G13'");
		$dataguldar1 = mysql_fetch_array ($resultguldar1);
		$resultguldar2	= mysql_query ("select * from gejala where kd_gejala = 'G14'");
		$dataguldar2 = mysql_fetch_array ($resultguldar2);
		$resultguldar3	= mysql_query ("select * from gejala where kd_gejala = 'G15'");
		$dataguldar3 = mysql_fetch_array ($resultguldar3);
		
		$nilai2 = 0;
        if($guldar>$dataguldar1['range_bawah']){
            $nilai2 = $dataguldar1['kd_gejala']; 
        return $nilai2;
		}
        if($guldar>=$dataguldar2['range_bawah'] AND $guldar<=$dataguldar2['range_atas'] ){
        $nilai2 = $dataguldar2['kd_gejala'];
            return $nilai2;
        }
        if($guldar<$dataguldar3['range_atas'] AND $guldar>0){
        $nilai2 = $dataguldar3['kd_gejala'];
            return $nilai2;
        }
    }

     function kol($kol){
		$resultkol1	= mysql_query ("select * from gejala where kd_gejala = 'G10'");
		$datakol1 = mysql_fetch_array ($resultkol1);
		$resultkol2	= mysql_query ("select * from gejala where kd_gejala = 'G11'");
		$datakol2 = mysql_fetch_array ($resultkol2);
		$resultkol3	= mysql_query ("select * from gejala where kd_gejala = 'G12'");
		$datakol3 = mysql_fetch_array ($resultkol3);
		
		$nilai3 = 0;
        if($kol>$datakol1['range_bawah']){
            $nilai3 = $datakol1['kd_gejala']; 
        return $nilai3;
		}
        if($kol>=$datakol2['range_bawah'] AND $kol<=$datakol2['range_atas'] ){
        $nilai3 = $datakol2['kd_gejala'];
            return $nilai3;
        }
        if($kol<$datakol3['range_atas'] AND $kol>0){
        $nilai3 = $datakol3['kd_gejala'];
            return $nilai3;
        }
    }

     function diet($tb,$bb){
		$resultdiet1	= mysql_query ("select * from gejala where kd_gejala = 'G19'");
		$datadiet1 = mysql_fetch_array ($resultdiet1);
		$resultdiet2	= mysql_query ("select * from gejala where kd_gejala = 'G20'");
		$datadiet2 = mysql_fetch_array ($resultdiet2);
		$resultdiet3	= mysql_query ("select * from gejala where kd_gejala = 'G21'");
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
						$nilai4 = $datadiet1['kd_gejala']; 
					return $nilai4;
					}
					if($IMT>=$datadiet2['range_bawah'] AND $IMT<=$datadiet2['range_atas'] ){
					$nilai4 = $datadiet2['kd_gejala'];
						return $nilai4;
					}
					if($IMT<$datadiet3['range_atas']){
					$nilai4 = $datadiet3['kd_gejala'];
						return $nilai4;
					}
				}
		}
    }


//Hasil Klasifikais Tingkat Gejala 
$tekanan_darah = tekanandarah($sistole,$diastole);
$fibrilasi_atrium;
$perokok;
$kolesterol = kol($kol);
$diabetes = guladarah($guldar);
$aktivitas_fisik;
$diet =  diet($tb,$bb);
$riwayat;
	
$hasil = $tekanan_darah.$fibrilasi_atrium.$perokok.$kolesterol.$diabetes.$aktivitas_fisik.$diet.$riwayat;
$deteksifaktor = array($tekanan_darah,$fibrilasi_atrium,$perokok,$kolesterol,$diabetes,$aktivitas_fisik,$diet,$riwayat);


//print_r($deteksifaktor);

$cek = array_filter($deteksifaktor);
$gejalas = array_values($cek);
//$adaG7 = array_search(G7,$gejalas);
//print_r($gejalas);
//echo $adaG7;

//echo $hasil;
//echo $cek;
//$gejalas = array_filter($deteksifaktor);
//echo $gejalas;

//$exploded = preg_split('@/@', $deteksifaktor, NULL, PREG_SPLIT_NO_EMPTY);
  //print_r($exploded);


//$isigejala = implode(',', array_filter($deteksifaktor));
//echo $isigejala;

//echo "<br>";
//$hitungfaktor = count(array_filter($deteksifaktor));
//echo count($gejalas);
//echo "<br>";


	$arrayHasil = array();
	//cek apakah nama dan gejala diisi
	if(count($gejalas) != 0){
		echo "<div class='text-center'><h3>Hasil Diagnosa</h3></div><br>";
		
		//Ambil nama dan nilai gejala dari database
		$sqly = "SELECT kd_gejala, tingkat_faktor_resiko FROM gejala WHERE kd_gejala in ('".implode("','",$gejalas)."') order by id asc";
		$sqlgn=mysql_query($sqly);
		//echo $sqly;
		$gejalaInput = array();
		echo "<div class='row'><div class='col-md-6 col-md-offset-3'>";
		echo "<div class='panel panel-primary mb0'>";
		echo "<div class='panel-heading'><h4>Gejala</h4></div>";
		echo "<div class='panel-body'><ol class='normalis mb0'>";
		while($rsgn=mysql_fetch_array($sqlgn)){
			$gejalaInput[$rsgn['kd_gejala']] = $rsgn['tingkat_faktor_resiko'];
			echo "<li>".$rsgn['tingkat_faktor_resiko']."</li>"; //menampilkan nama gejala pada hasil doagnosa
		}
		echo "<ol>";
		echo "</div></div>";
		echo "</div></div><hr>";
		
		echo '<div class="row"><div class="col-md-6">';
		echo "<h4>Spesifik</h4>";
		if (count($gejalas) == 1){ //ngecek gejala yang dimasukkan 1 atau lebih
			if($gejalas[0]=='G22'){ // gejala spesifik. kalo satu itu g14 apa bukan
				$sqlG14=mysql_query("SELECT id, kd_penyakit, resiko_stroke, deskripsi FROM penyakit WHERE kd_penyakit='P01'");//kalo g14 itu abses
				while($rsG14=mysql_fetch_array($sqlG14)){ // nampilkan hasil penyakit p03 detailnya
		?>
        	<div class="panel panel-success hasil">
                <div class="panel-heading"><?php echo $rsG14['resiko_stroke']; ?></div>
                <div class="panel-body">
                    <div class=""></div>
                </div>
            </div>
        <?php 
				}
			} else {
				echo "<p class='text-center'>Tidak ada hasil karena gejala yang diinputkan bukan gejala sepesifik.</p>";
			}/*--- end cek jika G14 ---*/
		} else if (count($gejalas) > 1 && in_array('G22', $gejalas))
		{
			$sqlG14=mysql_query("SELECT p.id, p.kd_penyakit, p.resiko_stroke, p.deskripsi, g.tingkat_faktor_resiko FROM penyakit p, gejala g WHERE kd_gejala='G22' and kd_penyakit = 'P01'");//kalo g14 itu abses
			while($rsG14=mysql_fetch_array($sqlG14)){ // nampilkan hasil penyakit p03 detailnya

		?>
        	<div class="panel panel-success hasil">
            Dikarenakan pasien beresiko stroke  <? echo $rsG14['tingkat_faktor_resiko'];?> maka :
                <div class="panel-heading"><?php echo $rsG14['resiko_stroke']; ?></div>
                <div class="panel-body">
                    <div class=""></div>
                </div>
            </div>
        <?php }
		}else
		{
			echo "<p class='text-center'>Tidak ada hasil karena gejala yang diinputkan bukan gejala sepesifik.</p>";
		}
		echo '</div><div class="col-md-6"><h4>Non Spesifik</h4>';
		if (count($gejalas) > 1 && in_array('G22', $gejalas)){ //kalo lebih dari 1 berarti non spesifik
			//echo "tinggi dong";
			$sqlG14=mysql_query("SELECT p.id, p.kd_penyakit, p.resiko_stroke, p.deskripsi, g.tingkat_faktor_resiko FROM penyakit p, gejala g WHERE kd_gejala='G22' and kd_penyakit = 'P01'");//kalo g14 itu abses
			while($rsG14=mysql_fetch_array($sqlG14)){ // nampilkan hasil penyakit p03 detailnya

		?>
        	<div class="panel panel-success hasil">
            Terdapat faktor resiko spesifik pada pasien beresiko stroke  yaitu <? echo $rsG14['tingkat_faktor_resiko'];?> 
            </div>
            <?
			
			}
		}else if(count($gejalas) > 1){
			//echo "nggak mesti tinggi";
			foreach($gejalas as $i => $gejala) { //looping gejala yang dimasukkan
				if($i==0){ //perhitungan gejala pertama
					$penyakit = array();
					$densitasTertinggi = 0;
					$plausability = 0;
					//ambil penyakit berdasarkan gejala yg dimasukkan
					$sqlI=mysql_query("SELECT id, kd_penyakit, kd_gejala, nilai FROM gejala_penyakit WHERE kd_gejala='$gejala' ORDER BY nilai DESC");//diurutkan yang paling atas
					$j = 0;
					while($rsI=mysql_fetch_array($sqlI)){ //looping untuk mengambil penyakit berdasarkan gejala yang dimasukkan
						if($j==0) { //
							$densitasTertinggi = $rsI['nilai'];
							$plausability = 1-$densitasTertinggi; //diambil nilai plausability
						}
						$penyakit[$j] = $rsI['kd_penyakit']; //set penyakit by gejala
						$j++;
					}
					//set data dari gejala pertama
					$arrayHasil[$i][0]['name'] = $penyakit;
					$arrayHasil[$i][0]['value'] = $densitasTertinggi;
					$arrayHasil[$i][1]['name'] = array(0); //buat penamaan aja :3
					$arrayHasil[$i][1]['value'] = $plausability;
				} else { //perhitungan gejala kedua
					$penyakit = array();
					$densitasTertinggi = 0;
					$plausability = 0;
					//ambil penyakit berdasarkan gejala yg dimasukkan
					$sqlI=mysql_query("SELECT id, kd_penyakit, kd_gejala, nilai FROM gejala_penyakit WHERE kd_gejala='$gejala' ORDER BY nilai DESC");
					$j = 0;
					while($rsI=mysql_fetch_array($sqlI)){
						if($j==0) {
							$densitasTertinggi = $rsI['nilai'];
							$plausability = 1-$densitasTertinggi; //diambil nilai plausability
						}
						$penyakit[$j] = $rsI['kd_penyakit']; //set penyakit by gejala
						$j++;
					}
					//set data dari gejala kedua
					$arrayHasil[$i][0]['name'] = $penyakit;
					$arrayHasil[$i][0]['value'] = $densitasTertinggi;
					$arrayHasil[$i][1]['name'] = array(0);
					$arrayHasil[$i][1]['value'] = $plausability;
					
					//Proses kombinasi gejala 1 dan gejala 2
					$arrayKombinasi = array();

					$k = 0;
					foreach ($arrayHasil[$i-1] as $key1 => $array1v) { //gejala sebelumnya
						foreach ($arrayHasil[$i] as $key2 => $array2v) { //gejala sekarang
							//set name gejala kombinasi
							if($array1v['name'][0]!="0" and $array2v['name'][0]!="0") { //cek kalo plausabilitynya bukan 0
								//isinya gabungan array ke-1 dan ke-2
								$irisan1 = array_intersect($array1v['name'],$array2v['name']); //cari yang sama
								if(count($irisan1) > 0){ 
									$arrayKombinasi[$k]['name'] = $irisan1; //kalo ada hasilnya pembaginya tetep
								} else {
									$arrayKombinasi[$k]['name'] = array(1); //valuenya akan jadi pembagi
								}
							} else if($array1v['name'][0]!="0" and $array2v['name'][0]=="0"){ //bukan theta dibandingakan dengan theta maka haslnya kombinasi pertama
								//isinya array ke-1
								$arrayKombinasi[$k]['name'] = $array1v['name'];//tetha kali irisan
							} else if($array1v['name'][0]=="0" and $array2v['name'][0]!="0") {//theta dibandingakn dengan yang bukan theta maka hasilnya array kedua
								//isinya array ke-2
								$arrayKombinasi[$k]['name'] = $array2v['name'];
							} else if($array1v['name'][0]=="0" and $array2v['name'][0]=="0"){//perbandingan theta dengan theta
								//isinya tetep
								$arrayKombinasi[$k]['name'] = array(0); //plausability
							}
							
							//set value gejala kombinasi
							$arrayKombinasi[$k]['value'] = $array1v['value']*$array2v['value'];//perkalian nilainya
							$k++;
						}
					}
					
					//Pegelompokan data hasil kombinasi
					$yangSama = array();
					$penyebut = 0;
					$m = 0;
					for($k=0;$k<count($arrayKombinasi);$k++){
						if (in_array($k, $yangSama)) continue;
						
						$pembilang = $arrayKombinasi[$k]['value'];
						$penyebutYgSama = array();
						for($l=$k+1;$l<count($arrayKombinasi);$l++){
							asort($arrayKombinasi[$k]['name']); //sorting array ASC cuma pengurutan nama penyakit
							asort($arrayKombinasi[$l]['name']); //sorting array ASC
							//cek apakah mempunyai name array yg sama
							if(implode(",",$arrayKombinasi[$k]['name'])==implode(",",$arrayKombinasi[$l]['name'])){ //implode : buat array jadi string biar bisa dibandingkan
								$pembilang += $arrayKombinasi[$l]['value']; //kalo kombinasi penyakit sama maka nilainya ditambah
								array_push($yangSama, $l); //array push buat nyimpan array yang sama (angka)
							} else {
								//cek apakah nilai bagi
								if(implode(",",$arrayKombinasi[$k]['name'])==1 && in_array($k, $penyebutYgSama)==false){//ketika di implode punya nilai yang sama dan ketika gak ada irisan yang sama
									$penyebut += $arrayKombinasi[$k]['value'];//ngeset penambahan penyebut
									array_push($penyebutYgSama, $k);
								}
							}
						}
						
						if(array_key_exists(0, $arrayKombinasi[$k]['name'])){//ngecek kalo theta gak masuk perhitungan
							if ($arrayKombinasi[$k]['name'][0]==1) continue; //ntar waeeeeee----------------------- ngecek doang
						}
						
						$arrayHasil[$i][$m]['name'] = $arrayKombinasi[$k]['name'];
						$arrayHasil[$i][$m]['value'] = number_format($pembilang/(1-$penyebut),5, '.', '');
						
						$m++;
					}
				}
			}
			
			$t = count($gejalas)-1;
			usort($arrayHasil[$t], 'sortByValue');//usort : custom sorting
			
			$quser="select * from user where username ='".$_SESSION['username']."'";
			$ruser=mysql_query($quser);
			$datauser=mysql_fetch_array($ruser);

			$rfb=mysql_query("select * from gejala where kd_gejala ='$fibrilasi_atrium'");
			$dfb=mysql_fetch_array($rfb);
			
			$rm=mysql_query("select * from gejala where kd_gejala ='$perokok'");
			$dm=mysql_fetch_array($rm);

			$raf=mysql_query("select * from gejala where kd_gejala ='$aktivitas_fisik'");
			$daf=mysql_fetch_array($raf);

			$rwt=mysql_query("select * from gejala where kd_gejala ='$riwayat'");
			$dwt=mysql_fetch_array($rwt);

			if ($tb == '' || $bb == '' || $sistole == '' || $diastole == ''){
			//Simpan hasil diagnosa - matikan koding ini saat pengujian
			$quesave="insert into diagnosa (id_user, nama, jk, tgl_lahir, tgl_periksa, kd_penyakit, tekanan_darah, riwayat_fibrilasi_atrium,merokok, kolesterol,diabetes,aktivitas_fisik,diet,riwayat_keluarga) values 
			('".$datauser['id_user']."','$nama','$jk','$tgl_lahir','".date("Y-m-d")."','".implode(",",$arrayHasil[$t][0]['name'])."','','".$dfb['tingkat_faktor_resiko']."','".$dm['tingkat_faktor_resiko']."','$kol','$guldar','".$daf['tingkat_faktor_resiko']."','','".$dwt['tingkat_faktor_resiko']."')";
			//$sqlsave=mysql_query($quesave);
			
			//echo "$quesave <br>";
			
			//echo $sistole;
			}
			else
			{
			//Simpan hasil diagnosa - matikan koding ini saat pengujian
			$quesave="insert into diagnosa (id_user, nama, jk, tgl_lahir, tgl_periksa, kd_penyakit, tekanan_darah, riwayat_fibrilasi_atrium,merokok, kolesterol,diabetes,aktivitas_fisik,diet,riwayat_keluarga) values 
			('".$datauser['id_user']."','$nama','$jk','$tgl_lahir','".date("Y-m-d")."','".implode(",",$arrayHasil[$t][0]['name'])."','$sistole/$diastole','".$dfb['tingkat_faktor_resiko']."','".$dm['tingkat_faktor_resiko']."',$kol,$guldar,'".$daf['tingkat_faktor_resiko']."',$bb/(($tb/100)*($tb/100)),'".$dwt['tingkat_faktor_resiko']."')";
			//$sqlsave=mysql_query($quesave);
			
			//echo "$quesave <br>";
			}
			
			//Tampilkan hasil diagnosa
			$sqlp=mysql_query("SELECT * FROM penyakit WHERE kd_penyakit IN ('".implode("','",$arrayHasil[$t][0]['name'])."')");
			while($rsp=mysql_fetch_array($sqlp)){
			?>
            	<div class="panel panel-success hasil">
                    <div class="panel-heading"><?php echo $rsp['resiko_stroke']; ?></div>
                    <div class="panel-body">
                        <div class=""></div>
                        <div><strong>Keterangan : </strong>Tingkat resiko <?php echo $rsp['resiko_stroke']; ?> diperoleh dari nilai densitas terakhir yang paling besar yaitu <strong><?php echo number_format($arrayHasil[$t][0]['value'],5, '.', ''); ?></strong></div>
                    </div>
                </div>
        	<?php } ?>
            <h4>Detail Perhitungan</h4>
			<?php
            for($hk=1;$hk<count($gejalas);$hk++){
                if($hk==1) {
                    echo "<h5>Kombinasi m".$hk." dan m".($hk+1)."</h5>";
                } else {
                    echo "<h5>Kombinasi m".($hk+1)." dan m".($hk+2)."</h5>";
                }
            ?>
                <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Penyakit</th>
                        <th class="text-right">Nilai</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $num = 1;
                    foreach ($arrayHasil[$hk] as $hValue)  {
                        //Ambil nama penyakit dr database
                        $sqlpn=mysql_query("SELECT kd_penyakit, resiko_stroke FROM penyakit WHERE kd_penyakit in ('".implode("','",$hValue['name'])."')");
                        $penyakitHasil = array();
                        while($rspn=mysql_fetch_array($sqlpn)){
                            array_push($penyakitHasil, $rspn['resiko_stroke']." (".$rspn['kd_penyakit'].")");
                        }
                        $penyakit = "&theta;";
                        if(strlen(implode(", ",$penyakitHasil)) > 0) $penyakit = implode(", ",$penyakitHasil);
                        //show hide detail
                        echo "<tr><td>".$num."</td><td>".$penyakit."</td><td class='text-right'>".number_format($hValue['value'],5, '.', '')."</td></tr>";
                        $num++;
                    }
                    ?>
                </tbody>
                </table>
                <?php } ?>
            
            <br>
         	<?php 
		} else {
			$gejala = explode(':',$gejalas[0]);//tampilan jika memmasukkan 1 gejala
			$sql=mysql_query("SELECT gejala_penyakit.id, gejala_penyakit.kd_penyakit, gejala_penyakit.kd_gejala, gejala_penyakit.nilai, penyakit.resiko_stroke, penyakit.deskripsi FROM gejala_penyakit INNER JOIN penyakit ON gejala_penyakit.kd_penyakit = penyakit.kd_penyakit WHERE kd_gejala='$gejala[0]' ORDER BY nilai DESC");
			while($rs=mysql_fetch_array($sql)){
			?>
                <div class="panel panel-success hasil">
                    <div class="panel-heading"><?php echo $rs['resiko_stroke']; ?></div>
                    <div class="panel-body">
                        <div class=""></div>
                        <div><strong>Keterangan : </strong>Tingkat resiko <?php echo $rs['resiko_stroke']; ?> diperoleh dari nilai posterior terbesar yaitu <strong><?php echo $rs['nilai']; ?></strong></div>
                    </div>
                </div>
        	<?php	
			
		}
		echo '</div></div><br>';
	
		}
		
	}
	
	function sortByValue($a, $b) {
		if($a['value']==$b['value']) return 0; //pengrutan hasil kombinasi terakhir dari besar ke kecil
    	return $a['value'] < $b['value']?1:-1;
	}
	include "bawah.php"; 

?>
</div>
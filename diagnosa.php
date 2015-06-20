<div class="container">
	<?php 
	session_start();
		include "function/configuration.php"; 
		//include "atas.php";
	?>
    <script src="css/jquery.min.js"></script>
<script src="css/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="css/jsDatePick.min.1.3.js"></script>
<script type="text/javascript" src="css/jquery-1.2.3.pack.js"></script>
<script>
$(document).ready(function(){

    window.onload = function(){
		new JsDatePick({
			useMode:2,
			cellColorScheme:"armygreen",
			target:"TTL",
			dateFormat:"%Y-%m-%d"
		});
	};

}
</script>
	<form id="form-diagnosa" method="post" class="form-horizontal" action="diagnosa_proses.php">
    <div align="left">
    <h3>Deteksi Dini Penyakit Stroke</h3>
    </div>
    <div id="msg"></div>
    <br>
    <div class="row">
        <div class="col-sm-8">
            <div class="row mb20">
                <div class="col-sm-3">
                    <label class="control-label">Nama</label>
                </div>
                <div class="col-md-5 col-sm-7">
                    <input type="text" class="form-control" id="nama" name="nama" >
                </div>
            </div>

            <div class="row mb20">
                <div class="col-sm-3">
                    <label class="control-label">Jenis Kelamin</label>
                </div>
                <div class="col-md-5 col-sm-7">
                    <select class="form-control" title="Jenis kelamin harus dipilih" id="jk" name = "jk" ><option value="">-- Pilih Jenis Kelamin --</option>
                            <option value="P">Perempuan</option>
                            <option value="L">Laki-laki</option>
                        </select>                
                 </div>
            </div>

            <div class="row mb20">
                <div class="col-sm-3">
                    <label class="control-label">Tanggal Lahir</label>
                </div>
                <div class="col-md-5 col-sm-7">
                    <input class="form-control" id="tgl_lahir" type="text" name="tgl_lahir" width="200" >
                </div>
            </div>
        </div>
    </div>
    <div class="row" align="left">
        <div class="col-md-8">
    <h4>Silahkan masukkan faktor resiko pasien beresiko stroke:</h4>

        <table>
        <tr>
            <td>
            Tekanan Darah
            </td>
            <td>
            <input id="tds" name="tds"> <input id="tdd" name="tdd">
            </td>
        </tr>
        <tr>
            <td>Riwayat Fibrilasi Atrium</td>
            <td>
            <select class="required" title="Riwayat fibrilasi atrium harus dipilih" id="fibrilasi_atrium" name = "fibrilasi_atrium" >
            <?php
        		$resultKB = mysql_query("SELECT * FROM gejala where nama_gejala = 'Riwayat Fibrilasi Atrium'");
				while ($dataKB = mysql_fetch_array($resultKB))
	        	{
        	?>
		        <option value = "<?php echo $dataKB['id_gejala']; ?>"><?php echo $dataKB['tingkat']; ?></option>
        	<?php
		        }
        	?>
        	</select>
            </td>
        </tr>  
        <tr>
            <td>Merokok</td>
            <td>
            <select class="required" title="Riwayat keluarga harus dipilih" id="perokok" name = "perokok" >
            <option value="">-- Pilih merokok --</option>
            <?php
        $queryKB = "SELECT * FROM gejala where nama_gejala = 'merokok'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['id_gejala']; ?>"><?php echo $dataKB['tingkat']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr> 
        <tr>
            <td>
            Kolesterol
            </td>
            <td>
            <input id="kolesterol" name="kolesterol">
            </td>
        </tr>   
        <tr>
            <td>
            Diabetes
            </td>
            <td>
            <input id="guldar" name="guldar">
            </td>
        </tr>
        <tr>
            <td>Aktivitas Fisik</td>
            <td>
            <select class="required" title="Aktivitas fisik harus dipilih" id="aktivitas_fisik" name = "aktivitas_fisik" >
            <option value="">-- Pilih aktivitas fisik --</option>
            <?php
        $queryKB = "SELECT * FROM gejala where nama_gejala = 'aktivitas fisik'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['id_gejala']; ?>"><?php echo $dataKB['tingkat']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr>   
        <tr>
            <td>
            Tinggi Badan
            </td>
            <td>
            <input id="tb" name="tb">
            </td>
            </tr> 
            
            <tr>
            <td>
            Berat Badan
            </td>
            <td>
            <input id="bb" name="bb">
            </td>
            </tr>
 	
        <tr>
            <td>Riwayat Keluarga</td>
            <td>
            <select class="required" title="Riwayat keluarga harus dipilih" id="riwayatkeluarga" name = "riwayatkeluarga" >
            <option value="">-- Pilih riwayat keluarga --</option>
            <?php
        $queryKB = "SELECT * FROM gejala where nama_gejala = 'Riwayat Keluarga'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['id_gejala']; ?>"><?php echo $dataKB['tingkat']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr>    	
            <tr > <td colspan="2" align="right">               
            <input type="hidden" name="act" value="add"/>

            <button type="submit">Kirim</button>
            </tr>
        </form>
    
    </table>
    


</form>

            <br><br>
        </div>
        <div class="col-md-3 col-md-offset-1 col-sm-4">
        </div>
    </div>
    	
</div>

<? 		include "bawah.php";
?>
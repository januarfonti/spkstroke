<?php
session_start();
?>
<script src="css/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="css/jsDatePick.min.1.3.js"></script>
<script type="text/javascript" src="css/jquery-1.2.3.pack.js"></script>
<script type="text/javascript" src="css/jquery.validate.pack.js"></script>
<script>

$(document).ready(function(){

	$('#form').validate({
        rules: {
            nilai: {
		  required: true,
		  range: [0, 1]
		}
        }
    });

	$("#update").click(function(){
		var bad=0;
		var id	= $("#id").val();
		var kd_penyakit	= $("#kd_penyakit").val();
		var kd_gejala 	= $("#kd_gejala").val();
		var nilai 	= $("#nilai").val();
		$('#form :input').each(function(){ 
			if($(this).val() == "") 
			bad++; 
		});
		
		if (bad>0) {
			bad++; 
			$("#form").submit();
		}
		else {
			$.ajax({
			url	  	: "function/aturan_action.php?aksi=update&id="+id+"&kd_penyakit="+kd_penyakit+"&kd_gejala="+kd_gejala+"&nilai="+nilai,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "aturan.php";
			}
			});

		} 
	});
		
});

window.onload = function(){
		new JsDatePick({
			useMode:2,
			cellColorScheme:"armygreen",
			target:"TTL",
			dateFormat:"%Y-%m-%d"
		});
	};

</script>
<style type="text/css">
input { padding: 3px; border: 1px solid #999; }
input.error, select.error { border: 1px solid red; }
label.error {
	color: red;
	display: block;
}
td { padding: 5px; }
</style>
<?php include "atas.php";
include "function/configuration.php";

$id = $_GET['id'];

//query untuk menampilkan isi field pada form
$query = "select *, a.id as id_aturan from gejala_penyakit a, gejala f, penyakit r
where a.kd_gejala = f.kd_gejala and a.kd_penyakit = r.kd_penyakit and a.id = '$id'";
$result = mysql_query($query);
$data = mysql_fetch_array($result);
?>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3 align="left">Ubah Data Aturan</h3>
<hr></div>
<form name="frmVitamin" id="form">
<table  cellspacing="0" id="tabelku">
      <tr>
    	<td>Resiko Stroke</td><td>
        <? echo $data['resiko_stroke']; ?>
        </td>
    </tr>
      <tr>
    	<td>Faktor Resiko</td><td>
        <? echo $data['tingkat_faktor_resiko']; ?>
        </td>
    </tr>
    <tr>
    	<td>Densitas</td><td><input class="left" title="Densitas berada di nilai 0-1" id="nilai" type="text" name="nilai" width="200" value="<? echo $data['nilai'];?>"/></td>
    </tr>
    <tr>
    	<td align="right" colspan="2"> 
        	<input type="hidden" name="id" id="id" value="<? echo $data['id_aturan'];?>"/>
        	<input type="hidden" name="kd_gejala" id="kd_gejala" value="<? echo $data['kd_gejala'];?>"/>
        	<input type="hidden" name="kd_penyakit" id="kd_penyakit" value="<? echo $data['kd_penyakit'];?>"/>
            <input type="button" id="update" name="btn_simpan" value="Save"/> 
            <input type="reset" value="Reset"/> 
        </td>
        </tr>
        </table>
</form>
<?php include "bawah.php"?>




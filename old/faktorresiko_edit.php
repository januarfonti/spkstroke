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

    $("#form").validate();

	$("#update").click(function(){
		var bad=0;
		var id_faktor				= $("#id_faktor").val();
		var faktor_resiko			= $("#faktor_resiko").val();
		var tingkat_faktor_resiko	= $("#tingkat_faktor_resiko").val();
		
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
			url	  	: "function/faktor_resiko_action.php?aksi=update&id_faktor="+id_faktor+"&faktor_resiko="+faktor_resiko+"&tingkat_faktor_resiko="+tingkat_faktor_resiko,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "faktorresiko.php";
			}
			});
		} 
	});
		
});

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
$query = "select *	from gejala	where id = '$id'";
$result = mysql_query($query);
$data = mysql_fetch_array($result);
?>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3>Ubah Data Faktor Resiko</h3><hr></div>
<form id="form">
<table  cellspacing="0" id="tabelku">
  <tr>
    	<td width="200">ID</td><td><input class="required" title="Nama dusun harus diisi" id="id_faktor" type="text" name="id_faktor" disabled="disabled" width="200"  value="<? echo $data['id'];?>"/></td>
    </tr>
      <tr>
    	<td width="200">Faktor Resiko</td><td><input class="required" title="Faktor resiko harus diisi" id="faktor_resiko" type="text" name="faktor_resiko"  width="200"  value="<? echo $data['faktor_resiko'];?>"/></td>
    </tr>
  <tr> 
    	 <td width="200">Tingkat Faktor Resiko</td><td><input  class="required" title="Tingkat faktor resiko harus diisi" id="tingkat_faktor_resiko" type="text" name="tingkat_faktor_resiko"  width="200"  value="<? echo $data['tingkat_faktor_resiko'];?>"/></td>
    </tr>
  <tr>
    	<td align="right" colspan="2">
        	<input type="hidden" name="id_faktor" class="id_faktor" value="<? echo $data['id_faktor'];?>"/>
            <input type="button" id="update" name="btn_simpan" value="Save"/>
            <input type="reset" value="Reset"/>
        </td>
        </tr>
        </table>
<?php include "bawah.php"?>




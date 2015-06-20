
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
		var id_stroke				= $("#id_stroke").val();
		var resiko_stroke			= $("#resiko_stroke").val();
		var deskripsi				= $("#deskripsi").val();
		
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
			url	  	: "function/resiko_stroke_action.php?aksi=update&id_stroke="+id_stroke+"&resiko_stroke="+resiko_stroke+"&deskripsi="+deskripsi,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "resikostroke.php";
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
$query = "select *	from penyakit	where id  = '$id'";
$result = mysql_query($query);
$data = mysql_fetch_array($result);
echo $query;
?>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3>Ubah Data Resiko Stroke</h3><hr></div>
<form id="form">
<table  cellspacing="0" id="tabelku">
  <tr>
    	<td width="200">ID</td><td><input class="required" title="Nama dusun harus diisi" id="id_stroke" type="text" name="id_stroke" disabled="disabled" width="200"  value="<? echo $data['id'];?>"/></td>
    </tr>
      <tr>
    	<td width="200">Resiko Stroke</td><td><input class="required" title="Faktor resiko harus diisi" id="faktor_resiko" type="text" name="faktor_resiko"  width="200"  value="<? echo $data['resiko_stroke'];?>" disabled="disabled"/></td>
    </tr>
  <tr> 
    	 <td width="200">Deskripsi</td><td><input  class="required" title="Deskripsi harus diisi" id="deskripsi" type="text" name="deskripsi"  width="200"  value="<? echo $data['deskripsi'];?>"/></td>
    </tr>
  <tr>
    	<td align="right" colspan="2">
        	<input type="hidden" name="id_stroke" class="id_stroke" value="<? echo $data['id '];?>"/>
            <input type="button" id="update" name="btn_simpan" value="Save"/>
            <input type="reset" value="Reset"/>
        </td>
        </tr>
        </table>
<?php include "bawah.php"?>




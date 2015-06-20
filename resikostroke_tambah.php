<?php
session_start();
if(!isset($_SESSION['username'])){
	?>
   <script language="JavaScript">alert("Login Terlebih Dahulu");
   				location = "index.php";

   </script>
   
   <?php
}else if($_SESSION['hak_akses']!="admin"){?>
   <script language="JavaScript">alert("Anda bukan admin");
   				location = "index.php";

   </script>
<?php }
include "atas.php";
include "function/configuration.php"; 

?>
<script src="css/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="css/jsDatePick.min.1.3.js"></script>
<script type="text/javascript" src="css/jquery-1.2.3.pack.js"></script>
<script type="text/javascript" src="css/jquery.validate.pack.js"></script>
<script>
$(document).ready(function(){

    $("#form").validate();

	$("#form_simpan").click(function(){
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
			url	  	: "function/resiko_stroke_action.php?aksi=simpan&id_stroke="+id_stroke+"&resiko_stroke="+resiko_stroke+"&deskripsi="+deskripsi,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "resikostroke.php";
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
<?php 

//id_DK
$query = "SELECT max(id_faktor) as maxID_F FROM faktor_resiko";

$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$idMax = $data['maxID_F'];

$noUrut = (int) substr($idMax, 2, 5);
$noUrut++;
$DK = 'G' . sprintf("%03s", $noUrut);


//paging
$dataPerPage = 5;

if(isset($_GET['page']))
{
$noPage = $_GET['page'];
}
else $noPage = 1;
$offset = ($noPage - 1) * $dataPerPage;
?>

</head>
<body>
<h1></h1>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3>Tambah Data Resiko Stroke</h3><hr></div>
<form name="faktor_resiko"  method="post" id="form" >
<table cellspacing="0" id="tabelku">
	<tr>
    	<td>ID</td><td><input class="required" title="ID/Kode harus diisi" id="id_stroke" id="input" type="text" name="id_stroke" width="200" /></td>
    </tr>
	<tr>
    	<td>Resiko Stroke</td><td><input class="required" title="Resiko stroke harus diisi" id="resiko_stroke" id="input" type="text" name="resiko_stroke" width="200" /></td>
    </tr>
	<tr>
    	<td>Deskripsi</td><td><input class="required" title="Deksripsi harus diisi" id="deskripsi" id="input" type="text" name="deskripsi" width="200" /></td>
    </tr>
<tr>
    	
    	<td  colspan="2" align="right">
            <input type="button" name="btn_simpan" value="Save" id="form_simpan"/>
            <input type="reset" value="Reset"/>
        </td>
        </tr>
        </table>
        </form>
        <br />
<br />
<?php include "bawah.php" ?>
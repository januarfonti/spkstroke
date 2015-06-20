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
			url	  	: "function/faktor_resiko_action.php?aksi=simpan&id_faktor="+id_faktor+"&faktor_resiko="+faktor_resiko+"&tingkat_faktor_resiko="+tingkat_faktor_resiko,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "faktorresiko.php";
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
<div id="text"><h3>Tambah Data Faktor Resiko</h3><hr></div>
<form name="faktor_resiko"  method="post" id="form" >
<table cellspacing="0" id="tabelku">
	<tr>
    	<td>ID</td><td><input id="id_faktor" type="text" name="id_faktor" width="200" value="<?php echo $DK; ?>" disabled="disabled"/></td>
    </tr>
	<tr>
    	<td>Faktor Resiko</td><td><input class="required" title="Faktor resiko harus diisi" id="faktor_resiko" id="input" type="text" name="faktor_resiko" width="200" /></td>
    </tr>
	<tr>
    	<td>Tingkat Faktor Resiko</td><td><input class="required" title="Tingkat faktor resiko harus diisi" id="tingkat_faktor_resiko" id="input" type="text" name="tingkat_faktor_resiko" width="200" /></td>
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
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
<?php }?>
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
		var id_user		= $("#id_user").val();
		var nama		= $("#nama").val();
		var jk		 	= $("#jk").val();
		var TTL		 	= $("#TTL").val();
		var pekerjaan 	= $("#pekerjaan").val();
		var username 	= $("#username").val();
		var password 	= $("#password").val();
		var hak_akses 	= $("#hak_akses").val();
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
			url	  	: "function/pengguna_action.php?aksi=update&nama="+nama+"&jk="+jk+"&TTL="+TTL+"&pekerjaan="+pekerjaan+"&username="+username+"&password="+password+"&hak_akses="+hak_akses+"&id_user="+id_user,
			cache 	: false,
			success	: function(msg){
				alert(msg);
				location = "pengguna.php";
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

$id_user = $_GET['id_user'];

//query untuk menampilkan isi field pada form
$query = "select *	from user
		where id_user = '$id_user'";
$result = mysql_query($query);
$data = mysql_fetch_array($result);
?>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3 align="left">Ubah Data Pengguna</h3>
<hr></div>
<form name="frmVitamin" id="form">
<table  cellspacing="0" id="tabelku">
    <tr>
    	<td>Nama</td><td><input class="required" title="Nama harus diisi" id="nama" type="text" name="nama" width="200" value="<? echo $data['nama'];?>"/></td>
    </tr>
<tr>
    	<td width="200">Jenis Kelamin</td><td>
        <select class="required" title="Jenis kelamin harus dipilih" name = "jk" id="jk">
	<?php
	$queryKB = "SELECT DISTINCT jk FROM user ORDER BY jk ASC";
	$resultKB = mysql_query($queryKB);
	$dataKB = mysql_fetch_array($resultKB);
	?>
<option value="P" <?php if($data['jk'] == "P")echo "selected=true";?>>Perempuan</option>
<option value="L"  <?php if($data['jk'] == "L")echo "selected=true";?>>Laki-laki</option>
    </select>
    </td>
    </tr>    
    <tr>
    	<td>Tanggal</td><td><input class="required" title="Tanggal harus diisi" id="TTL" type="text" name="TTL" width="200" value="<? echo $data['tgl_lahir'];?>"/></td>
    </tr>
    <tr>
    	<td>Pekerjaan</td><td><input class="required" title="Pekerjaan harus diisi" id="pekerjaan" type="text" name="pekerjaan" width="200" value="<? echo $data['pekerjaan'];?>"/></td>
    </tr>
    <tr>
    	<td>Username</td><td><input class="required" title="Username harus diisi" id="username" type="text" name="username" width="200" value="<? echo $data['username'];?>"/></td>
    </tr>
    <tr>
    	<td>Password</td><td><input class="required" title="Password harus diisi" id="password" type="text" name="password" width="200" value="<? echo $data['password'];?>"/></td>
    </tr>
    <tr>
    	<td width="200">Hak Akses</td><td>
        <select class="required" title="Hak akses harus dipilih" name = "hak_akses" id="hak_akses">
	<?php
	$queryKB = "SELECT DISTINCT hak_akses FROM user ORDER BY hak_akses ASC";
	$resultKB = mysql_query($queryKB);
	$dataKB = mysql_fetch_array($resultKB);
	?>
<option value="admin" <?php if($data['hak_akses'] == "admin")echo "selected=true";?>>Admin</option>
<option value="pakar"  <?php if($data['hak_akses'] == "pakar")echo "selected=true";?>>Pakar</option>
<option value="dokterumum"  <?php if($data['hak_akses'] == "dokterumum")echo "selected=true";?>>Dokter Umum</option>
    </select>
    </td>
    </tr>    

    <tr>
    	<td align="right" colspan="2"> 
        	<input type="hidden" name="id_user" id="id_user" value="<? echo $data['id_user'];?>"/>
            <input type="button" id="update" name="btn_simpan" value="Save"/> 
            <input type="reset" value="Reset"/> 
        </td>
        </tr>
        </table>
</form>
<?php include "bawah.php"?>




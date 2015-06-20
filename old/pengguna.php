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

	$("#form_simpan").click(function(){
		var bad=0;
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
				url	  	: "function/pengguna_action.php?aksi=simpan&nama="+nama+"&jk="+jk+"&TTL="+TTL+"&pekerjaan="+pekerjaan+"&username="+username+"&password="+password+"&hak_akses="+hak_akses,
				cache 	: false,
				success	: function(msg){
					alert(msg);
					location.reload();
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



function del(id_user, nama)
{
if (confirm("Anda yakin akan menghapus '" + nama + "' ?"))
{
window.location.href = 'function/pengguna_action.php?aksi=delete&id_user=' + id_user;
}
}
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
$dataPerPage = 5;

if(isset($_GET['page']))
{
$noPage = $_GET['page'];
}

else $noPage = 1;
$offset = ($noPage - 1) * $dataPerPage;

$key = $_POST['key'];
$combo = $_POST['combo'];
		
if($key == ""){
	$query = "select * from user
					LIMIT $offset, $dataPerPage";
					}
else if($key != ""){
	$query = "select * from user
					where $combo LIKE '%$key%'
					order by nama asc
					LIMIT $offset, $dataPerPage";
}
		
		//eksekusi query
$result = mysql_query($query) or die('Error');
?>
     <div id="text"><h3>Tambah Data Pengguna</h3><hr></div>
<form id="form">
<table cellspacing="0" id="tabelku">
	<tr rowspan="2" scope="col">

    </tr>
    <tr>
    	<td>Nama</td><td><input class="required" title="Nama harus diisi" id="nama" type="text"/></td>
    </tr>
        <tr>
    	<td width="200">Jenis Kelamin</td><td><select class="required" title="Jenis kelamin harus dipilih" id="jk" name = "jk"><option value="">-- Pilih Jenis Kelamin --</option>
        <option value="P">Perempuan</option>
        <option value="L">Laki-laki</option>
	</select>
    </td>
    </tr>
    	<tr>
    	<td>Tanggal Lahir</td><td><input class="required" title="TTL harus diisi" id="TTL" type="text" name="TTL" width="200" /></td>
    </tr>
    <tr>
    	<td>Pekerjaan</td><td><input class="required" title="Pekerjaan harus diisi" id="pekerjaan" type="text" name="pekerjaan"/></td>
    </tr>
    <tr>
    	<td>Username</td><td><input class="required" title="Username harus diisi" id="username" type="text" name="username"/></td>
    </tr>
    <tr>
    	<td>Password</td><td><input class="required" title="Password harus diisi" id="password" type="text" name="password"/></td>
    </tr>
    <tr>
    	<td width="200">Hak Akses</td><td><select class="required" title="Hak akses harus dipilih" id="hak_akses" name = "hak_akses"><option value="">-- Pilih Hak Akses --</option>
        <option value="admin">Admin</option>
        <option value="pakar">Pakar</option>
        <option value="dokterumum">Dokter Umum</option>
	</select>
    </td>
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


<div id="text"><h3>Data Pengguna</h3><hr>
        <form action="pengguna.php" method="post"  />
        Cari:
        <select name="combo">
         <option value="nama">Nama Pengguna</option>
        </select>
        <input type="text" name="key" width="200" />
        <input type="submit" name="btn_cari" src="img/Search-icon.png" width="20" size="20"/>
        </form></div><br />
      <table cellspacing="0" id="tabelku"><tbody>
      <tr>

        <th scope="col">Nama</th>
        <th scope="col">Jenis Kelamin</th>
        <th scope="col">Tanggal Lahir</th>
        <th scope="col">Pekerjaan</th>
        <th scope="col">Username</th>
        <th scope="col">Password</th>
        <th scope="col">Hak Akses</th>
        <th scope="col">Pilihan</th>
        </tr>
     <?php
//looping data untuk menampilkan data hasil query
while ($data = mysql_fetch_array($result))
{
?>
	<tr>
    	<td class="alts"><?php echo $data['nama'];?></td>
    	<td class="alts"><?php echo $data['jk'];?></td>
    	<td class="alts"><?php echo $data['tgl_lahir'];?></td>
    	<td class="alts"><?php echo $data['pekerjaan'];?></td>
    	<td class="alts"><?php echo $data['username'];?></td>
    	<td class="alts"><?php echo $data['password'];?></td>
    	<td class="alts"><?php echo $data['hak_akses'];?></td>
        <td nowrap class="alts">
        	<a href="pengguna_edit.php?id_user=<?php echo $data['id_user'];?>"><img src="img/16109144-cartoon-red-pencil.jpg" width="30" height="30"</a>
            <a href="javascript:del('<?php echo $data['id_user'];?>','<?php echo $data['nama'];?>')"><img src="img/Remove-icon.png" width="30" height="30" /></a>
			</td>
        </tr>
<?php
}
?>
<tr>
<td colspan="8">
<center>
<?php
if($key == ""){
	$query = "select COUNT(*) AS jumData from user";
					}
else if($key != ""){
	$query = "select COUNT(*) AS jumData from user
					where $combo LIKE '%$key%'";
}


//$query   = "SELECT COUNT(*) AS jumData FROM data_vitamin";

$hasil  = mysql_query($query);

$data     = mysql_fetch_array($hasil);
$jumData = $data['jumData'];

// menentukan jumlah halaman yang muncul berdasarkan jumlah semua data

$jumPage = ceil($jumData/$dataPerPage);

// menampilkan link previous

if ($noPage > 1) echo  "<a href='".$_SERVER['PHP_SELF']."?page=".($noPage-1)."'>&lt;&lt; Prev</a>";

// memunculkan nomor halaman dan linknya

for($page = 1; $page <= $jumPage; $page++)
{
if ((($page >= $noPage - 3) && ($page <= $noPage + 3)) || ($page == 1) || ($page == $jumPage))
{
if (($showPage == 1) && ($page != 2))  echo "...";
if (($showPage != ($jumPage - 1)) && ($page == $jumPage))  echo "...";
if ($page == $noPage) echo " <b>".$page."</b> ";
else echo " <a href='".$_SERVER['PHP_SELF']."?page=".$page."'>".$page."</a> ";
$showPage = $page;
}
}
// menampilkan link next

if ($noPage < $jumPage) echo "<a href='".$_SERVER['PHP_SELF']."?page=".($noPage+1)."'>Next &gt;&gt;</a>";
?>
</center>
</td>
</tr>

</tbody>
</table>
<br>
		<?php include "bawah.php" ?>
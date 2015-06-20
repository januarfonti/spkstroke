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

	$("#form_simpan").click(function(){
		var bad=0;
		var kd_gejala			= $("#kd_gejala").val();
		var kd_penyakit		 	= $("#kd_penyakit").val();
		var nilai		 	= $("#nilai").val();
		
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
				url	  	: "function/aturan_action.php?aksi=simpan&kd_gejala="+kd_gejala+"&kd_penyakit="+kd_penyakit+"&nilai="+nilai,
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



function del(id, nama)
{
if (confirm("Anda yakin akan menghapus '" + nama + "' ?"))
{
window.location.href = 'function/aturan_action.php?aksi=delete&id=' + id;
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
$dataPerPage = 10;

if(isset($_GET['page']))
{
$noPage = $_GET['page'];
}

else $noPage = 1;
$offset = ($noPage - 1) * $dataPerPage;

$key = $_POST['key'];
$combo = $_POST['combo'];
		
if($key == ""){
	$query = "select *, a.id as id_aturan from gejala_penyakit a, gejala f, penyakit r
where a.kd_gejala = f.kd_gejala and a.kd_penyakit = r.kd_penyakit
					LIMIT $offset, $dataPerPage";
					}
else if($key != ""){
	$query = "select *, a.id as id_aturan from gejala_penyakit a, gejala f, penyakit r
where a.kd_gejala = f.kd_gejala and a.kd_penyakit = r.kd_penyakit
					and $combo LIKE '%$key%'
					LIMIT $offset, $dataPerPage";
}
		
		//eksekusi query
$result = mysql_query($query) or die('Error');
?>
     <div id="text"><h3>Tambah Data Aturan</h3><hr></div>
<form id="form">
<table cellspacing="0" id="tabelku">
	<tr rowspan="2" scope="col">

    </tr>
	<tr>
    	<td>Faktor Resiko</td>
        <td>
        <select class="required" title="Faktor resiko harus dipilih" id="kd_gejala" name = "kd_gejala" >
        <option value="">-- Faktor Resiko --</option>
        <?php
	$queryKB = "SELECT * FROM gejala";
	$resultKB = mysql_query($queryKB);
	while ($dataKB = mysql_fetch_array($resultKB))
	{
	?>
	<option value = "<?php echo $dataKB['kd_gejala']; ?>"><?php echo $dataKB['tingkat_faktor_resiko']; ?></option>
	<?php
	}
	?>
	</select></td>
    </tr>    	
<tr>
    	<td>Resiko Stroke</td>
        <td>
        <select class="required" title="Resiko stroke harus dipilih" id="kd_penyakit" name = "kd_penyakit" >
        <option value="">-- Resiko Stroke --</option>
        <?php
	$queryKB = "SELECT * FROM penyakit";
	$resultKB = mysql_query($queryKB);
	while ($dataKB = mysql_fetch_array($resultKB))
	{
	?>
	<option value = "<?php echo $dataKB['kd_penyakit']; ?>"><?php echo $dataKB['resiko_stroke']; ?></option>
	<?php
	}
	?>
	</select></td>
    </tr>    	
    <tr>
    	<td>Densitas</td><td><input type="text" title="Nilai densitas antara 0-1" class="left" id="nilai" name="nilai"></td>
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


<div id="text"><h3>Data Aturan</h3><hr>
        <form action="aturan.php" method="post"  />
        Cari:
        <select name="combo">
         <option value="resiko_stroke">Resiko Stroke</option>
         <option value="tingkat_faktor_resiko">Faktor Resiko</option>
        </select>
        <input type="text" name="key" width="200" />
        <input type="submit" name="btn_cari" src="img/Search-icon.png" width="20" size="20"/>
        </form></div><br />
      <table cellspacing="0" id="tabelku"><tbody>
      <tr>

        <th scope="col">Resiko Stroke</th>
        <th scope="col">Faktor Resiko</th>
        <th scope="col">Densitas</th>
        <th scope="col">Pilihan</th>
        </tr>
     <?php
//looping data untuk menampilkan data hasil query
while ($data = mysql_fetch_array($result))
{
?>
	<tr>
    	<td class="alts"><?php echo $data['resiko_stroke'];?></td>
    	<td class="alts"><?php echo $data['kd_gejala'];?> - <?php echo $data['tingkat_faktor_resiko'];?></td>
    	<td class="alts"><?php echo $data['nilai'];?></td>
        <td nowrap class="alts">
        	<a href="aturan_edit.php?id=<?php echo $data['id_aturan'];?>"><img src="img/16109144-cartoon-red-pencil.jpg" width="30" height="30"</a>
            <a href="javascript:del('<?php echo $data['id_aturan'];?>','<?php echo $data['resiko_stroke'];?>','<?php echo $data['tingkat_faktor_resiko'];?>')"><img src="img/Remove-icon.png" width="30" height="30" /></a>
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
	$query = "select COUNT(*) AS jumData from gejala_penyakit";
					}
else if($key != ""){
	$query = "select COUNT(*) AS jumData from gejala_penyakit a, gejala f, penyakit r
where a.kd_gejala = f.kd_gejala and a.kd_penyakit = r.kd_penyakit
					and $combo LIKE '%$key%'";
}


//$query   = "SELECT COUNT(*) AS jumData FROM data_vitamin";
//echo $query;

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
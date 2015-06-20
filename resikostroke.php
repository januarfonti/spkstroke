<?php
session_start();
include "atas.php";
include "function/configuration.php"; 

?>
<script src="css/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="css/jsDatePick.min.1.3.js"></script>
<script>
function del(id_stroke, resiko_stroke)
{
if (confirm("Anda yakin akan menghapus '" + resiko_stroke + "' ?"))
{
window.location.href = 'function/resiko_stroke_action.php?aksi=delete&id_stroke=' + id_stroke;
}
}

window.onload = function(){
		new JsDatePick({
			useMode:2,
			cellColorScheme:"armygreen",
			target:"inputField",
			dateFormat:"%Y-%m-%d"
		});
	};
</script>
<?php 

//paging
$dataPerPage = 5;

if(isset($_GET['page']))
{
$noPage = $_GET['page'];
}
else $noPage = 1;
$offset = ($noPage - 1) * $dataPerPage;

//pencarian
$key = $_POST['key'];
$combo = $_POST['combo'];
		
if($key == ""){
	$query = "select * from penyakit	
						LIMIT $offset, $dataPerPage
						";
					}
else if($key != ""){
	$query = "select select * from penyakit where
						$combo LIKE '%$key%'
						LIMIT $offset, $dataPerPage";
}
		//eksekusi query
$result = mysql_query($query) or die('Error');
?>

</head>
<body>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<div id="text"><h3>Data Resiko Stroke</h3><hr>

        <form action="resikostroke.php" method="post"  />
         <div id="box">
      
        <div id="search">Cari:
        <select name="combo">
         <option value="resiko_stroke">Resiko Stroke</option>
         <option value="deskripsi">Deskripsi</option>
        </select>
        <input type="text" name="key" width="200" />
        <input type="submit" name="btn_cari" src="img/Search-icon.png" width="20" size="20"/>
        </div>
  </div>
        </form></div><br /><br />

      <table cellspacing="0" id="tabelku"><tbody>
      <tr>
      	<th scope="col">ID</th>
        <th scope="col" width="150">Resiko Stroke</th>
        <th scope="col">Deskripsi</th>
        </tr>
     <?php
//looping data untuk menampilkan data hasil query
while ($data = mysql_fetch_array($result))
{
?>
	<tr>
        <td class="alt"><?php echo $data['id'];?></td>
    	<td class="alts"><?php echo $data['resiko_stroke'];?></td>
    	<td class="alts"><?php echo $data['deskripsi'];?></td>
        </tr>
        
<?php
}
?>
<tr>
<td colspan="11">
<center>
<?php
if($key == ""){
 $query   = "select count(*) as jumData
						from penyakit ";
				}
else{
 $query   = "select count(*) as jumData
						from penyakit
						where $combo LIKE '%$key%'
						";
}

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
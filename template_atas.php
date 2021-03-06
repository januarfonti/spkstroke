<?php
  include 'config/koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SPK Stroke</title>

    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
    <link href="dist/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <!-- NAVBAR -->
   <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i class="fa fa-binoculars"></i> Sistem Pendukung Keputusan Deteksi Dini Stroke</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-hdd-o"></i> Master Data <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="?page=dm_user"><i class="fa fa-users"></i> Master Data User</a></li>
                  <!--<li><a href="?page=dm_datalatih"><i class="fa fa-child"></i> Master Data Latih</a></li>-->
                  <li><a href="?page=dm_bobot"><i class="fa fa-pencil-square"></i> Master Bobot</a></li>
                  <!--<li><a href="?page=dm_k"><i class="fa fa-pie-chart"></i> Master Data Range (K)</a></li>-->
                </ul> 
              </li>
              <li><a href="?page=dm_datauji"><i class="fa fa-th-list"></i> Data Uji</a></li>
              <li><a href="?page=dm_laporan"><i class="fa fa-newspaper-o"></i> Laporan</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-user"></i> User <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="logout.php"><i class="fa fa-power-off"></i> Logout</a></li>
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
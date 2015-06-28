<?php include 'template_atas.php'; ?>

      <div class="panel panel-default">
	  <div class="panel-heading">
	    <h3 class="panel-title">Diagnosa</h3>
	  </div>
	  <div class="panel-body">
	  		<form class="form-horizontal" action="proses_diagnosa.php" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Tekanan Darah</label>
			    <div class="col-sm-10">
				    <div class='row'>
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Atas...' class='form-control col-md-6' name='darahatas' required></div>
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Bawah...' class='form-control' name='darahbawah' required></div>
                	</div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Diabetes</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" placeholder="Diabetes" name="diabetes" required>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Riwayat Keluarga</label>
			    <div class="col-sm-10">
			    <?php
	        		$query = mysql_query("SELECT * FROM gejala where nama_gejala = 'Riwayat Keluarga'");
					while ($row = mysql_fetch_array($query))
		        	{
	        	?>
			        <div class="radio">
					  <label>
					    <input type="radio" name="riwayat_keluarga" value="<?php echo $row['skor']; ?>" required>
					    <?php echo $row['tingkat']; ?>
					  </label>
					</div>
	        	<?php
			        }
	        	?>
				</div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Merokok</label>
			    <div class="col-sm-10">
			    <?php
	        		$query = mysql_query("SELECT * FROM gejala where nama_gejala = 'Merokok'");
					while ($row = mysql_fetch_array($query))
		        	{
	        	?>
			        <div class="radio">
					  <label>
					    <input type="radio" name="merokok" value="<?php echo $row['skor']; ?>" required>
					    <?php echo $row['tingkat']; ?>
					  </label>
					</div>
	        	<?php
			        }
	        	?>
				</div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Kolestrol</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" placeholder="Kolestrol" name="kolestrol" required>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Aktivitas Fisik</label>
			    <div class="col-sm-10">
			    <?php
	        		$query = mysql_query("SELECT * FROM gejala where nama_gejala = 'Aktivitas Fisik'");
					while ($row = mysql_fetch_array($query))
		        	{
	        	?>
			        <div class="radio">
					  <label>
					    <input type="radio" name="aktivitasfisik" value="<?php echo $row['skor']; ?>" required>
					    <?php echo $row['tingkat']; ?>
					  </label>
					</div>
	        	<?php
			        }
	        	?>
				</div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Barat Badan</label>
			    <div class="col-sm-10">
				    <div class='row'>
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Berat Badan' class='form-control col-md-6' name='beratbadan' required></div>
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Tinggi Badan' class='form-control' name='tinggibadan' required></div>
	                </div>
	                <div class='row'>
	                    <div class='col-xs-6'>Kg</div>
	                    <div class='col-xs-6'>Cm</div>
	                </div>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">Riwayat Fibrilasi Atrium</label>
			    <div class="col-sm-10">
			    <?php
	        		$query = mysql_query("SELECT * FROM gejala where nama_gejala = 'Riwayat Fibrilasi Atrium'");
					while ($row = mysql_fetch_array($query))
		        	{
	        	?>
			        <div class="radio">
					  <label>
					    <input type="radio" name="riwayatfibrilasi" value="<?php echo $row['skor']; ?>" required>
					    <?php echo $row['tingkat']; ?>
					  </label>
					</div>
	        	<?php
			        }
	        	?>
				</div>
			  </div>

			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Simpan</button>
			    </div>
			  </div>
			</form>
	  </div>
	</div>

<?php include 'template_bawah.php'; ?>
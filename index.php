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
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Atas...' class='form-control col-md-6' name='darahatas'></div>
	                    <div class='col-xs-6'><input type='text' id='basicinput' placeholder='Bawah...' class='form-control' name='darahbawah'></div>
                	</div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Diabetes</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" placeholder="Diabetes" name="diabetes">
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
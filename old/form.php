<html>
<head>
    </head>
    <?php
    include "function/configuration.php";
?>    
    <body>
        <table border="1">
        <form action="perhitungan.php" method="post" >
        <tr>
            <th>
            Tekanan Darah
            </th>
            <td>
            <input id="tds" name="tds"> <input id="tdd" name="tdd">
            </td>
        </tr>
        <tr>
            <td>Riwayat Fibrilasi Atrium</td>
            <td>
            <select class="required" title="Riwayat fibrilasi atrium harus dipilih" id="fibrilasi_atrium" name = "fibrilasi_atrium" >
            <option value="">-- Pilih riwayat fibrilasi atrium --</option>
            <?php
        $queryKB = "SELECT * FROM faktor_resiko where faktor_resiko = 'riwayat fibrilasi atrium'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['idgejala']; ?>"><?php echo $dataKB['tingkat_faktor_resiko']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr>  
        <tr>
            <td>Merokok</td>
            <td>
            <select class="required" title="Riwayat keluarga harus dipilih" id="perokok" name = "perokok" >
            <option value="">-- Pilih merokok --</option>
            <?php
        $queryKB = "SELECT * FROM faktor_resiko where faktor_resiko = 'merokok'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['idgejala']; ?>"><?php echo $dataKB['tingkat_faktor_resiko']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr> 
        <tr>
            <th>
            Kolesterol
            </th>
            <td>
            <input id="kolesterol" name="kolesterol">
            </td>
        </tr>   
        <tr>
            <th>
            Diabetes
            </th>
            <td>
            <input id="guldar" name="guldar">
            </td>
        </tr>
        <tr>
            <td>Aktivitas Fisik</td>
            <td>
            <select class="required" title="Aktivitas fisik harus dipilih" id="aktivitas_fisik" name = "aktivitas_fisik" >
            <option value="">-- Pilih aktivitas fisik --</option>
            <?php
        $queryKB = "SELECT * FROM faktor_resiko where faktor_resiko = 'aktivitas fisik'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['idgejala']; ?>"><?php echo $dataKB['tingkat_faktor_resiko']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr>   
        <tr>
            <th>
            Tinggi Badan
            </th>
            <td>
            <input id="tb" name="tb">
            </td>
            </tr> 
            
            <tr>
            <th>
            Berat Badan
            </th>
            <td>
            <input id="bb" name="bb">
            </td>
            </tr>
 	
        <tr>
            <td>Riwayat Keluarga</td>
            <td>
            <select class="required" title="Riwayat keluarga harus dipilih" id="riwayatkeluarga" name = "riwayatkeluarga" >
            <option value="">-- Pilih riwayat keluarga --</option>
            <?php
        $queryKB = "SELECT * FROM faktor_resiko where faktor_resiko = 'Riwayat Keluarga Stroke'";
        $resultKB = mysql_query($queryKB);
        while ($dataKB = mysql_fetch_array($resultKB))
        {
        ?>
        <option value = "<?php echo $dataKB['idgejala']; ?>"><?php echo $dataKB['tingkat_faktor_resiko']; ?></option>
        <?php
        }
        ?>
        </select></td>
        </tr>    	
            
            
        
            
            
            
            <tr><th>               
            <input type="hidden" name="act" value="add"/>
			<input type="submit" value="Kirim!"></th></tr>
        </form>
    
    </table>
    
    </body>
</html>
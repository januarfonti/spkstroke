<?php


function returnsame($array1,$array2){
    $temp = array();
    $len1 = count($array1);
    $len2 = count($array2);
    if($len2 != $len1){
        if($len1 > $len2){
            $result = array_diff($array1, $array2);
            foreach($array1 as $val){
                if(!in_array($val,$result)){
                    $temp[]=$val;
                }
            }
        }else{
            $result = array_diff($array2, $array1);
            foreach($array2 as $val){
                if(!in_array($val,$result)){
                    $temp[]=$val;
                }
            }
        }
        $result = $temp;
    }else{
        $result = $array1;
    }
    return $result;
}

if($_REQUEST['act']=='add'){
    //var_dump($_REQUEST);die;
    $arrgejala = substr($_REQUEST['arraygejala'], 0, -1);

    $arrgejala = explode(',',$arrgejala);

    $text ="<br> Nama Pengguna : ".$_SESSION['logged_in_user'];
    $text .="<br> Tanggal Diagnosa : ".date('d-m-Y')." <br>";

    $combine = array();
    $densitas = 0;

    if(count($arrgejala)>1){
        $cnt = 1;
        $length = count($arrgejala);
        foreach($arrgejala as $key=>$val){
            $res = mysql_query("select * from gejala where idgejala='".$val."'");
            $gejala = mysql_fetch_assoc($res);

            $text .="<br><br> Gejala ".($key+1)." : ".$gejala['nama'];

            //list penyakit yang memiliki gejala bersangkutan
            $que="select a.*,p.nama,count(a.idgejala) as jumlah,sum(CAST(a.densitas AS DECIMAL(10,2))) as jumdens from aturan a left join gejala g on g.idgejala=a.idgejala left join penyakit p on p.idpenyakit=a.idpenyakit where a.idgejala in ($val) group by a.idpenyakit order by jumlah desc,jumdens desc";
			
            $res=mysql_query($que);
            while($row=mysql_fetch_assoc($res)){
                $penyakit[]=$row['nama'];
                $idpenyakit[]=$row['idpenyakit'];
                if($row['densitas']>$densitas)$densitas=$row['densitas'];
            }

            $combine[$cnt]['idpenyakit'] = implode(',',$idpenyakit);
            $combine[$cnt]['densitas']['id'] = $idpenyakit;
            $combine[$cnt]['densitas']['value'] = $densitas;
            $combine[$cnt]['teta']['id'] = 'teta';
            $combine[$cnt]['teta']['value'] = 1 - $densitas;

            //penyakit
            $tempc['id']=$idpenyakit;
            $tempc['value']=$densitas;
            $tempcombine[$cnt][]=$tempc;

            //teta
            $tempc['id']=array('teta');
            $tempc['value']=1-$densitas;
            $tempcombine[$cnt][]=$tempc;


            $text .="<br> Penyakit yang memungkinkan yaitu ".implode(',',$penyakit)." .";
            $text .="<br> m".$cnt."{".implode(',',$penyakit)."} = ".$densitas;
            $text .="<br> m".$cnt."{teta} = ".(1-$densitas);

            if($cnt==1){
                $tempid[]=$idpenyakit;
                $tempid[]=array('teta');
                $tempdens[]=$densitas;
                $tempdens[]=1-$densitas;
            }

            if($cnt>1){
                $text.="<br> Hitungan kombinasi m".($cnt+1);

                //hitung kombinasi

                //temp kombinasi
                $zzz = count($tempid);
                for($itung=0;$itung<$zzz;$itung++){
                    for($itg=0;$itg<2;$itg++){
                        if(!in_array('teta',$tempcombine[$cnt][$itg]['id']) && !in_array('teta',$tempid[$itung])){
                            $tempid[] = returnsame($tempid[$itung],$tempcombine[$cnt][$itg]['id']);
                            $tttt[$cnt][] = returnsame($tempid[$itung],$tempcombine[$cnt][$itg]['id']);
                        }else{
                            if(in_array('teta',$tempcombine[$cnt][$itg]['id'])){
                                $tempid[] = $tempid[$itung];
                                $tttt[$cnt][] = $tempid[$itung];
                            }else{
                                $tempid[] = $tempcombine[$cnt][$itg]['id'];
                                $tttt[$cnt][] = $tempcombine[$cnt][$itg]['id'];
                            }
                        }
                        $tempdens[] = $tempdens[$itung] * $tempcombine[$cnt][$itg]['value'];
                        $aaa[$cnt][] = $tempdens[$itung] * $tempcombine[$cnt][$itg]['value'];

                        /*if($cnt==4){
                            echo $tempdens[$itung]."*".$tempcombine[$cnt][$itg]['value'];
                            echo "<br>";
                            var_dump(json_encode($tempcombine));
                        }*/
                    }
                }


                //rearray $tttt
                foreach($tttt as $k=>$v){
                       foreach($v as $r){
                           sort($r);
                           $t[$k][implode(',',$r)]=$r;
                       }
                }
                $tttt = $t;

                for($itung=0;$itung<$zzz;$itung++){
                    unset($tempid[$itung]);
                    unset($tempdens[$itung]);
                }
                $tempid=array_values($tempid);
                $tempdens=array_values($tempdens);

                //sorting
                for($itung=0;$itung<count($tempid);$itung++){
                    sort($tempid[$itung]);
                }

                //group
                for($itung=0;$itung<count($tempid);$itung++){
                    $tempo[implode(',',$tempid[$itung])][]=$tempdens[$itung];
                }

                //rearrange array
                foreach($tempo as $k=>$v){
                    $jumlah = 0;
                    $temporaryid [] = explode(',',$k);
                    foreach($v as $row){
                        $jumlah = $jumlah + $row;
                    }
                    $temporarydens [] = $jumlah ;
                    $zzzz[$cnt][] = $jumlah;
                }

                $tempid = $temporaryid;
                $tempdens = $temporarydens;

                //tes
                /*if($cnt==4){
                    echo "<pre>";
                    echo $zzz;
                    echo "<br/>";
                    echo "tempcombine : <br/>";
                    var_dump($tempcombine);
                    echo "<br/>";
                    echo "tempid <br/>";
                    var_dump($tempid);
                    echo "<br/>";
                    echo "tempdens <br/>";
                    var_dump($tempdens);
                    echo "<br/>";
                    echo "tempo <br/>";
                    var_dump($tempo);
                    echo "<br/>";
                    echo "tttt <br/>";
                    var_dump($tttt);
                    echo "zzzz <br/>";
                    var_dump($zzzz);
                    echo "<br/>";
                    echo "aaa <br/>";
                    var_dump($aaa);
                    echo "</pre>";
                }*/

                //get max densitas
                $maxxx = 0;
                $idp = 0;
                foreach($tempdens as $k=>$r){
                        if($r>$maxxx)
                        {
                            $maxxx=$r;
                            $idp=$k;
                        }
                }

                //get teta
                foreach($tempid as $k=>$v){
                    if(in_array('teta',$v)){
                        $idxteta = $k;
                    }
                }

                //hasil diagnosa penyakit
                if($length == $key+1){
                    $idhasilpenyakit = $tempid[$idp];
                }

                //tabel kombinasi

                $text.="<table cellpadding='0' id='tSortable_2' cellspacing='0' width='100%' class='table'>";
                $text.= "<tr>";
                $text.= "<td width='25%'>&nbsp;</td>";
                $text.= "<td width='37%'>{".implode(',',$tempcombine[$cnt][0]['id'])."}".$tempcombine[$cnt][0]['value']."</td>";
                $text.= "<td width='37%'>{".implode(',',$tempcombine[$cnt][1]['id'])."}".$tempcombine[$cnt][1]['value']."</td>";
                $text.= "</tr>";
                $text.= "<tr>";
                $text.= "<td colspan='3'>";

                $aaa[$cnt] = array_chunk($aaa[$cnt],2);
                $xyz = 0;
                $i = $j = 0;

                $text.="<table cellpadding='0' id='tSortable_2' cellspacing='0' width='100%' class='table'>";
                $text.= "<tr>";
                $text.= "<td width='24.5%'>";
                $text.="<table cellpadding='0' id='tSortable_2' cellspacing='0' width='100%' class='table'>";

                if($cnt>2){
                foreach($tttt[$cnt-1] as $y=>$r){
                    $text.= "<tr>";
                    $text.="<td>{".$y."}".$zzzz[$cnt-1][$xyz]."</td>";
                    $text.= "</tr>";
                    $xyz++;
                }
                }else{
                    foreach($tempcombine[$cnt-1] as $g){
                        $text.= "<tr>";
                        $text.="<td>{".implode(',',$g['id'])."}".$g['value']."</td>";
                        $text.= "</tr>";
                    }
                }

                $text.= "</table>";
                $text.= "</td>";
                $text.= "<td colspan='2'>";
                $text.="<table cellpadding='0' id='tSortable_2' cellspacing='0' width='100%' class='table'>";
                foreach($aaa[$cnt] as $x){
                    $text.= "<tr>";
                    foreach($x as $k=>$v){
                        $text.="<td width='37%'>".$v."</td>";
                    }
                    $text.= "</tr>";
                }
                $text.="</table>";

                $text.= "</td>";
                $text.= "</tr>";
                $text.= "</table>";
                $text.= "</td>";
                $text.= "</tr>";
                $text.= "</table>";

                $text .="<br> m".($cnt+1)."{".implode(',',$tempid[$idp])."} = ".$maxxx;
                $text .="<br> m".($cnt+1)."{teta} = ".$tempdens[$idxteta];
            }

            $penyakit = array();
            $idpenyakit = array();
            $tempteta = $temporaryid = $temporarydens = $tempo = array();
//            $tempteta = $tempdens = $tempid = array();
            $densitas = 0;
            $cnt++;
        }

        $idhasilpenyakit = "'".implode("','",$idhasilpenyakit)."'";
        $que = mysql_query("select * from penyakit where idpenyakit in (".$idhasilpenyakit.")");
        while($row = mysql_fetch_array($que)){
            $nmpeny [] = $row['nama'];
        }

        $text .= "<br><br> Hasil diagnosa mendekati penyakit ".implode(',',$nmpeny);

    }elseif(count($arrgejala)==1){
        $res = mysql_query("select * from gejala where idgejala='".$arrgejala[0]."'");
        $gejala = mysql_fetch_assoc($res);

        $text .="<br> Gejala ".($key+1)." : ".$gejala['nama'];

        //list penyakit yang memiliki gejala bersangkutan
        $que="select a.*,p.nama,count(a.idgejala) as jumlah,sum(CAST(a.densitas AS DECIMAL(10,2))) as jumdens from aturan a left join gejala g on g.idgejala=a.idgejala left join penyakit p on p.idpenyakit=a.idpenyakit where a.idgejala in (".$arrgejala[0].") group by a.idpenyakit order by jumlah desc,jumdens desc";

        $res=mysql_query($que);
        /*while($row=mysql_fetch_assoc($res)){
            if($row['densitas']>$densitas){
                $densitas=$row['densitas'];
            }
        }

        while($row=mysql_fetch_assoc($res)){
            if($row['densitas']=$densitas){
                $densitas=$row['densitas'];
                $penyakit[]=$row['nama'];
            }
        }*/

        $text .= "<br> Penyakit yang memungkinkan : ";

        while($row=mysql_fetch_assoc($res)){
            $text .= "<br> -  ".$row['nama']." ( ".$row['densitas']." )";
            $penyakit[]=$row['nama'];
        }

        /*$text .= "<br> Densitas terbesar yaitu ".$densitas;
        $text .= "<br> Hasil diagnosa mendekati penyakit ".implode(',',$penyakit);*/
        $nmpeny = $penyakit;

    }

    //history
    $argejala = implode("','",$arrgejala);
    $argejala = "'".$argejala."'";
    $res = mysql_query("select * from gejala where idgejala in (".$argejala.")");
    $namagejala = '';
    while($row=mysql_fetch_array($res)){
        $namagejala[] = $row['nama'];
    }

    $res = mysql_query("insert into history (userid,nama,gejala,hasildiagnosa) values(".$_SESSION['userid'].",'".$_SESSION['logged_in_user']."','".implode(',',$namagejala)."','".implode(',',$nmpeny)."')");


}

$res=mysql_query("select * from pasien");
$res2=mysql_query("select * from gejala");
?>
<script type="text/javascript">
    var arrgejala="";
    function addGejala(){
        var nama = $("#gejala option:selected").text();
        var txt = $("textarea#listgejala");
        var gejala = $('#gejala').val();
        if(arrgejala.indexOf(gejala) === -1){
            arrgejala+=gejala+",";
            txt.val( txt.val() + "\n" + nama);
            $("#arraygejala").val(arrgejala);
        }
        //console.log(arrgejala);
    }

    function cetak(){
//        var doc = new jsPDF();
//        doc.setFontSize(14);
//        doc.text(20, 20, $('#cetak').html());
//        doc.output('dataurl');
        w=window.open();
        w.document.write($('#cetak').html());
        w.print();
        w.close();
    }

    function demoFromHTML() {
        var pdf = new jsPDF('p','in','letter')

            , source = $('#cetak')[0]  // This is your HTML Div to generate pdf


            , specialElementHandlers = {

                '#bypassme': function(element, renderer){

                    return true
                }
            }

        pdf.fromHTML(
            source // HTML string or DOM elem ref.
            , 0.5 // x coord
            , 0.5 // y coord
            , {
                'width':7.5 // max width of content on PDF
                ,'elementHandlers': specialElementHandlers
            }
        )
        pdf.output('dataurl')
    }
</script>
<div class="row-fluid">
    <div class="span12">
        <div class="head">
            <div class="isw-documents"></div>
            <h1>Diagnosa</h1>
            <div class="clear"></div>
        </div>
        <div class="block-fluid">
            <form class="form-horizontal" enctype="multipart/form-data" method="post" action="index.php?page=diagnosa">
                <input type="hidden" name="act" value="add"/>
                <input type="hidden" name="arraygejala" id="arraygejala" value=""/>
                <div class="row-form">
                    <div class="span2">Gejala</div>
                    <div class="span3">
                        <select name="gejala" id="gejala" >
                            <?php
                            while($row=mysql_fetch_array($res2)){
                                ?>
                                <option value="<?=$row['idgejala']?>"><?=$row['idgejala']?> - <?=$row['nama']?> </option>
                            <?php
                            }
                            ?>
                        </select>

                    </div>
                    <button type="button" onclick="addGejala()"><i class="icon-plus"></i></button>
                    <div class="clear"></div>
                </div>
                <div class="row-form">
                    <div class="span2"></div>
                    <div class="span4">
                        <textarea name="listgejala" style="overflow: auto;" id="listgejala" required="" readonly="" ><?=$_REQUEST['listgejala']?> </textarea>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="row-form">
                    <div class="span2"></div>
                    <div class="span6"><button class="btn btn-primary" type="submit">Diagnosa</button></div>
                    <div class="clear"></div>
                </div>
                <div class="row-form">
                    <div class="span2">Perhitungan Diagnosa</div>
                    <div class="span10">
                        <div id="cetak">
<!--                            <textarea name="hitungdiagnosa" class="uneditable-textarea" style="overflow: auto; min-height: 500px;" id="hitungdiagnosa" readonly="" >--><?//=$text?><!--</textarea>-->
                            <div class="block-fluid table-sorting" style="padding:20px;">
                                <?=$text?>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="row-form">
                    <div class="span2"></div>
                    <div class="span6"><button class="btn btn-primary" type="button" onclick="cetak();">Cetak</button></div>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
</div>
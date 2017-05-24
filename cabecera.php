<?php
// Obtenemos el fichero de idioma
require_once 'idioma.php';
$lang = "idioma/cabecera_$idioma.php";
require_once $lang;
?>

<div class="col-md-12">
    <div class="col-md-3 text-left">
        <a href="http://www.comdes.gva.es" title="COMDES" id="COMDES" target="_blank">
            <img src="img/comdes2.png" alt="COMDES" title="COMDES" />
        </a>
    </div>
    <div class="col-md-6 text-center">
        <img src="img/fondocomdes.png" alt="COMDES" title="COMDES" />
    </div>
    <div class="col-md-3 text-right">
        <a href="http://www.hisenda.gva.es" title="Hisenda" id="Hisenda" target="_blank">
            <img src="img/logo_chap.png" alt="Hisenda" title="Hisenda" />
        </a>
    </div>
</div>
<div class="col-md-12">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <?php
                        if ($idioma == "es"){
                        ?>
                            <p class="navbar-text"><?php echo $txtcast;?>
                        <?php
                        }
                        else{
                        ?>
                            <a href="#" title="Castellano" id="castellano"><?php echo $txtcast;?></a>
                        <?php
                        }
                        ?>
                    </li>
                    <li>
                        <?php
                        if ($idioma == "va"){
                        ?>
                            <p class="navbar-text"><?php echo $txtval;?>
                        <?php
                        }
                        else{
                        ?>
                            <a href="#" title="Valencià" id="valencia"><?php echo $txtval;?></a>
                        <?php
                        }
                        ?>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

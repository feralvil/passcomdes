<?php
// Obtenemos el fichero de idioma
require_once 'idioma.php';
$lang = "idioma/index_$idioma.php";
require_once $lang;
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $titulo; ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Cargamos el CSS de Bootstrap -->
    <link rel="StyleSheet" type="text/css" href="css/bootstrap.css">

    <!-- JavaScript: Bootstrap y jQyery -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Funciones jQuery -->
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div id="header" class="row">
            <?php require_once 'cabecera.php'; ?>
        </div>
        <form name="formidioma" id="formidioma" method="post" action="index.php">
        <?php
        if (isset($_POST['update'])){
        ?>
            <input name="update" type="hidden" value="<?php echo $_POST['update'];?>">
            <input name="mensflash" type="hidden" value="<?php echo $_POST['mensflash'];?>">
        <?php
        }
        ?>
        </form>
        <h1><?php echo $h1; ?></h1>
        <?php
        $imprimeform = TRUE;
        if (isset($_POST['update'])){
            if ($_POST['update'] == 'OK'){
                $alert = 'alert-success';
                $span = 'glyphicon-ok';
                $imprimeform = FALSE;
            }
            else{
                $alert = 'alert-warning';
                $span = 'glyphicon-alert';
                if ($_POST['error'] == 'PASSUPDATE'){
                    $imprimeform = FALSE;
                }
            }
        ?>
            <div class="row">
                <div class="col-md-10 col-md-offset-1 alert alert-dismissible <?php echo $alert;?>">
                    <span class="glyphicon <?php echo $span;?>" aria-hidden="true"></span> &mdash; <?php echo $_POST['mensflash'];?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
            </div>
        <?php
        }
        if ($imprimeform){
        ?>
            <form name="formacceso" id="formacceso" method="post" action="password_update.php">
                <input type="hidden" name="errlongpass" id="errlongpass" value="<?php echo $errlongpass;?>" />
                <input type="hidden" name="errpassigual" id="errpassigual" value="<?php echo $errpassigual;?>" />
                <input type="hidden" name="erralfanum" id="erralfanum" value="<?php echo $erralfanum;?>" />
                <legend><?php echo $h2acceso; ?></legend>
                <fieldset>
                    <div class="form-group col-md-4 has-error">
                        <label for="inputlogin"><?php echo $txtuser; ?></label>
                        <input type="text" name="login" class="form-control" id="inputlogin" required>
                    </div>
                    <div class="form-group col-md-4 has-error">
                        <label for="inputpassword"><?php echo $txtpassword; ?></label>
                        <input type="password" name="password" class="form-control" id="inputpassword" required>
                    </div>
                </fieldset>
                <legend><?php echo $h2password; ?></legend>
                <fieldset>
                    <div class="form-group col-md-4 has-error">
                        <label for="inputnewpass"><?php echo $txtnewpass; ?></label>
                        <input type="password" name="inputnewpass" class="form-control" id="inputnewpass" required placeholder="<?php echo $passmin; ?>">
                    </div>
                    <div class="form-group col-md-4 has-error">
                        <label for="inputnewconf"><?php echo $txtnewconf; ?></label>
                        <input type="password" name="inputnewconf" class="form-control" id="inputnewconf" required placeholder="<?php echo $passmin; ?>">
                    </div>
                </fieldset>
                <div class="form-group text-center">
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="submit" class="btn btn-default" id="botguardar" title="<?php echo $botguardar;?>">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> <?php echo $botguardar;?>
                        </button>
                        <button type="reset" class="btn btn-default" id="botcancel" title="<?php echo $botcancel;?>">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> <?php echo $botcancel;?>
                        </button>
                    </div>
                </div>
            </form>
        <?php
        }
        else{
        ?>
            <div class="row text-center">
                <a href="https://intranet.comdes.gva.es/cvcomdes/" title="<?php echo $botintranet;?>" class="btn btn-default">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <?php echo $botintranet;?>
                </a>
            </div>
        <?php
        }
        ?>
    </div>
</body>
</html>

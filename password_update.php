<?php
// Obtenemos el fichero de idioma
require_once 'idioma.php';
$lang = "idioma/passupdate_$idioma.php";
require_once $lang;
// Conexión a la BBDD:
require_once 'conectabbdd.php';
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
</head>
<body>
    <?php
    require_once 'sql_passupdate.php';
    ?>
    <div class="container-fluid">
        <h1><?php echo $h1; ?></h1>
        <form name="formupdate" id="formupdate" action="index.php" method="POST">
            <input name="error" type="hidden" value="<?php echo $error;?>">
            <input name="update" type="hidden" value="<?php echo $update;?>">
            <input name="mensflash" type="hidden" value="<?php echo $mensflash;?>">
        </form>
        <!-- Funciones jQuery -->
        <script type="text/javascript">
            $(function(){
                // Envíar formulario
                $("form#formupdate").submit();
            });
        </script>
        <noscript>
            <input type="submit" value="verify submit">
        </noscript>
    </div>
</body>
</html>

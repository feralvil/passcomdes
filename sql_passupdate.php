<?php
// Validaciones
$res_update = true;
$error = "NADA";
if ($_POST['login'] == ""){
    $res_update = false;
    $menserror .= ': ' . $errloginvac;
    $error = "LOGINVAC";
}
if (($res_update)&&($_POST['password'] == "")){
    $res_update = false;
    $menserror .= ': ' . $errpassvac;
    $error = "PASSVAC";
}
if (($res_update)&&($_POST['inputnewpass'] == "")){
    $res_update = false;
    $menserror .= ': ' . $errnewpassvac;
    $error = "PASSNEWVAC";
}
if (($res_update) && (strlen($_POST['inputnewpass']) < 6)){
    $res_update = false;
    $menserror .= ': ' . $errlongpass;
    $error = "PASSNEWCONF";
}
if (($res_update) && ($_POST['inputnewpass'] != $_POST['inputnewconf'])){
    $res_update = false;
    $menserror .= ': ' . $errpassigual;
    $error = "PASSIGUAL";
}
if (($res_update) && (!(ctype_alnum($_POST['inputnewpass'])))){
    $res_update = false;
    $menserror .= ': ' . $erralfanum;
    $error = "PASSALFANUM";
}
// Comprobamos si el usuario/contraseña es válido:
if ($res_update){
    $sql_flota = 'SELECT * FROM flotas WHERE (flotas.LOGIN = "' . $_POST['login'] .'") AND (flotas.PASSWORD = "' . $_POST['password'] . '")';
    $res_flota = mysqli_query($link, $sql_flota) or die($errsqlflota . ': ' . mysqli_error($link));
    $nflota = mysqli_num_rows($res_flota);
    if ($nflota > 0){
        $flota = mysqli_fetch_assoc($res_flota);
        mysqli_free_result($res_flota);
        $idflota = $flota['ID'];
        $mensok = sprintf($mensaje, $flota['FLOTA']);
        if ($flota['PASSRESET'] == 'PDTE'){
            $fecha = date('Y-m-d');
            $sql_update = 'UPDATE flotas SET PASSWORD = "' . $_POST['inputnewpass'] . '", PASSRESET = "SI",';
            $sql_update .= ' PASSUPDATE = "' . $fecha . '" WHERE ID = ' . $idflota;
            $res_update = mysqli_query($link, $sql_update) or die($errsqlupdate . ': ' . mysqli_error($link));
        }
        elseif ($flota['PASSRESET'] == 'NO'){
            $res_update = false;
            $menserror .= ': ' . $errnoupdate;
            $error = "PASSUPDATE";
        }
        else{
            $res_update = false;
            $menserror .= ': ' . $errpassupdate . ' ' . $flota['PASSUPDATE'];
            $error = "PASSUPDATE";
        }
    }
    else {
        $res_update = false;
        $menserror .= ': ' . $errloginpass;
        $error = "PASSFLOTA";
    }
}
if ($res_update){
    $mensflash = $mensok;
    $update = "OK";
}
else{
    $mensflash = $menserror;
    $update = "KO";
}
?>

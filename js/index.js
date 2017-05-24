/*
Funciones Javascript para flotas_acceso.php
*/

$(function(){
    //Cambio de idioma - VA:
    $("a#valencia").click(function(){
        // Modificamos la cookie de idioma:
        document.cookie = "idioma=va";
        $("form#formidioma").submit();
    });
    //Cambio de idioma - ES:
    $("a#castellano").click(function(){
        // Modificamos la cookie de idioma:
        document.cookie = "idioma=es";
        $("form#formidioma").submit();
    });
    // Validar formulario
    $("form#formacceso").submit(function(e){
        var valido = true;
        var error = '';
        var password = $('input#inputnewpass').val();
        var passconf = $('input#inputnewconf').val();
        var longpass = password.length;
        // Comprobamos longitud de contraseña
        if (password.length < 6){
            error = $('input#errlongpass').val();
            valido = false;
            $('input#inputnewpass').focus();
        }
        // Comprobamos si contraseña y confirmación coinciden
        if ((valido) && (password != passconf)){
            error = $('input#errpassigual').val();
            valido = false;
            $('input#inputnewpass').focus();
        }
        // Comprobamos si la contraseña es alfanumérica:
        var Exp = /^([0-9]|[a-z])+([0-9a-z]+)$/i;
        if ((valido) && (!password.match(Exp))){
            error = $('input#erralfanum').val();
            valido = false;
            $('input#inputnewpass').focus();
        }

        if(!valido) {
            alert(error);
            e.preventDefault();
        }
    });
});

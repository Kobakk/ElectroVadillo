<?php

class SesionController{
    public function iniciaSesion(){

        if( isset($_POST['ok']) ){
            if( empty($_POST['eCorreo']) || empty($_POST['pwd']) ){
                $_SESSION['error'] =  "Especifica correo y contraseña.";
            } else {
                $expReg = '/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[?@¿]).{8,15}/';
                if( !filter_var($_POST['eCorreo'], FILTER_VALIDATE_EMAIL ) ||
                    !preg_match($expReg, $_POST['pwd']) ) {
                    $_SESSION['error'] = "Formatos incorrectos.";
                } else{
                    require_once __DIR__ . '/../Repositorio/ClienteRepositorio.php';
                    $cliente = (new ClienteRepositorio())->getClientebyEcorreo($_POST['eCorreo']);
                    if( !password_verify($_POST['pwd'], $cliente['pwd']) ){
                        $_SESSION['error'] = "La contraseña no coincide.";
                    } else{
                        $_SESSION['cliente']['id'] = $cliente['id'];
                        $_SESSION['cliente']['nombre'] = $cliente['nombre'];
                        $_SESSION['cliente']['eCorreo'] = $cliente['eCorreo'];
                    }
                }
            }
            header('Location: index.php?ctl=inicio');
        }         
    }

    public function cierraSesion(){
        unset($_SESSION['cliente']);
        session_destroy();
        header('Location: index.php?ctl=inicio');
    }
}
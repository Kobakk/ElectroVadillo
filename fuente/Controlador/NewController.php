<?php

class NewController{
    public function useData(){
        $_SESSION['usuario2']['nuevosDatos'] = $_GET['nuevosDatos'];
        $_SESSION['usuario2']['id'] = $_GET['id'];
        header('Location: index.php?ctl=inicio');
    }
    public function limpiarDatos(){
        session_unset();
        header('Location: index.php?ctl=inicio');
    }
    public function nuevoID(){//Limpiar ID
        $_SESSION['usuario2']['id'] = '';
        header('Location: index.php?ctl=inicio'); 
    }
    public function limpiarFormulario(){
        $_SESSION['formulario'] = 'noVisible';
        header('Location: index.php?ctl=inicio');
    }
    public function añadirArticulo(){
        require_once __DIR__ . '/../Modelo/Dato.php';
        if(isset( $_SESSION['usuario2'])){
           (new Dato($_SESSION['usuario2']));
        }
    }
    public function eliminarNuevoID(){ //EliminarID
        unset($_SESSION['usuario2']['id']);
        header('Location: index.php?ctl=inicio');
    }
}
<?php

$mapeoRutas = [
    //Inicio
    'inicio' => ['controller' => 'DefaultController', 'action' => 'inicio'],
    'artByCat' => ['controller' => 'ArticuloController', 'action' => 'mostrarArticulos'],
    'infArt' => ['controller' => 'ArticuloController', 'action' => 'mostrarInfArtXVenta'],
    //Session
    'login' => ['controller' => 'SesionController', 'action' => 'iniciaSesion'],
    'logout' => ['controller' => 'SesionController', 'action' => 'cierraSesion'],
    //Pedido-Compra
    'venta' => ['controller' => 'PedidoController', 'action' => 'addPedido'],
    'finPedido' => ['controller' => 'FacturaController', 'action' => 'makeFactura'],
    //Prueba
    'nuevaPagina' => ['controller' => 'NewController', 'action' => 'useData'],
    'limpiarDatos' => ['controller' => 'NewController', 'action' => 'limpiarDatos'],
    'nuevoID' => ['controller' => 'NewController', 'action' => 'nuevoID'],
    'limpiarFormulario' => ['controller' => 'NewController', 'action' => 'limpiarFormulario'],
    'eliminarID' => ['controller' => 'NewController', 'action' => 'eliminarNuevoID']
  ];
 
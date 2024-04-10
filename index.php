<?php
session_start();//Session
error_reporting(E_ALL);//Manejo de Errores
//Controladores 
require_once __DIR__ . '/fuente/Controlador/DefaultController.inc';
require_once __DIR__ . '/fuente/Controlador/ArticuloController.php'; 
require_once __DIR__ . '/fuente/Controlador/SesionController.php'; 
require_once __DIR__ . '/fuente/Controlador/PedidoController.inc';
require_once __DIR__ . '/fuente/Controlador/FacturaController.php';
require_once __DIR__ . '/fuente/Controlador/NewController.php'; 
//Ubicación del archivo de rutas
require_once __DIR__ . '/app/conf/rutas.inc'; 

//Manejo de URL
if (isset($_GET['ctl'])) {
  if (isset($mapeoRutas[$_GET['ctl']])) {
    $ruta = $_GET['ctl'];
    $param = $_GET['id'] ?? $_GET['codArt'] ?? '';
  } else {
    header('Status: 404 Not Found');
    echo '<html><body><h1>Error 404: No existe la ruta <i>' .
      $_GET['ctl'] .
      '</p></body></html>';
    exit;
  }
} else {
  $ruta = 'inicio';
}
$controlador = $mapeoRutas[$ruta];

// Ejecución del controlador asociado a la ruta
if (method_exists($controlador['controller'], $controlador['action'])) {
  if (empty($param)) {
    call_user_func(array(new $controlador['controller'], $controlador['action']));
  } else {
    call_user_func(array(new $controlador['controller'], $controlador['action']), $param);
  }
} else {
  header('Status: 404 Not Found');
  echo '<html><body><h1>Error 404: El controlador <i>' .
    $controlador['controller'] .
    '->' . $controlador['action'] .
    '</i> no existe</h1></body></html>';
}

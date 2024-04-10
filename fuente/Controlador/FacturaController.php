<?php

class FacturaController
{
    public function makeFactura()
    {
        require_once __DIR__ . '/../Repositorio/FacturaRepositorio.php';
        try {
            (new FacturaRepositorio())->addFactura(
                $_SESSION['idPedido'],
                $_SESSION['cliente']['eCorreo'],
                date('Y-m-d'),
                $_SESSION['total']
            );
            unset($_SESSION['total']);
            unset($_SESSION['idPedido']);
            unset($_SESSION['codArticulo']);
            unset($_SESSION['pv']);
            header('Locaton: index.php?ctl=inicio');
        } catch (\PDOException $ex) {
            echo $ex->getMessage();
        }
    }
}

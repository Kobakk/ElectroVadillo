<?php
class PedidoController{

    public function addPedido(){
        if(isset($_POST['ok'])){
            $lineaPedido = [
                'codArticulo' => $_SESSION['codArticulo'],
                'pv' => $_SESSION['pv'],
                'cantidad'=> $_POST['cantidad'],
            ];
            //var_dump($lineaPedido);
            //Si ya tenemos otro pedido
            require_once __DIR__ . '/../Repositorio/PedidoRepositorio.php';
            require_once __DIR__ . '/../Repositorio/ArticleRepositorio.php';
            if(isset($_SESSION['idPedido']) ){
                try{
                    (new PedidoRepositorio())->addLineaPedido($_SESSION['idPedido'], $lineaPedido);
                    (new ArticleRepositorio())->updateStock($_SESSION['codArticulo'], (int)$lineaPedido['cantidad']);
                    $_SESSION['total'] += (int)$lineaPedido['cantidad'] * (float)$lineaPedido['pv'];
                }catch(\PDOException $ex){
                    echo $ex->getMessage();
                }
            } else{ //Es nuestro primer pedido
                $fecha = date('Y-m-d');//Fecha Actual
                try{
                    $_SESSION['idPedido'] = (new PedidoRepositorio())->addPedidoYLineaPedido($_SESSION['cliente']['id'], $fecha, $lineaPedido);
                    (new ArticleRepositorio())->updateStock($_SESSION['codArticulo'], (int)$lineaPedido['cantidad']);
                    if(isset($_SESSION['total'])){//Si ya hay una cantidad total seteada
                        unset($_SESSION['total']);//La borramos
                    }
                    $_SESSION['total'] = (int)$lineaPedido['cantidad'] * (float)$lineaPedido['pv'];
                } catch(\PDOException $ex){
                    echo $ex->getMessage();
                }


            }
        }
        header('Location: index.php?ctl=inicio');
    }
}
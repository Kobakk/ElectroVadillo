<?php
class PedidoRepositorio{
    public function addPedidoYLineaPedido(int $aIdCliente, string $aFechaPedido, array $aLinPedi): int{
        $sql1 = 'INSERT INTO pedido (idCliente, fPedido) VALUES (:idCliente, :fPedido)';
        $sql2 = 'INSERT INTO lineaPedido (idPedido, codArticulo, cantidad, pv)
                    VALUES (:idPedido, :codArticulo, :cantidad, :pv)';
        try {
            require_once __DIR__ . '/../../Core/ConexionBd.inc';
            $con = (new ConexionBd())->getConexion();
            $con->beginTransaction();

            $snt = $con->prepare($sql1);
            $snt->bindValue(':idCliente', $aIdCliente);
            $snt->bindValue(':fPedido', $aFechaPedido);
            $snt->execute();

            $idPedido = $con->lastInsertId();
            $snt = $con->prepare($sql2);
            $snt->bindValue(':idPedido', $idPedido);
            $snt->bindValue(':codArticulo', $aLinPed['codArticulo']);
            $snt->bindValue(':cantidad', $aLinPed['cantidad']);
            $snt->bindValue(':pv', $aLinPed['pv']);
            $snt->execute();

            $con->commit();
            return $idPedido;
        } catch (\PDOException $ex) {
            $con->rollBack();
            echo $ex->getMessage();
            throw $ex;
        } finally {
            if (isset($snt)) $snt = null;
            if (isset($con)) $con = null;
        }
    }
    public function addLineaPedido(int $aIdPedido, array $aLinPed){
        $sql = 'INSERT INTO lineaPedido (idPedido, codArticulo, cantidad, pv)
                  VALUES (:idPedido, :codArticulo, :cantidad, :pv)';
        try {
            require_once __DIR__ . '/../../Core/ConexionBd.inc';
            $con = (new ConexionBd())->getConexion();
            $snt = $con->prepare($sql);
            $snt->bindValue(':idPedido', $aIdPedido);
            $snt->bindValue(':codArticulo', $aLinPed['codArticulo']);
            $snt->bindValue(':cantidad', $aLinPed['cantidad']);
            $snt->bindValue(':pv', $aLinPed['pv']);
            $snt->execute();
        } catch (\PDOException $ex) {
            throw $ex;
        } finally {
            if (isset($snt)) $snt = null;
            if (isset($con)) $con = null;
        }
    }
}

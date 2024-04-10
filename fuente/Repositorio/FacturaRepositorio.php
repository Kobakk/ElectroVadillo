<?php

class FacturaRepositorio
{
    public function addFactura(int $aIdPedido, string  $aECorreo, string $aFFactura, string $aTota)
    {
        $sql1 = 'INSERT INTO factura (idPedido, eCorreo, fFactura, total)
                  VALUES (:idPedido, :eCorreo, :fFactura, :total)';
        //Insertamos en facturas de manera normal
        $sql2 = 'SELECT MAX(idFactura)
               FROM factura
              WHERE eCorreo = :eCor
                AND fFactura = :fFact
                AND total = :tot';
        // Var = idFactura
        $sql3 = 'SELECT codArticulo, cantidad, pv
               FROM lineaPedido
              WHERE idPedido = :idPed';
        // usamos la variable idFactura para filtrar lineaPedido con ese id

        $sql4 = 'INSERT INTO lineaFactura (idFactura, codigoArticulo, cantidad, pc)
                  VALUES (:idFactura, :codigoArticulo, :cantidad, :pc)';
        //  insertamos en lineaFactura 

        try {
            require_once __DIR__ . '/../../Core/ConexionBd.inc';
            $con = (new ConexionBd())->getConexion();
            $con->beginTransaction();

            $snt = $con->prepare($sql1);
            $snt->bindValue(':idPedido', $aIdPedido);
            $snt->bindValue(':eCorreo', $aECorreo);
            $snt->bindValue(':fFactura', $aFFactura);
            $snt->bindValue(':total', $aTotal);
            $snt->execute();

            $snt = $con->prepare($sql2);
            $snt->bindValue(':eCor', $aECorreo);
            $snt->bindValue(':fFact', $aFFactura);
            $snt->bindValue(':tot', $aTotal);
            $snt->execute();
            //3 consulta id factura ->  2
            $idFactura = $snt->fetchColumn(0);
            $snt = $con->prepare($sql3);
            $snt->bindValue(':idPed', $aIdPedido);
            $snt->execute();

            $lineasPedido = $snt->fetchAll(\PDO::FETCH_ASSOC); //Devolvemos los array

            $codArticulo = '';
            $cantidad = '';
            $pc = '';

            $snt = $con->prepare($sql4);
            $snt->bindValue(':idFactura', $idFactura);
            $snt->bindParam(':codigoArticulo', $codArticulo);
            $snt->bindParam(':cantidad', $cantidad);
            $snt->bindParam(':pc', $pc);

            foreach ($lineasPedido as $numFila => $fila) {
                $codArticulo = $fila['codArticulo'];
                $cantidad = $fila['cantidad'];
                $pc = $fila['pv'];
                $snt->execute();
            }

            $con->commit();
        } catch (\PDOException $ex) {
            $con->rollBack();
            echo $ex->getMessage();
            throw $ex;
        } finally {
            if (isset($snt)) $snt = null;
            if (isset($con)) unset($con);
        }
    }
}

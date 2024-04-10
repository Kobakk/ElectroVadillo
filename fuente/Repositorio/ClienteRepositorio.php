<?php
class ClienteRepositorio{
    public function getClientebyEcorreo(string $eCorreo) : array{
        $sql = 'SELECT c.id, c.nombre, direccion, cP, p.nombre as pueblo, eCorreo, pwd
                FROM cliente AS c INNER JOIN pueblo AS p ON c.idPueblo = p.id
                WHERE eCorreo = :eCorreo';
        try{
            require_once __DIR__ . '/../../Core/ConexionBd.inc';
            $con = (new ConexionBd())->getConexion();
            $snt = $con->prepare($sql);
            $snt->bindValue(':eCorreo', $eCorreo);
            $snt->execute();
            return $snt->fetch(\PDO::FETCH_ASSOC);
        } catch(\PDOException $ex){
            echo $ex->getMessage();
            throw  $ex;
        }finally{
            if( isset($snt)) $snt = null;
            if( isset($con)) $con = null;
        }
    }
}
<?php

class CategoriaRepositorio{
    public function findCategories(): array{
        $sql = "SELECT id, nombre, imagen, descripcion
                FROM categoria";
        require_once __DIR__. '/../../Core/ConexionBd.inc';
        try{
            $con = (new ConexionBd())->getConexion();
            $stn = $con->prepare($sql);
            $stn->execute();
            return $stn->fetchAll(\PDO::FETCH_ASSOC);
        }catch(\PDOException $ex){
            throw $ex;
        }catch(\Exception $ex){
            throw $ex;
        } finally{
            $stn = null;
            $con = null;
        }
    }
}
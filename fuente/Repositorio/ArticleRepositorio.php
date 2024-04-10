<?php
class ArticleRepositorio{
    public function showArticlesByCategory(int $idCategoria){
        $sql = "SELECT codigo, descripcion, pv, stock, reponerA, idCategoria
                FROM articulo WHERE idCategoria =:idCategoria";
        try{
            require_once __DIR__ .'/../../Core/ConexionBd.inc';
            $con = (new ConexionBd())->getConexion();
            $stn = $con->prepare($sql);
            $stn->bindValue(':idCategoria', $idCategoria);
            $stn->execute();
            return $stn->fetchAll(\PDO::FETCH_ASSOC);
        } catch(\PDOException $ex) {
            throw $ex;
        } catch (\Exception $ex) {
            throw $ex;
        } finally{
            $stn = null;
            $con = null;
        }
    }
  public function findArticuloByCodigo(string $codArticulo): Articulo{
    $sql = "SELECT codigo, descripcion, pv, stock, reponerA, idCategoria
              FROM articulo
             WHERE codigo = :codigo";

    require_once __DIR__ . '/../../core/ConexionBd.inc';
    require_once __DIR__ . '/../Modelo/Articulo.inc';

    try {
      $con = (new ConexionBd())->getConexion();
      $stn = $con->prepare($sql);
      $stn->bindValue(':codigo', $codArticulo);
      $stn->execute();
      return new Articulo($stn->fetch(\PDO::FETCH_ASSOC));
    } catch (\PDOException $ex) {
      throw $ex;
    } catch (\Exception $ex) {
      throw $ex;
    } finally {
      $stn = null;
      $con = null;
    }
  }
  public function updateStock(string $codArticulo, int $cantidad){
    $sql = 'UPDATE articulo
               SET stock = stock - :cantidad
             WHERE codigo = :codArt';
    try {
      $con = (new ConexionBd())->getConexion();
      $stn = $con->prepare($sql);
      $stn->bindValue(':cantidad', $cantidad);
      $stn->bindValue(':codArt', $codArticulo);
      $stn->execute();
    } catch (\PDOException $ex) {
      throw $ex;
    } catch (\Exception $ex) {
      throw $ex;
    } finally {
      $stn = null;
      $con = null;
    }
  }
}
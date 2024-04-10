<?php
class ArticuloController{
    public function mostrarArticulos(int $idCategoria){
        require_once __DIR__ . '/../Repositorio/ArticleRepositorio.php';
        $articulos = (new ArticleRepositorio())->showArticlesByCategory($idCategoria);
        require __DIR__ . '/../../app/plantillas/showArticulosByCategoria.inc';
    }
    public function mostrarInfArtXVenta(string $codArticulo){
        require_once __DIR__ . '/../Repositorio/ArticleRepositorio.php';
        $articulo = (new ArticleRepositorio())->findArticuloByCodigo($codArticulo);
        require __DIR__ . '/../../app/plantillas/showArticuloByCodigoXVenta.inc';
    }
}
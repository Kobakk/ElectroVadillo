<?php

class DefaultController
{ public function inicio()
  {
     require_once __DIR__ . '/../Repositorio/CategoriaRepositorio.php';
     $categorias = (new CategoriaRepositorio())->findCategories();
    require __DIR__ . '/../../app/plantillas/inicio.inc';
  }
}

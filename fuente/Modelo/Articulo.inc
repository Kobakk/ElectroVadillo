<?php

class Articulo 
{
  private string $codigo = '';
  private string $descripcion = '';
  private float $pv = 0.0;
  private int $stock = 0;
  private int $reponerA = 0;
  private int $idCategoria = 0;

  public function __construct(array $articulo, bool $nuevo = false)
  {
    if (!$nuevo) {
      $this->codigo = $articulo['codigo'];
      $this->descripcion = $articulo['descripcion'];
      $this->pv = (float)$articulo['pv'];
      $this->stock = (int)$articulo['stock'];
      $this->reponerA = (int)$articulo['reponerA'];
      $this->idCategoria = (int)$articulo['idCategoria'];
    }
  }

  public function setCodigo(string $codigo): void
  {
    $this->codigo = $codigo;
  }

  public function setDescripcion(string $descripcion): void
  {
    $this->descripcion = $descripcion;
  }

  public function setPv(float $pv): void
  {
    $this->pv = $pv;
  }

  public function setStock(int $stock): void
  {
    $this->stock = $stock;
  }

  public function setReponerA(int $reponerA): void
  {
    $this->reponerA = $reponerA;
  }

  public function setidCategoria(int $idCategoria): void
  {
    $this->idCategoria = $idCategoria;
  }


  public function getCodigo(): string
  {
    return $this->codigo;
  }

  public function getDescripcion(): string
  {
    return $this->descripcion;
  }

  public function getPv(): float
  {
    return $this->pv;
  }

  public function getStock(): int
  {
    return $this->stock;
  }

  public function getReponerA(): int
  {
    return $this->reponerA;
  }

  public function getidCategoria(): int
  {
    return $this->idCategoria;
  }

  public function __serialize(): array
  {
    return [
      'codigo' => $this->codigo,
      'descripcion' => $this->descripcion,
      'pv' => $this->pv,
      'stock' => $this->stock,
      'reponerA' => $this->reponerA,
      'idCategoria' => $this->idCategoria,
    ];
  }

  public function __unserialize(array $data): void
  {
      $this->codigo = $data['codigo'];
      $this->descripcion = $data['descripcion'];
      $this->pv = $data['pv'];
      $this->stock = $data['stock'];
      $this->reponerA = $data['reponerA'];
      $this->idCategoria = $data['idCategoria'];
  }
}

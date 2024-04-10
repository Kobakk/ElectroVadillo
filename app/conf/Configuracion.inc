<?php
class Configuracion
{
  private array $params = [
    "driver" => "pdo_sqlsrv",
    "server" => "(local)",
    "port" => "1433",
    "database" => "MaterialesElectricosFinal",
    "user" => null,
    "pass" => null,
    "charset" => "utf-8"
  ];

  public function getParams(): array
  {
    return $this->params;
  }
}

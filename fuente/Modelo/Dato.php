<?php
class Dato{
    private string $id = '';
    private string $codigo = '';

    public function __construct(array $dato, bool $nuevo = false  ){
        if(!$nuevo){
            $this->codigo = $dato['codigo'];
            $this->id = $dato['id'];
        }
    }

    public function setCodigo(string $codigo): void{
        $this->codigo = $codigo;
    }
    public function setId(string $id):void {
        $this->id = $id;
    }
    public function getCodigo():string {
        return $this->codigo;
    }
    public function getId():string {
        return $this->id;
    }
}
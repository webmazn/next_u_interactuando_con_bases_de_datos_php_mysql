<?php
class ConectorDB{
    private $host;
    private $user;
    private $password;
    private $nombre_db;
    private $conexion;

    function __construct(){
        $this->host="localhost";
        $this->user="root";
        $this->password="";
        $this->nombre_db="nextu_final_db";	
    }

    function initConexion(){
        $this->conexion = new mysqli($this->host, $this->user, $this->password, $this->nombre_db);
        if ($this->conexion->connect_error) {
            return "Error:" . $this->conexion->connect_error;
        }else {
            return "OK";
        }        
    }

    function ejecutarQuery($query){
        //echo $query;
        return $this->conexion->query($query);
    }

    function lastInsertID(){
        return $this->conexion->insert_id;    
    }
    function getErrorQuery(){
        return mysqli_error($this->conexion);
    }

    function cerrarConexion(){
        $this->conexion->close();
    }

    function insertData($tabla, $data){
        $sql = 'INSERT INTO '.$tabla.' (';
        $i = 1;
        foreach ($data as $key => $value) {
            $sql .= $key;
            if ($i<count($data)) {
                $sql .= ', ';
            }else $sql .= ')';
            $i++;
        }
        $sql .= ' VALUES (';
        $i = 1;
        foreach ($data as $key => $value) {
            $sql .= $value;
            if ($i<count($data)) {
                $sql .= ', ';
            }else $sql .= ');';
            $i++;
        }
        return $this->ejecutarQuery($sql);
    }

    function getConexion(){
        return $this->conexion;
    }

    function limpiarCadenas($string){
        return $this->conexion->real_escape_string($string);
    }

    function actualizarRegistro($tabla, $data, $condicion){
        $sql = 'UPDATE '.$tabla.' SET ';
        $i=1;
        foreach ($data as $key => $value) {
            $sql .= $key.'='.$value;
            if ($i<sizeof($data)) {
                $sql .= ', ';
            }else $sql .= ' WHERE '.$condicion.';';
            $i++;
        }
        return $this->ejecutarQuery($sql);
    }

    function eliminarRegistro($tabla, $condicion){
        $sql = "DELETE FROM ".$tabla." WHERE ".$condicion.";";
        return $this->ejecutarQuery($sql);
    }

    function consultar($tablas, $campos, $condicion = ""){
        $sql = "SELECT ";
        $ultima_key = end(array_keys($campos));
        foreach ($campos as $key => $value) {
            $sql .= $value;
            if ($key!=$ultima_key) {
                $sql.=", ";
            }else $sql .=" FROM ";
        }
        $ultima_key = end(array_keys($tablas));
        foreach ($tablas as $key => $value) {
            $sql .= $value;
            if ($key!=$ultima_key) {
                $sql.=", ";
            }else $sql .= " ";
        }
        if ($condicion == "") {
            $sql .= ";";
        }else {
            $sql .= $condicion.";";
        }
        return $this->ejecutarQuery($sql);
    }

    function consultaCompuesta($tablas, $campos, $relaciones, $condicion = ""){
        $sql = "SELECT ";
        $ultima_key = end(array_keys($campos));
        foreach ($campos as $key => $value) {
            $sql .= $value;
            if ($key!=$ultima_key) {
                $sql.=", ";
            }else $sql .=" FROM ";
        }
        $sql .= $tablas[0]." ";
        $ultima_key = end(array_keys($tablas));
        foreach ($tablas as $key => $value) {
            if ($key != 0) {
                $sql .= "JOIN ".$value." ON ".$relaciones[$key-1]." \n";
            }
        }
        if ($condicion == "") {
            $sql .= ";";
        }else {
            $sql .= $condicion.";";
        }
        return $this->ejecutarQuery($sql);
    }

    /*
    function newTable($nombre_tbl, $campos){
        $sql = 'CREATE TABLE '.$nombre_tbl.' (';
        $length_array = count($campos);
        $i = 1;
        foreach ($campos as $key => $value) {
            $sql .= $key.' '.$value;
                if ($i!= $length_array) {
                    $sql .= ', ';
                }else {
                    $sql .= ');';
                }
            $i++;
        }
        return $this->ejecutarQuery($sql);
    }

    function nuevaRestriccion($tabla, $restriccion){
        $sql = 'ALTER TABLE '.$tabla.' '.$restriccion;
        return $this->ejecutarQuery($sql);
    }

    function nuevaRelacion($from_tbl, $to_tbl, $from_field, $to_field){
        $sql = 'ALTER TABLE '.$from_tbl.' ADD FOREIGN KEY ('.$from_field.') REFERENCES '.$to_tbl.'('.$to_field.');';
        return $this->ejecutarQuery($sql);
    }
    */    
}
?>  
<?php
include('conector.php');
$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$datos[0] = ["'maycol_630@hotmail.com'","'".password_hash("clave01", PASSWORD_DEFAULT)."'","'Maycol Zambrano Nuñez'","'1986-01-07'"];
$datos[1] = ["'alexis_630@hotmail.com'","'".password_hash("clave02", PASSWORD_DEFAULT)."'","'Ricardo Sanchez Gomez'","'1989-04-17'"];
$datos[2] = ["'zamnun_630@hotmail.com'","'".password_hash("clave03", PASSWORD_DEFAULT)."'","'Fredy Rios Santibañez'","'1990-11-27'"];

if ($response['conexion']=='OK') {
    $response['msg']= "Nos conectamos correctamente <br>";
    foreach($datos as $dato){
        //print_r($data)."<br>";
        foreach($dato as $c => $v){
            //echo $c."-".$v."<br>";
            switch($c){
                case 0: $data['email']=$v; break;
                case 1: $data['clave']=$v; break;
                case 2: $data['nombre']=$v; break;
                case 3: $data['fec_nacimiento']=$v; break;
            }       
        }
        //print_r($data)."<br>";
        if($con->insertData('nu_usuarios', $data)){
            $response['msg']="Exito en la inserción <br>";
        }else {
            $response['msg']= "Hubo un error y los datos no han sido cargados ".$con->getErrorQuery()."<br>";
        }
        echo $response['msg'];
    }
  }else {
    $response['msg']= "No se pudo conectar a la base de datos <br>";
  }
  //echo json_encode($response);
?>

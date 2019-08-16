<?php
session_start();
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$condicion = " id = ".$_POST['id'];

if ($response['conexion']=='OK') {
    if($con->eliminarRegistro('nu_eventos', $condicion)){
        $response['msg'] = 'OK';
    }else{
        $response['msg'] = 'No se eliminó el evento';
    }
}

echo json_encode($response);
$con->cerrarConexion();
?>

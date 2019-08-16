<?php
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$data = array();

$data['fec_inicio'] = "'".$_POST['start_date']."'";
$data['hor_inicio'] = "'".$_POST['start_hour']."'";
$data['fec_fin'] = "'".$_POST['end_date']."'";
$data['hor_fin'] = "'".$_POST['end_hour']."'";

$condicion = " id = ".$_POST['id'];

if ($response['conexion']=='OK') {
    if($con->actualizarRegistro('nu_eventos', $data, $condicion)){
        $response['msg'] = 'OK';
    }else{
        $response['msg'] = 'No se actualizó el evento';
    }
}

echo json_encode($response);
$con->cerrarConexion();
?>

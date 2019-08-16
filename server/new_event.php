<?php
session_start();
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$data = array();

$data['id_usuario'] = $_SESSION['id_user'];
$data['titulo'] ="'". $_POST['titulo']."'";
$data['fec_inicio'] = "'".$_POST['start_date']."'";
$data['hor_inicio'] = "'".$_POST['start_hour']."'";
$data['fec_fin'] = "'".$_POST['end_date']."'";
$data['hor_fin'] = "'".$_POST['end_hour']."'";
$data['dia_completo'] = ($_POST['allDay']=='true')?"'1'":"'0'";

if ($response['conexion']=='OK') {
    if($con->insertData('nu_eventos', $data)){
        $response['msg'] = 'OK';
    }else{
        $response['msg'] = 'No se registraron los datos';
    }
}

echo json_encode($response);
$con->cerrarConexion();
?>

<?php
session_start();
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$id = $_SESSION['id_user'];
$data = array();

if ($response['conexion']=='OK') {
    $resultado_consulta = $con->consultar(['nu_eventos'],['id','titulo','fec_inicio','fec_fin'], 'WHERE id_usuario='.$id);

    if ($resultado_consulta->num_rows != 0) {
        while($fila = $resultado_consulta->fetch_assoc()){
            $data[] = array(
                'id' => $fila['id'],
                'title' => $fila['titulo'],
                'start' => $fila['fec_inicio'],
                'end' => $fila['fec_fin']
            );
        }
        $response['msg'] = 'OK'; // Encontraron '.$resultado_consulta->num_rows.' evento(s)
    }else{
        $response['msg'] = 'No se encontraron eventos';
    }
}
$response['eventos'] = $data;
echo json_encode($response);
$con->cerrarConexion();
?>

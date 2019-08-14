<?php
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$email = $_POST['username'];
$clave = $_POST['password'];

if ($response['conexion']=='OK') {
    $resultado_consulta = $con->consultar(['nu_usuarios'],['email', 'clave'], 'WHERE email="'.$email.'"');

    if ($resultado_consulta->num_rows != 0) {
        $fila = $resultado_consulta->fetch_assoc();
        if (password_verify($clave, $fila['clave'])) {
            $response['acceso'] = 'concedido';
            $response['msg'] = 'OK';
            session_start();
            $_SESSION['username']=$fila['email'];
        }else {
            $response['motivo'] = 'Contraseña incorrecta';
            $response['acceso'] = 'rechazado';
            $response['msg'] = 'ERROR';
        }
    }else{
        $response['motivo'] = 'Email incorrecto';
        $response['acceso'] = 'rechazado';
    }
}
echo json_encode($response);
$con->cerrarConexion();
?>
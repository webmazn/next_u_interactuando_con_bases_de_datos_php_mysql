<?php
require('conector.php');

$con = new ConectorDB();
$response['conexion'] = $con->initConexion();

$email = $_POST['username'];
$clave = $_POST['password'];

if ($response['conexion']=='OK') {
    $resultado_consulta = $con->consultar(['nu_usuarios'],['id','email', 'clave'], 'WHERE email="'.$email.'"');

    if ($resultado_consulta->num_rows != 0) {
        $fila = $resultado_consulta->fetch_assoc();
        if (password_verify($clave, $fila['clave'])) {
            $response['msg'] = 'OK';
            session_start();
            $_SESSION['id_user']=$fila['id'];
            //$_SESSION['username']=$fila['email'];
        }else {
            $response['msg'] = 'Contraseña incorrecta';
        }
    }else{
        $response['msg'] = 'Usuario incorrecto';
    }
}
echo json_encode($response);
$con->cerrarConexion();
?>
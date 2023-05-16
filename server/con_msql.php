<?php
    $conexion = new mysqli("localhost", "root", "", "horarios", 3306);
    if ($conexion->connect_errno) {
        echo "Fallo al conectar a MySQL: (" . $conexion->connect_errno . ") " . $conexion->connect_error;
        return false;
    }
    //echo $conexion->host_info . "\n";
?>
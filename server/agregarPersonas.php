<?php
$personas = json_decode($_POST['personas'], true);
include_once 'con_msql.php';
$resultado = [];
foreach ($personas as $fila) {
    $emp_id = $fila['emp_id'];
    $emp_code = $fila['emp_code'];
    $nombre = $fila['nombre'];
    $apellido = $fila['apellido'];
    $depto = $fila['depto'];
    $sql = "INSERT INTO personal (emp_id, emp_code, nombre, apellido, depto) VALUES ($emp_id, $emp_code, '$nombre', '$apellido', '$depto');";
    if ($conexion->query($sql) === TRUE) {
        $resultado[] = "Datos actualizados o insertados correctamente";
    } else {
        $resultado[] = "Error al actualizar o insertar datos: " . $conexion->error;
    }
}
$conexion->close();
header('Content-type:application/json;charset=utf-8');
echo json_encode(array( "ruta" => $resultado));
?>
<?php
$id = $_POST['id'];
include_once 'conpg.php';
$condicion = array('id' => $id);
$num_eliminadas = pg_delete($conexion, 'horario_empleado', $condicion);
echo json_encode(array( "eliminadas" => $num_eliminadas));
?>
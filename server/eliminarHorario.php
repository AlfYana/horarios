<?php
$id = $_POST['id'];
//include_once 'conpg.php';
if($id)
{
    include_once 'con_msql.php';
    $sql = "DELETE FROM horario_empleado WHERE id = $id;";
    /*$condicion = array('id' => $id);
    $num_eliminadas = pg_delete($conexion, 'horario_empleado', $condicion);*/
    if ($conexion->query($sql) === TRUE) {
        $data = array(
            "mensaje" => "Fila eliminada correctamente",
            "eliminadas" => TRUE,
        );
    } else {
        $data = array(
            "mensaje" => "Error al eliminar la fila: " . $conexion->error,
            "eliminadas" => FALSE,
        );
    }
    $conexion->close();
}
else{
    $data = array(
        "mensaje" => "No Ingreso un valor identificador para buscar",
        "eliminadas" => FALSE,
    );
}
header('Content-type:application/json;charset=utf-8');
echo json_encode(array( "data" => $data));
?>
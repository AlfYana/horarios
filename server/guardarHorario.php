<?php
    $horario    = json_decode($_POST['horario'], true);
    $empleado   = $_POST['empleado'];
    $code       = $_POST['code'];
    /*//libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
    include_once 'conpg.php';*/
    include_once 'con_msql.php';
    $resultado = [];
    foreach($horario as $item)
    {
        $entrada = $item["entrada"];
        $salida  = $item["salida"];
        $dias    = $item["dias"];
        $id      = $item["id_horario"];
        if($id)
        {
            $sql ="UPDATE horario_empleado SET dias = '$dias', entrada = '$entrada', salida = '$salida' WHERE id = $id;";
            /*$data = array(
                'dias' => $dias,
                'entrada' => $entrada,
                'salida' => $salida,
            );
            $condicion = array('id' => $id);
            $res = pg_update($conexion, 'horario_empleado', $data, $condicion);
            $resultado[] = array( 'id' => $id, 'actualizado' => $res);*/
        }
        else
        {
            $sql = "INSERT INTO horario_empleado (emp_id, dias, entrada, salida, code_emp) VALUES ($empleado, '$dias', '$entrada','$salida', $code);";
            /*$result = pg_query($conexion, $sql);
            var_dump($result);
            
            $resultado[] = array('creado' => $res);*/
        }
        if ($conexion->query($sql) === TRUE) {
            $resultado[] = "Datos actualizados o insertados correctamente";
        } else {
            $resultado[] = "Error al actualizar o insertar datos: " . $conexion->error;
        }
    }
    $conexion->close();
    header('Content-type:application/json;charset=utf-8');
    echo json_encode($resultado);
?>
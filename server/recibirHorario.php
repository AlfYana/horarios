<?php
    $horario = json_decode($_POST['horario'], true);
    $empleado = $_POST['empleado'];
    //libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
    include_once 'conpg.php';
    $resultado = [];
    foreach($horario as $item)
    {
        $entrada = $item["entrada"];
        $salida  = $item["salida"];
        $dias    = $item["dias"];
        $id      = $item["id_horario"];
        if($id)
        {
            $data = array(
                'dia' => $dias,
                'entrada' => $entrada,
                'salida' => $salida,
            );
            $condicion = array('id' => $id);
            $res = pg_update($conexion, 'horario_empleado', $data, $condicion);
            $resultado[] = array( 'id' => $id, 'actualizado' => $res);
        }
        else
        {
            $sql = "INSERT INTO horario_empleado (emp_id, dia, entrada, salida) VALUES ($empleado, '$dias', '$entrada','$salida');";
            $result = pg_query($conexion, $sql);
            var_dump($result);
            
            $resultado[] = array('creado' => $res);
        }
    }
    
    echo json_encode($resultado);
?>
<?php
include_once 'conpg.php';
$query = "  SELECT * FROM horario_user
            ORDER BY emp_id ASC ";
$result = pg_query($conexion, $query);
$horario = pg_fetch_all($result);
foreach ($horario as $fila) {
    $id = $fila['emp_id'];
    if(!is_null($fila['hora_entrada']) || !is_null($fila['hora_salida']))
    {
        $dias['default'] = $fila['hora_entrada'].",".$fila['hora_salida'];
    }
    if(!is_null($fila['lunes_e']) || !is_null($fila['lunes_s']))
    {
        $dias['lunes'] = $fila['lunes_e'].",".$fila['lunes_s'];
    }
    if(!is_null($fila['martes_e']) || !is_null($fila['martes_s']))
    {
        $dias['martes'] = $fila['martes_e'].",".$fila['martes_s'];
    }
    if(!is_null($fila['miercoles_e']) || !is_null($fila['miercoles_s']))
    {
        $dias['miercoles'] = $fila['miercoles_e'].",".$fila['miercoles_s'];
    }
    if(!is_null($fila['jueves_e']) || !is_null($fila['jueves_s']))
    {
        $dias['jueves'] = $fila['jueves_e'].",".$fila['jueves_s'];
    }
    if(!is_null($fila['viernes_e']) || !is_null($fila['viernes_s']))
    {
        $dias['viernes'] = $fila['viernes_e'].",".$fila['viernes_s'];
    }
    if(!is_null($fila['sabado_e']) || !is_null($fila['sabado_s']))
    {
        $dias['sabado'] = $fila['sabado_e'].",".$fila['sabado_s'];
    }
    if(!is_null($fila['domingo_e']) || !is_null($fila['domingo_s']))
    {
        $dias['domingo'] = $fila['domingo_e'].",".$fila['domingo_s'];
    }
    $item = [];
    foreach ($dias as $dia => $horas) {
        $item[$horas][] = $dia;
        /*$ent = is_null($horas['entrada'])? '00:00:00': $horas['entrada'];
        $sal = is_null($horas['salida'])? '00:00:00': $horas['salida'];
        $sql = "INSERT INTO horario_empleado (emp_id, dia, entrada, salida) VALUES ($id, '$dia', '$ent','$sal');";
        $result = pg_query($conexion, $sql);
        var_dump($result);*/
    }
    $fila = [];
    foreach ($item as $horas => $dias) {
        $fila[implode(',', array_unique($dias))] = $horas;
    }
    /*foreach ($item as $horas => $dias) {
        
    }*/
echo json_encode(['id'=> $id]);
echo json_encode($item);
echo("******************************");
}
//echo json_encode($horario);
?>
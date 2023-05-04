<?php
include_once 'conpg.php';
$query = "  SELECT * FROM horario_user
            ORDER BY emp_id ASC ";
$result = pg_query($conexion, $query);
$horario = pg_fetch_all($result);
foreach ($horario as $fila) {
    //echo json_encode($fila);
    $valores = [];
    $claves = [];
    foreach ($fila as $key => $value) {
        if(!is_null($value))
        {
            $claves[] = $key;
            $valores[] = "'".$value."'";
        }
    }
    //var_dump($valores);
    $valores = implode(",", $valores);
    $claves = implode(",", $claves);
    $sql = "INSERT INTO horario_user($claves) VALUES($valores);";
//echo json_encode(['id'=> $id]);
echo json_encode($sql);
}
//echo json_encode($horario);
?>
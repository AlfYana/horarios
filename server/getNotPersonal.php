<?php
include_once 'con_msql.php';
$sql = "SELECT emp_id FROM personal";
$query = $conexion->query($sql);
$personal = [];
header('Content-type:application/json;charset=utf-8');
if ($query->num_rows > 0) {
    while ($fila = mysqli_fetch_assoc($query)) {
        $personal[] = $fila["emp_id"];
    }
    $listEmp = implode(',', $personal);
    include_once 'conexionPostgresql/conpg.php';
    $query_pg = "  SELECT id, first_name, last_name, emp_code 
            FROM personnel_employee
            WHERE id NOT IN ($listEmp)
            ORDER BY id DESC ";
    $result = pg_query($conexionPG, $query_pg);
    $nuevos = pg_fetch_all($result);
    echo json_encode($nuevos, JSON_PRETTY_PRINT);
}
else{
    $data = array(
        "mensaje" => "Ningun Dato encontrado",
        "personal" => 0,
    );
    echo json_encode($data);
}

$conexion->close();
?>
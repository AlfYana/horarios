<?php
//$texto = $_POST['texto'];
/*$sql = "SELECT id, emp_code, first_name, last_name FROM public.personnel_employee
ORDER BY id ASC";*/
$sql = "SELECT emp_id AS id, emp_code, nombre AS first_name, apellido AS last_name FROM personal WHERE activo = 1
ORDER BY id ASC";
/*if(isset($texto) || !empty($texto)){
    $sql = "SELECT id, emp_code, first_name, last_name FROM public.personnel_employee
    ORDER BY id ASC";
}*/

//libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
//include_once 'conpg.php';
//$conexion es la variable de conexion con la base de datos mysql
include_once 'con_msql.php';

//$personalQuery = pg_query($conexion, $sql);
//$personal = pg_fetch_all($personalQuery);
$query = $conexion->query($sql);
$personal = [];
if ($query->num_rows > 0) {
    while ($fila = mysqli_fetch_assoc($query)) {
        $personal[] = $fila;
    }
}
header('Content-type:application/json;charset=utf-8');
echo json_encode($personal);

$conexion->close();
//echo json_encode(array( 'personal' => $personal));
//echo json_encode($personal, JSON_PRETTY_PRINT);

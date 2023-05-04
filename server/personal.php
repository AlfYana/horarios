<?php
//$texto = $_POST['texto'];
$sql = "SELECT id, emp_code, first_name, last_name FROM public.personnel_employee
ORDER BY id ASC";
/*if(isset($texto) || !empty($texto)){
    $sql = "SELECT id, emp_code, first_name, last_name FROM public.personnel_employee
    ORDER BY id ASC";
}*/

//libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
include_once 'conpg.php';

$personalQuery = pg_query($conexion, $sql);
$personal = pg_fetch_all($personalQuery);
//echo json_encode(array( 'personal' => $personal));
header('Content-type:application/json;charset=utf-8');
echo json_encode($personal, JSON_PRETTY_PRINT);

<?php
/******* Base de Datos MySql *****/
    include_once 'con_msql.php';
    $query = "SELECT * AS 
            FROM personal
            ORDER BY emp_id ASC";
    $resultado = $mysqli->query("SELECT * FROM personal", MYSQLI_USE_RESULT);
    $personal_mysql = [];
    if ($resultado) {
        $personal_mysql = $resultado->fetch_array(MYSQLI_ASSOC);
        $resultado->close();
    }

    $sql = "SELECT id, emp_code, first_name, last_name FROM public.personnel_employee
    ORDER BY id ASC";
    include_once 'conpg.php';
    $personalQuery = pg_query($conexion, $sql);
    $personal_psql = pg_fetch_all($personalQuery);
    $respuesta = array( 
        "personal_mysql" => $personal_mysql,
        "personal_psql"  => $personal_psql,
    );
    foreach ($personal_psql as $row) {
        $emp_id = $row['id'];
        $code_emp = $row['emp_code'];
        $nombre = $row['first_name'];
        $apellido = $row['last_name'];
        $consulta = "INSERT INTO personal (emp_id, code_emp, nombre, apellido) VALUES ($emp_id, $code_emp, '$nombre', '$apellido');";
        echo $consulta;
    }
    //header('Content-type:application/json;charset=utf-8');
    //echo json_encode($respuesta, JSON_PRETTY_PRINT);

?>
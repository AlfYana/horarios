<?php
  //libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
  include_once 'conpg.php';
  $emp = $_POST["empleado"];
  $sql = "SELECT * FROM horario_empleado
          WHERE emp_id = $emp
          ORDER BY id ASC";
  $result = pg_query($conexion, $sql);
  $horario = pg_fetch_all($result);
  
  echo json_encode($horario);
?>
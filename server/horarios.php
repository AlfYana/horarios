<?php
  //libreria que conecta a la db de postgresql, dicha conexion esta en la variable $conexion
  //include_once 'conpg.php';
  $emp = $_POST["empleado"];
  include_once 'con_msql.php';
  $sql = "SELECT * FROM horario_empleado
          WHERE emp_id = $emp
          ORDER BY id ASC";
  /*$result = pg_query($conexion, $sql);
  $horario = pg_fetch_all($result);*/

  $query = $conexion->query($sql);
  $horario = [];
  if ($query->num_rows > 0) {
      while ($fila = mysqli_fetch_assoc($query)) {
          $horario[] = $fila;
      }
  }
  $conexion->close();
  header('Content-type:application/json;charset=utf-8');
  echo json_encode($horario, JSON_PRETTY_PRINT);
?>
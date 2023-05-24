<?php
    $data = json_decode($_POST['datos'], true);
    $hoja = $_POST['hoja'];
    $filename = $_POST['filename'];
    //$filename = getcwd()."\\hojas\\".$nombre.".json";
    $name = $filename.'.json';
    header('Content-type:application/json;charset=utf-8');
    $contenido = json_encode( array('fecha' => $hoja, 'datos' => $data ) );
    file_put_contents("$name", $contenido);
    echo json_encode(array( "ruta" => $name));
?>
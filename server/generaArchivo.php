<?php
    $data = json_decode($_POST['datos'], true);
    $nombre = $_POST['nombre'];
    //$filename = getcwd()."\\hojas\\".$nombre.".json";
    $filename = $nombre.'.json';
    header('Content-type:application/json;charset=utf-8');
    $texto = json_encode($data);
    file_put_contents("$filename", $texto);
    echo json_encode(array( "ruta" => $filename));
?>
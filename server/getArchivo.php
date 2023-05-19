<?php
    $archivo = $_POST["archivo"];
    if(file_exists($archivo))
    {
        // Leer el contenido del archivo JSON
        $jsonData = file_get_contents($archivo);
        
        // Decodificar el contenido JSON en un objeto o array PHP
        $data = json_decode($jsonData);
        
        // Verificar si la decodificación fue exitosa
        if ($data === null) {
            header("HTTP/1.0 500 ".'El archivo '.$archivo.' no se puede decodificar');
            echo json_encode([ 'mensaje' => 'Error al decodificar el archivo JSON']);
        } else {
            echo json_encode($data);
        }
    }
    else {
        header("HTTP/1.0 404 ".'El archivo '.$archivo.' no existe');
        echo json_encode([ 'mensaje' => 'El archivo '.$archivo.' no existe']);
    }
?>
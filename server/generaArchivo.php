<?php
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $data = $json_obj->datos;
    $nombre = $json_obj->nombre;
    echo $data;
    //echo json_encode(array('nombre' => $nombre, 'data'=>$data));
?>
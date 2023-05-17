<?php

$dbservername = "127.0.0.1";
$dbusername = "postgres";
$dbname = "aptv";
$dbpassword = "TruPassNect789#";
$puerto = "7496";

$conexionPG=pg_connect("host=$dbservername port=$puerto dbname=$dbname user=$dbusername password=$dbpassword");

if($conexionPG){
    //var_dump( "Conexion BD OK ");
}
else{
    //var_dump( "Error BD ");
}

        



?>
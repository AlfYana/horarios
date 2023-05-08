<?php

$dbservername = "127.0.0.1";
$dbusername = "postgres";
$dbname = "biotimeAptv";
$dbpassword = "TruPassNect789#";
$puerto = "7496";

$conexion=pg_connect("host=$dbservername port=$puerto dbname=$dbname user=$dbusername password=$dbpassword");

if($conexion){
    //var_dump( "Conexion BD OK ");
}
else{
    //var_dump( "Error BD ");
}

        



?>
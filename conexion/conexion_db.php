<?php
$host = "localhost";
$usuario = "root";
$contraseña = "admin";
$nombre_bd = "sistema_escolar";
$port = 3307;

// Crear la conexión
$conn = new mysqli($host, $usuario, $contraseña, $nombre_bd, $port);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
<?php
include '../conexion/conexion_db.php';
$id = $_GET['id'] ?? null;
$conn->query("DELETE FROM estudiantes WHERE id = $id");
header("Location: listar_estudiante.php");
exit;
?>
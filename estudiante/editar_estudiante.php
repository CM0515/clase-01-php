<?php
include '../conexion/conexion_db.php';
$id = $_GET['id'] ?? null;
$result = $conn->query("SELECT * FROM estudiantes WHERE id = $id");
$estudiante = $result->fetch_assoc();

if (!$estudiante) {
    die("Estudiante no encontrado.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $conn->real_escape_string($_POST['nombre']);
    $edad = (int) $_POST['edad'];
    $email = $conn->real_escape_string($_POST['email']);

    $conn->query("UPDATE estudiantes SET nombre = '$nombre', edad = $edad, email = '$email' WHERE id = $id");
    header("Location: listar_estudiante.php");
    exit;
}
?>

<a href="listar_estudiante.php">Volver a la lista de estudiantes</a>
<form method="post">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" value="<?= htmlspecialchars($estudiante['nombre']) ?>" required>
    <br>
    <label for="edad">Edad:</label>
    <input type="number" name="edad" value="<?= htmlspecialchars($estudiante['edad']) ?>" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" name="email" value="<?= htmlspecialchars($estudiante['email']) ?>" required>
    <br>
    <button type="submit">Actualizar</button>
</form>
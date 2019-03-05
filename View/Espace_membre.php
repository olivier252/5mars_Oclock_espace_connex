<?php
session_start(); // On démarre la session AVANT toute chose
//setcookie('pseudo', $_POST['pseudo'], time() + 365*24*3600, null, null, false, true); // On écrit un cookie
//setcookie('pass', $_POST['pseudo'], time() + 365*24*3600, null, null, false, true); // On écrit un autre cookie...
?>

<!DOCTYPE html>
<html>
<head>
	<title>Accueil inscription</title>
</head>
<body>
	<h1>Bienvenue dans ta liste secrète ! Seul le père noël saura ce qu'il se passe entre toi et moi !</h1>

	<p>Hello <?= $_SESSION['pseudo']; ?> !</p>
	<p>Confie-moi ta liste de cadeaux</p>

	<a href="deconnexion.php">Me déconnecter</a>
	
</body>

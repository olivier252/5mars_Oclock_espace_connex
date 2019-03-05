
<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Formulaire d'inscription</title>
</head>
	<body>
		<h1>Tu pars déjà ?</h1>
		<p>Reste un peu <?=$_SESSION['pseudo']?> y a du reine au dessert !</p>
		<a href="../index.php">Retour au traineau du père noël</a>
	</body>
<?php
session_destroy();
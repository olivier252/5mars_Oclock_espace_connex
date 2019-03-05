<!DOCTYPE html>
<html>
<head>
	<title>Page d'accueil</title>
</head>
<body>
	<h1>Bienvenue dans ton espace ! Connecte-toi vite et remplis ton tableau avec pleins d'idées cadeau originales !</h1>


	<form method="POST" action="../index.php?action=connex">

			<p>
				<label for="pseudoConnex">Pseudo :</label>
				<input type="text" name="pseudoConnex" id="pseudoConnex">
			</p>

			<p>
				<label for="passConnex">Mot de passe :</label>
				<input type="password" name="passConnex" id="passConnex">
			</p>

			<input type="submit" value="Envoyer"/>
		</form>
</body>
</html>
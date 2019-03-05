<!DOCTYPE html>
<html>
<head>
	<title>Formulaire d'inscription</title>
</head>
	<body>
		<h1>Espace d'inscription</h1>

		<form action="../index.php?action=inscription" method="post">
			<p>
				<label for="pseudo">Pseudo :</label>
				<input type="text" name="pseudo" id="pseudo">
			</p>

			<p>
				<label for="pass">Mot de passe :</label>
				<input type="password" name="pass" id="pass">
			</p>

			<p>
				<label for="passTest">Confirmation du mot de passe :</label>
				<input type="password" name="passTest" id="passTest">
			</p>

			<input type="submit" value="Envoyer" />
		</form>
	</body>
</html>
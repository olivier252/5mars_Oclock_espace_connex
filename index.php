<?php
try {
	require('Controller/frontend_Cont.php');

	if(isset($_GET['action'])) {

		switch($_GET['action'])	{

		case 'index' :
			index();
			break;

		case 'inscription' :
			if(!empty($_POST['pseudo']) && !empty($_POST['pass']) && !empty($_POST['passTest'])) {
				if($_POST['pass'] == $_POST['passTest']) {
						add();
					}	
					 else 
						throw new exception('Erreur de saisie de mot de passe, essaie encore !');
					} else {
				throw new exception('Essaie de remplir les champs !');
			}
			break;

		case 'connex' : 
			if(!empty($_POST['pseudoConnex']) && !empty($_POST['passConnex'])) {
					connexion();
			} else {
		    throw new exception('Essaie de remplir les champs !');
		}
			break;
		}//fin du switch
	}
	else {
		index();
	}
}//fin du try

catch(Exception $e) {
	die($e->getMessage());
}


/*
if (isset($_COOKIE['nom']) AND isset($_COOKIE['password'])) {
 
 $req = $bdd->prepare("SELECT identifiant, mdp FROM users WHERE identifiant = ?");
 $req->execute(array($_COOKIE['nom']));
 
     $donnees = $req->fetch();
 
 
  if ($identifiant == $donnees['identifiant'] AND password_verify($mdp, $donnees['mdp'])) {
 
              $_SESSION['identifiant'] = $identifiant;
 
 
              header('Location: index.php');
              $req->closeCursor();
              exit();
            }
            else {
              header('Location:https://www.google.fr');
              exit();
            }
 */
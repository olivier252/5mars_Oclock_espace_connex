<?php
function load($classe) {
	include 'Model/'.$classe.'.class.php';
}
spl_autoload_register('load');


function index(){
	require('View/accueil.php');
	header('location: View/accueil.php');
}

function add() {
	$manager = new Manager_Membre();
	$_POST['pass'] = password_hash($_POST['pass'], PASSWORD_DEFAULT);//cryptage irréversible mdp
	
	if($manager->ifLoginExists($_POST['pseudo'])) {
		throw new exception('Ce mot de passe existe déjà !');
	} else {
		$data_user = ['pseudo' => $_POST['pseudo'], 'pass' => $_POST['pass']];
		$membre = new Membre($data_user);
		$affectedLine = $manager->addMember($membre);
		header('Location: index.php?action=index');
	}
}

function connexion() {
	$manager = new Manager_Membre();
	$resultat = $manager->connexMember($_POST['pseudoConnex']);
	$passTest = password_verify($_POST['passConnex'], $resultat['pass']);

	if ($passTest) {
		session_start();
		$_SESSION['pseudo'] = $resultat['pseudo'];
		header('location:View/Espace_membre.php');
	} else {
		throw new exception('Erreur de saisie de mot de passe, où peut-être que tu n\'es pas inscrit !');
	}
}

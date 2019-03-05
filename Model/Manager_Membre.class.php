<?php
//Gère les membres en architecture CRUD

class Manager_Membre
{
	private $_db; // Instance de PDO

	public function __construct() 
	{
    	$this->_db = new PDO('mysql:host=localhost;dbname=exo_crud;charset=utf8;', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
  	}

	//Inscrit un membre en l'ajoutant à la BDD
	public function addMember(){
		$sql = 'INSERT INTO membres ( pseudo, pass, inscript_date) VALUES (:pseudo, :pass, NOW())';
		$pdoStatement = $this->_db->prepare($sql);
		$pdoStatement->bindValue(':pseudo', $_POST['pseudo'], PDO::PARAM_STR);
		$pdoStatement->bindValue(':pass', $_POST['pass'], PDO::PARAM_STR);
		$pdoStatement->execute();
	}
  
  	//Sélectionne un Objet $membre pour le connecter 
  	public function connexMember($pseudo) {
		$sql = 'SELECT id, pass, pseudo FROM membres WHERE pseudo = :pseudo';
		$pdoStatement = $this->_db->prepare($sql);
		$pdoStatement->bindParam('pseudo', $pseudo, PDO::PARAM_STR);
		$pdoStatement->execute();
		$resultat = $pdoStatement->fetch();
		return $resultat; 
	}

	//Vérifie si un login est déjà utilisé
	public function ifLoginExists() {
		$stmt = $this->_db->prepare('SELECT COUNT(*) FROM membres WHERE pseudo = :pseudo');
    	$stmt->execute(array('pseudo' => $_POST['pseudo']));
    	return (bool) $stmt->fetchColumn();//correspond à la colonne de mes mdp en bdd renvoie 1 ou 0
	}
}












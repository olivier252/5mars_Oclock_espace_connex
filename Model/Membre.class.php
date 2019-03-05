<?php
//La classe membre représente les inscriptions des membres et chaque instance sera un nouveau membre de l'application
class Membre
{
	private $_pseudo;
	private $_password;

	public function hydrate(array $data) {
		foreach ($data as $key => $value) {
			$method = 'set'.ucFirst($key);
			if(method_exists($this, $method)) {
				$this->$method($value);
			}
		}
	}

	public function __construct(array $donnees){$this->hydrate($donnees);}

	//Setters
	public function setPseudo($pseudo) {$this->_pseudo = $pseudo;}
	public function setPass($pass) {$this->_password = $pass;}

	//Getters
	public function getPseudo() {return $this->_pseudo;}

	public function getPass() {return $this->_password;}
}
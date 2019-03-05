-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 05 mars 2019 à 13:59
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `exo_crud`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8 NOT NULL,
  `espece` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `nom`, `espece`) VALUES
(95, 'Le tatou', 'de papouasie'),
(96, 'Le tatou', 'de papouasie'),
(92, 'ddddd', 'ez'),
(93, 'ddddd', 'ez'),
(94, 'Le tatou', 'de papouasie'),
(91, 'ddddd', 'ez'),
(90, 'ddddd', 'cstor'),
(89, 'ddddd', 'ez'),
(88, 'ddddd', 'ez'),
(87, 'ddddd', 'ez'),
(86, 'truc', 'en plume'),
(85, 'truc', 'en plume'),
(84, 'truc', 'en plume'),
(83, 'truc', 'en plume');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`) VALUES
(1, 'Compétences liées à la fonction actuelle'),
(3, 'Compétences liées au management d\'équipe'),
(2, 'Compétences techniques');

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

DROP TABLE IF EXISTS `competences`;
CREATE TABLE IF NOT EXISTS `competences` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categorie_id` tinyint(3) UNSIGNED NOT NULL,
  `texte` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_id` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `competences`
--

INSERT INTO `competences` (`id`, `categorie_id`, `texte`) VALUES
(1, 1, 'Organisation personnelle'),
(2, 1, 'Autonomie'),
(3, 1, 'Capacité à négocier'),
(4, 1, 'Capacité à décider'),
(5, 1, 'Disponibilité'),
(6, 1, 'Créativité/Innovation'),
(7, 2, 'Commerciale'),
(8, 2, 'Bureautique'),
(9, 2, 'Métier'),
(10, 3, 'Capacité à fixer des objectifs'),
(11, 3, 'Capacité à organiser'),
(12, 3, 'Capacité à motiver/animer'),
(13, 3, 'Capacité à former'),
(14, 3, 'Capacité à déléguer'),
(15, 3, 'Capacité à contrôler'),
(16, 3, 'Capacité à évaluer');

-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
CREATE TABLE IF NOT EXISTS `comptes` (
  `numero` char(1) NOT NULL,
  `solde` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comptes`
--

INSERT INTO `comptes` (`numero`, `solde`) VALUES
('A', 500),
('B', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
CREATE TABLE IF NOT EXISTS `evaluations` (
  `competence_id` int(10) UNSIGNED NOT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `note` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`competence_id`,`utilisateur_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `competence_id` (`competence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evaluations`
--

INSERT INTO `evaluations` (`competence_id`, `utilisateur_id`, `note`) VALUES
(2, 2, 1),
(4, 2, 1),
(5, 2, 2),
(6, 2, 2),
(7, 1, 1),
(8, 1, 0),
(9, 1, 2),
(13, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 NOT NULL,
  `inscript_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

DROP TABLE IF EXISTS `personnages`;
CREATE TABLE IF NOT EXISTS `personnages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `degats` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_billet`
--

DROP TABLE IF EXISTS `t_billet`;
CREATE TABLE IF NOT EXISTS `t_billet` (
  `BIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BIL_DATE` datetime NOT NULL,
  `BIL_TITRE` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `BIL_CONTENU` varchar(400) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`BIL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `t_billet`
--

INSERT INTO `t_billet` (`BIL_ID`, `BIL_DATE`, `BIL_TITRE`, `BIL_CONTENU`) VALUES
(2, '2019-01-23 18:00:14', 'Premier billet', 'Bonjour monde ! Aujourd\'hui un article passionnant où l\'on débattra de l\'utilisation de php qui est un langage de programmation formidable.'),
(3, '2019-01-23 18:00:14', 'Au travail', 'Chaque année, les Victoires de la Musique Classique récompensent artistes et enregistrements du monde musical. Une catégorie \"Révélations\" distingue également les jeunes artistes, en prenant en compte l\'avis du public grâce à un vote accessible notamment sur francemusique.fr.\r\n\r\nLa cérémonie des Victoires de la Musique Classique 2019 sera diffusée en direct sur France 3 et France Musi');

-- --------------------------------------------------------

--
-- Structure de la table `t_commentaire`
--

DROP TABLE IF EXISTS `t_commentaire`;
CREATE TABLE IF NOT EXISTS `t_commentaire` (
  `COMM_ID` int(11) NOT NULL,
  `COMM_DATE` datetime NOT NULL,
  `COMM_AUTEUR` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `COMM_CONTENU` varchar(200) COLLATE utf8_general_mysql500_ci NOT NULL,
  `BIL_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Déchargement des données de la table `t_commentaire`
--

INSERT INTO `t_commentaire` (`COMM_ID`, `COMM_DATE`, `COMM_AUTEUR`, `COMM_CONTENU`, `BIL_ID`) VALUES
(1, '2019-01-15 00:00:00', 'Oliv', 'Salut Polo comment ça va ici ?', 1),
(2, '2019-01-25 00:00:00', 'Roger', 'Cest super ici, c\'est bien aéré', 1),
(3, '2019-01-15 00:00:00', 'polo', 'j\'aime les saucisses', 2);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(60) NOT NULL,
  `mot_de_passe` binary(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `type` enum('Admin','Util') NOT NULL DEFAULT 'Util',
  `verrouille` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `mot_de_passe`, `email`, `type`, `verrouille`) VALUES
(1, 'Croche.Sarah', 0x38393062363535306434303866663339626631643561396432386639616665633930643730653037, 'croche.sarah@bidule.fr', 'Util', 0),
(2, 'Rouge.Georges', 0x31376564646231623263346338316664646136363863343331393962343432346461303966613939, 'rouge.georges@bidule.fr', 'Util', 0),
(3, 'Dupont.Albert', 0x37393031333532356263666261633632623538376135386135346165303239656165633831616163, 'dupont.albert@bidule.fr', 'Admin', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `competences`
--
ALTER TABLE `competences`
  ADD CONSTRAINT `competences_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`competence_id`) REFERENCES `competences` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

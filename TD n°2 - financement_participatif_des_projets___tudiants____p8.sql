-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 jan. 2023 à 23:04
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `financement participatif des projets étudiants à p8`
--

-- --------------------------------------------------------

--
-- Structure de la table `investisseur`
--

CREATE TABLE `investisseur` (
  `investisseur_id` int(15) UNSIGNED NOT NULL,
  `investisseur_nom` varchar(300) DEFAULT NULL,
  `contribution_valeur` decimal(10,2) UNSIGNED DEFAULT NULL,
  `investisseur_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `investisseur`
--

INSERT INTO `investisseur` (`investisseur_id`, `investisseur_nom`, `contribution_valeur`, `investisseur_type`) VALUES
(1031, 'Mairie de Saint-Denis', '25000.00', 'secteur public '),
(1032, 'Bouygues Telecom', '20000.00', 'secteur privé'),
(1033, 'EDF', '15000.00', 'secteur public'),
(1034, 'radio NRJ', '5000.00', 'secteur privé'),
(1035, 'Ministère de la Transition écologique et de la Cohésion des territoires', '10000.00', 'secteur public ');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `projet_id` int(15) UNSIGNED NOT NULL,
  `projet_nom` varchar(100) DEFAULT NULL,
  `thème` varchar(100) DEFAULT NULL,
  `budget_estimé` decimal(10,2) DEFAULT NULL,
  `équipe_id` int(15) UNSIGNED DEFAULT NULL,
  `investisseur_id` int(15) UNSIGNED DEFAULT NULL,
  `date_de_création` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`projet_id`, `projet_nom`, `thème`, `budget_estimé`, `équipe_id`, `investisseur_id`, `date_de_création`) VALUES
(1, 'Art urbain - Quand les œuvres dévoilent Paris 8', 'Art', '25000.00', 202201, 1031, '2022-02-06'),
(2, 'Améliorer l\'accès Internet sur le campus', 'IT', '20000.00', 202202, 1032, '2022-04-12'),
(3, 'Réduire l\'empreinte carbone - Réparation des fermetures de porte', 'Écologie', '15000.00', 202203, 1033, '2022-06-18'),
(4, 'Piano numérique en libre-service', 'Music', '5000.00', 202204, 1034, '2022-08-24'),
(5, 'Sensibilisation au tri des déchets', 'Écologie', '10000.00', 202205, 1035, '2022-10-30');

-- --------------------------------------------------------

--
-- Structure de la table `rôle`
--

CREATE TABLE `rôle` (
  `rôle_id` int(15) UNSIGNED NOT NULL,
  `rôle_nom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rôle`
--

INSERT INTO `rôle` (`rôle_id`, `rôle_nom`) VALUES
(1, 'Analyste '),
(2, 'Concepteur'),
(3, 'Développeur'),
(4, 'Graphiste '),
(5, 'UI Designer');

-- --------------------------------------------------------

--
-- Structure de la table `équipe`
--

CREATE TABLE `équipe` (
  `équipe_id` int(15) UNSIGNED NOT NULL,
  `équipe_nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `équipe`
--

INSERT INTO `équipe` (`équipe_id`, `équipe_nom`) VALUES
(202201, 'Arbains'),
(202202, 'HighTechors'),
(202203, 'Decarbonizators'),
(202204, 'Melodianz'),
(202205, 'Purificateurs ');

-- --------------------------------------------------------

--
-- Structure de la table `étudiant`
--

CREATE TABLE `étudiant` (
  `étudiant_id` int(15) UNSIGNED NOT NULL,
  `nom` varchar(15) DEFAULT NULL,
  `prénom` varchar(15) DEFAULT NULL,
  `courrier` varchar(50) DEFAULT NULL,
  `formation` varchar(100) DEFAULT NULL,
  `rôle_id` int(15) UNSIGNED DEFAULT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `équipe_id` int(15) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `étudiant`
--

INSERT INTO `étudiant` (`étudiant_id`, `nom`, `prénom`, `courrier`, `formation`, `rôle_id`, `adresse`, `date_de_naissance`, `équipe_id`) VALUES
(10202001, 'Descoueyte', 'Ariane', 'ariane.descoueyte@etud.univ-paris8.fr', 'NET', 1, 'Essonne', '1997-01-11', 202201),
(10202002, 'Tauvel', 'Baudoin', 'baudoin.tauvel@etud.univ-paris8.fr', 'NET', 2, 'Hauts-de-Seine', '1997-04-12', 202202),
(10202003, 'Kamano', 'Jacob', 'jacob.kamano@etud.univ-paris8.fr', 'NET', 3, 'Paris', '1997-07-18', 202203),
(10202004, 'Bouteiller', 'Julie', 'julie.bouteiller@etud.univ-paris8.fr', 'NET', 4, 'Seine-Saint-Denis', '1997-09-24', 202204),
(10202005, 'Kcacivd', 'Zina', 'zina.kcacivd@etud.univ-paris8.fr', 'THYP', 5, 'Val-de-Marne', '1997-11-29', 202205),
(10202101, 'Comorien', 'Ibrahim', 'ibrahim.comorien@etud.univ-paris8.fr', 'THYP', 1, 'Essonne', '1998-01-06', 202201),
(10202102, 'Citron ', 'Marion ', 'marion.citron@etud.univ-paris8.fr', 'THYP', 2, 'Hauts-de-Seine', '1998-03-12', 202202),
(10202103, 'Bertrand', 'Théo ', 'theo.bertrand@etud.univ-paris8.fr', 'THYP', 4, 'Seine-Saint-Denis', '1998-06-23', 202204),
(10202104, 'Hantouche', 'Imad', 'imad.hantouche@etud.univ-paris8.fr', 'AVUN', 3, 'Paris', '1998-07-21', 202203),
(10202105, 'Mezzai', 'Nadra ', 'nadra.mezzai@etud.univ-paris8.fr', 'AVUN', 5, 'Val-de-Marne', '1998-01-05', 202205),
(10202201, 'Beeharry', 'Kesh ', 'kesh.beeharry@etud.univ-paris8.fr', 'AVUN', 1, 'Essonne', '1999-01-11', 202201),
(10202202, 'Len', 'Aida', 'aida.len@etud.univ-paris8.fr', 'CEN', 2, 'Hauts-de-Seine', '1999-04-14', 202202),
(10202203, 'Ecourtemer', 'Eliette', 'eliette.ecourtemer@etud.univ-paris8.fr', 'CEN', 3, 'Paris', '1999-07-03', 202203),
(10202204, 'Sureken', 'Eugenie', 'eugenie.sureken@etud.univ-paris8.fr', 'CEN', 4, 'Seine-Saint-Denis', '1997-09-08', 202204),
(10202205, 'Liu', 'Shuai', 'shuai.liu@etud.univ-paris8.fr', 'CEN', 5, 'Val-de-Marne', '1999-11-19', 202205);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `investisseur`
--
ALTER TABLE `investisseur`
  ADD PRIMARY KEY (`investisseur_id`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`projet_id`),
  ADD KEY `FK04` (`investisseur_id`),
  ADD KEY `FK03` (`équipe_id`);

--
-- Index pour la table `rôle`
--
ALTER TABLE `rôle`
  ADD PRIMARY KEY (`rôle_id`);

--
-- Index pour la table `équipe`
--
ALTER TABLE `équipe`
  ADD PRIMARY KEY (`équipe_id`);

--
-- Index pour la table `étudiant`
--
ALTER TABLE `étudiant`
  ADD PRIMARY KEY (`étudiant_id`),
  ADD KEY `FK01` (`rôle_id`),
  ADD KEY `FK02` (`équipe_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK03` FOREIGN KEY (`équipe_id`) REFERENCES `équipe` (`équipe_id`),
  ADD CONSTRAINT `FK04` FOREIGN KEY (`investisseur_id`) REFERENCES `investisseur` (`investisseur_id`);

--
-- Contraintes pour la table `étudiant`
--
ALTER TABLE `étudiant`
  ADD CONSTRAINT `FK01` FOREIGN KEY (`rôle_id`) REFERENCES `rôle` (`rôle_id`),
  ADD CONSTRAINT `FK02` FOREIGN KEY (`équipe_id`) REFERENCES `équipe` (`équipe_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

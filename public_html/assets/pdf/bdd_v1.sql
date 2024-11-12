-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- HÃ´te : 127.0.0.1
-- GÃ©nÃ©rÃ© le : sam. 03 dÃ©c. 2022 Ã  17:08
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de donnÃ©es : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `archives_cr`
--

CREATE TABLE `archives_cr` (
  `id` int(8) NOT NULL,
  `id_visiteur` int(8) DEFAULT NULL,
  `id_medecin` int(8) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_echantillon` int(8) DEFAULT NULL,
  `nouvelle_visite` varchar(255) DEFAULT NULL,
  `compterendu` varchar(255) DEFAULT NULL,
  `avis` enum('0','1') NOT NULL,
  `etat` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `archives_utilisateurs`
--

CREATE TABLE `archives_utilisateurs` (
  `id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `sexe` enum('0','1') NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(58) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `region` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comptesrendus`
--

CREATE TABLE `comptesrendus` (
  `id` int(8) NOT NULL,
  `id_visiteur` int(8) DEFAULT NULL,
  `id_medecin` int(8) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_echantillon` int(8) DEFAULT NULL,
  `nouvelle_visite` varchar(255) DEFAULT NULL,
  `compterendu` varchar(255) DEFAULT NULL,
  `avis` enum('0','1') NOT NULL,
  `etat` enum('0','1') NOT NULL,
  `id_motif` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `comptesrendus`
--

INSERT INTO `comptesrendus` (`id`, `id_visiteur`, `id_medecin`, `date`, `id_echantillon`, `nouvelle_visite`, `compterendu`, `avis`, `etat`, `id_motif`) VALUES
(4, 10, 2, '2022-11-21', 1, '0', 'VOICI UN COMPTE RENDU TEST', '0', '1', NULL),
(5, 10, 1, '2022-11-10', 1, NULL, 'teeeeeeeeeeest', '0', '0', NULL),
(6, 1, 7, '2022-12-30', 2, '2022-12-31', 'Le mÃ©decin ne souhaite pas garder nos Efferalgan car il en possÃ¨de des meilleurs', '1', '1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `echantillons`
--

CREATE TABLE `echantillons` (
  `id` int(8) NOT NULL,
  `type_medicament` varchar(10) DEFAULT NULL,
  `nom_medicament` varchar(255) DEFAULT NULL,
  `fournisseur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `echantillons`
--

INSERT INTO `echantillons` (`id`, `type_medicament`, `nom_medicament`, `fournisseur`) VALUES
(1, 'X', 'Doliprane', 'Lille\r\n'),
(2, 'Y', 'Efferalgan', 'RIVAUX'),
(3, 'Z', 'Viagra', 'VALENTIN');

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

CREATE TABLE `grade` (
  `id_grade` int(8) NOT NULL,
  `libelle_grade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `grade`
--

INSERT INTO `grade` (`id_grade`, `libelle_grade`) VALUES
(1, 'Visiteur'),
(2, 'DÃ©lÃ©guÃ©'),
(3, 'Responsable'),
(4, 'DÃ©veloppeur');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` int(8) NOT NULL,
  `user_id` int(8) DEFAULT NULL,
  `type_log` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `type_log`, `action`, `date`) VALUES
(2, 10, 'Insertion', 'A crÃ©Ã© le profil du mÃ©decin (y.suzanne@gmail.com)', '2022-11-27'),
(3, 10, 'Insertion', 'A crÃ©Ã© le compte: Stephe GogoRivo (dsfsfan@gmail.com)', '2022-11-27'),
(4, 10, 'Insertion', 'A crÃ©Ã© le compte: Test Jean Charles (gtournier1@myges.fr)', '2022-11-27'),
(5, 10, 'Insertion', 'A envoyÃ© une notification (Test notif grade)', '2022-11-27'),
(6, 10, 'Insertion', 'A crÃ©Ã© le compte: aze123 aze123 (dsfsmacropfolo@sfr.fr)', '2022-11-27'),
(8, 10, 'Suppression', 'A supprimÃ© un compte', '2022-11-27'),
(9, 10, 'Modification', 'A modifiÃ© le compte rendu (5)', '2022-11-28'),
(10, 10, 'Modification', 'A modifiÃ© le compte rendu (4)', '2022-11-28'),
(11, 10, 'Modification', 'A modifiÃ© le compte rendu (4)', '2022-11-28'),
(12, 10, 'Insertion', 'A planifiÃ© une visite (pour le 2022-11-23)', '2022-11-30'),
(13, 10, 'Insertion', 'A planifiÃ© une visite (pour le 2022-11-30)', '2022-11-30'),
(14, 10, 'Insertion', 'A rÃ©digÃ© un compte rendu.', '2022-12-30'),
(15, 10, 'Suppression', 'A supprimÃ© un compte', '2022-12-01'),
(16, 10, 'Insertion', 'A planifiÃ© une visite (pour le 2022-12-09)', '2022-12-02'),
(17, 10, 'Insertion', 'A envoyÃ© une notification (test lucas)', '2022-12-02');

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

CREATE TABLE `medecins` (
  `id` int(11) NOT NULL,
  `visiteur_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'medecin2.png',
  `siret` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `type_medicament` varchar(255) DEFAULT NULL,
  `quantite_echantillon` varchar(255) DEFAULT NULL,
  `date_relance_retour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `medecins`
--

INSERT INTO `medecins` (`id`, `visiteur_id`, `img`, `siret`, `nom`, `prenom`, `email`, `adresse`, `ville`, `code_postal`, `type_medicament`, `quantite_echantillon`, `date_relance_retour`) VALUES
(1, 10, 'medecin.png', 12356894100056, 'HANOUNA', 'Cyril', 'cyril.h@sfr.fr', '18 rue des prÃ©s', 'Paris', 93000, '1', '5', '2022-11-16'),
(2, 10, 'medecin2.png', 21341894100054, 'LEWANDOSKI', 'Robert', 'r.lewandoski@gmail.com', '36 cours Albert Thomas', 'Lyon', 69003, '1', '8', '2022-11-30'),
(3, 1, 'AF1QipOwWK7cxtYXUCmcB8bknctdN97Gesc-scEqBBmd=s1360-w1360-h1020', 88522308100013, 'Benjamin', 'Robert', 'drbenjamin.robert@gmail.com', 'RDC, 160 Av. Berthelot', 'Lyon', 69007, '1', '400', NULL),
(4, 7, 'k2nwl78nriusj9iczmr3.jpg', 10100220309, 'Dzemaili', 'Emine', 'Drdzemaili.emine@gmail.com', '289 Rue Garibaldi', 'Lyon', 69007, '1', '250', NULL),
(5, 1, 'xsgysmotmo1fpsx37h0n.jpg', 26690027300217, 'DONNOU', 'AdÃ¨le ', 'DrAdele.DONNOU@gmail.com', '44 Av. Lacassagne', 'Lyon.', 69003, '2', '200', NULL),
(6, 9, 'vy1fek0vi0rhlce3cvku.jpg', 49164909100015, 'AL-HAMOUI', 'Christine ', 'Christine.AL-HAMOUI@gmail.com', '91 Cours Gambetta ', 'Lyon', 69003, '1', '150', NULL),
(7, 10, 'gw8wqzdcm3ejlhtibj8n.jpg', 79104703800017, 'Dessertenne', 'Julien', 'JulienDessertenne@gmail.com', '18 Rue Servient', 'Lyon', 69003, '2', '300', NULL),
(8, 11, 'cuapcf9xdflgcsrbxqwn.jpg', 10100943866, 'CIUDIN', 'Cornelia', 'DrCornelia.CIUDIN@gmail.com', ' 132 boulevard de la Croix Rousse', 'Lyon', 69008, '1', '100', NULL),
(9, 7, 'oqvndrzkwynkmwqviimp.jpg', 10003115994, 'Mochref-Razavi', 'Marc', 'Mochref-Razavi@gmail.com', '52 Quai Rambaud', 'Lyon', 69002, '1', '400', NULL),
(10, 1, 'tqlsfn7yy5zkqhnoxqte.jpg', 84911498800024, 'Marc SALEM', 'Kamal', 'SALEM@gmail.com', '64 Avenue Rockefeller', 'Lyon', 69008, '1', '250', NULL),
(11, 2, 'tbu9knldxus55feovzho.jpg', 47846033000069, 'HENNESSY', 'Susan', 'DrSusan.HENNESSY@gmail.com', ' 133 boulevard de la Croix Rousse', 'Lyon', 69004, '2', '200', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `motif_visite`
--

CREATE TABLE `motif_visite` (
  `id` int(8) NOT NULL,
  `libelle_motif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `motif_visite`
--

INSERT INTO `motif_visite` (`id`, `libelle_motif`) VALUES
(1, 'PÃ©riodicitÃ©'),
(2, 'NouveautÃ©s ou Actualisations'),
(3, 'Remontage'),
(4, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(8) NOT NULL,
  `user_id` int(8) DEFAULT NULL,
  `grade` int(1) DEFAULT 1,
  `objet` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `send_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `grade`, `objet`, `message`, `send_date`) VALUES
(1, 1, 1, 'test', 'Notification de test! (Sans envoi)', '2022-11-14'),
(2, 1, 1, 'test', 'test', '2015-11-22'),
(3, 10, 1, 'TEST', 'DÃ©pÃªchez-vous de dÃ©velopper!!!!!', '2015-11-22'),
(4, 10, 1, 'fdsfdsfds', 'fdsfdsfdsfd', '2021-11-22'),
(5, 10, 2, 'Test notif grade', 'Test notif grade', '2027-11-22'),
(6, 10, 4, 'testttttt', 'test lucas', '2002-12-22');

-- --------------------------------------------------------

--
-- Structure de la table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(8) NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `url`, `version`, `logo`) VALUES
(1, 'GSB', 'http://localhost/ProjetBTS', 'v2.0', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `sexe` enum('0','1') NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(58) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `region` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `grade`, `nom`, `prenom`, `sexe`, `email`, `mot_de_passe`, `adresse`, `ville`, `code_postal`, `date_embauche`, `region`, `created_by`) VALUES
(1, 1, 'SUZANNE', 'Yannick', '1', 'y.suzanne@swissgalaxy.com', '$2y$10$LF7gEruUmVUpoa33wb1Tgef2ccUU07cDG6u35lebcVJ56qex9LigG', '54 cours Albert Thomas', 'Lyon', 69003, '2018-11-21', 'X', 3),
(3, 2, 'TALABAN', 'Francois', '1', 'f.talaban@swissgalaxy.com', '$2y$10$LF7gEruUmVUpoa33wb1Tgef2ccUU07cDG6u35lebcVJ56qex9LigG', '18 rue leon blum', 'Villeurbanne', 69100, '2022-09-20', 'X', 3),
(10, 4, 'TOURNIER', 'Gabin', '1', 'gabin.tournier25@swissgalaxy.com', '$2y$10$LF7gEruUmVUpoa33wb1Tgef2ccUU07cDG6u35lebcVJ56qex9LigG', '46 rue leon blum', 'Vileurbanne', 69100, '2022-11-15', 'Z', 3),
(13, 4, 'Contaux', 'Valentin', '0', 'valentin.ctx@swissgalaxy.com', '$2y$10$LF7gEruUmVUpoa33wb1Tgef2ccUU07cDG6u35lebcVJ56qex9LigG', '36 rue auguste comte', 'lyon', 69002, '2022-11-22', 'Z', 3);

-- --------------------------------------------------------

--
-- Structure de la table `visites`
--

CREATE TABLE `visites` (
  `id` int(8) NOT NULL,
  `visiteur_id` int(8) NOT NULL,
  `medecin_id` int(8) NOT NULL,
  `echantillon_id` int(11) NOT NULL,
  `date_visite` date NOT NULL,
  `statut_visite` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- DÃ©chargement des donnÃ©es de la table `visites`
--

INSERT INTO `visites` (`id`, `visiteur_id`, `medecin_id`, `echantillon_id`, `date_visite`, `statut_visite`) VALUES
(1, 10, 2, 1, '2022-11-30', '1'),
(3, 10, 7, 2, '2022-11-30', '0'),
(4, 10, 1, 2, '2022-12-09', '0');

--
-- Index pour les tables dÃ©chargÃ©es
--

--
-- Index pour la table `archives_cr`
--
ALTER TABLE `archives_cr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `archives_utilisateurs`
--
ALTER TABLE `archives_utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comptesrendus`
--
ALTER TABLE `comptesrendus`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `echantillons`
--
ALTER TABLE `echantillons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id_grade`),
  ADD KEY `id_grade` (`id_grade`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `motif_visite`
--
ALTER TABLE `motif_visite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visites`
--
ALTER TABLE `visites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables dÃ©chargÃ©es
--

--
-- AUTO_INCREMENT pour la table `archives_cr`
--
ALTER TABLE `archives_cr`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `archives_utilisateurs`
--
ALTER TABLE `archives_utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comptesrendus`
--
ALTER TABLE `comptesrendus`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `echantillons`
--
ALTER TABLE `echantillons`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `visites`
--
ALTER TABLE `visites`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
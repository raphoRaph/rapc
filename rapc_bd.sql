SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+01:00";


--
-- Base de données :  `rapc_bd`
--

CREATE USER IF NOT EXISTS 'rapc_user'@'%' IDENTIFIED BY 'rapc_pass';

CREATE DATABASE IF NOT EXISTS `rapc_bd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

GRANT SELECT, INSERT, UPDATE, DELETE ON `rapc_bd`.* TO "rapc_user"@"%";

USE `rapc_bd`;

--
-- Base de données : `rapc_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `CAS`
--

CREATE TABLE `CAS` (
  `ID_CAS` int NOT NULL,
  `ID_PB` int NOT NULL,
  `ID_SOL` int DEFAULT NULL,
  `MALADIE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `CAS`
--

INSERT INTO `CAS` (`ID_CAS`, `ID_PB`, `ID_SOL`, `MALADIE`) VALUES
(1, 1, 1, 'VARICELLE'),
(2, 2, 1, 'RHINOPHARYNGITE'),
(3, 3, 2, 'GASTRO ENTERITE');

-- --------------------------------------------------------

--
-- Structure de la table `PROBLEMES`
--

CREATE TABLE `PROBLEMES` (
  `ID_PB` int NOT NULL,
  `AGE` int NOT NULL COMMENT '28 à 77',
  `SEXE` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'M ou F',
  `POIDS` float NOT NULL,
  `IMC` float NOT NULL,
  `TEMP` float NOT NULL,
  `VOMISSEMENTS` tinyint(1) NOT NULL,
  `TOUX` tinyint(1) NOT NULL,
  `MIGRAINE` tinyint(1) NOT NULL,
  `GORGE` tinyint(1) NOT NULL,
  `DOULEUR_THORAX` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'NAP : Non ; ATA : Atypical Angina ; ASY : Asymptotique',
  `FREQUENCE_CARDIAQUE` int NOT NULL COMMENT '0 à 200',
  `CHOLESTEROL` int NOT NULL COMMENT '0 à 603',
  `TENSION_ARTERIELLE_A_JEUN` int NOT NULL COMMENT '0 ou 1',
  `ECG_REPOS` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Normal, ST (anormal) ou LVH (hypertrophie)',
  `FREQUENCE_CARDIAQUE_MAX` int NOT NULL COMMENT '60 à 202',
  `ANGINE_POITRINE` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Y ou N',
  `SCORE_TEST_EFFORT` double NOT NULL COMMENT '-2.6 à 6.2',
  `PENTE_CARDIAQUE` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Up, Flat, Down',
  `SCORE_MALADIE_CARDIAQUE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `PROBLEMES`
--

INSERT INTO `PROBLEMES` (`ID_PB`, `AGE`, `SEXE`, `POIDS`, `IMC`, `TEMP`, `VOMISSEMENTS`, `TOUX`, `MIGRAINE`, `GORGE`, `DOULEUR_THORAX`, `FREQUENCE_CARDIAQUE`, `CHOLESTEROL`, `TENSION_ARTERIELLE_A_JEUN`, `ECG_REPOS`, `FREQUENCE_CARDIAQUE_MAX`, `ANGINE_POITRINE`, `SCORE_TEST_EFFORT`, `PENTE_CARDIAQUE`, `SCORE_MALADIE_CARDIAQUE`) VALUES
(1, 35, 'M', 80, 20, 39, 0, 0, 0, 0, 'NAP', 100, 180, 0, 'Normal', 180, 'N', 0, 'Flat', 0.5058000087738037),
(2, 29, 'F', 60, 20, 39, 0, 1, 1, 1, 'NAP', 100, 180, 0, 'Normal', 180, 'N', 0, 'Flat', 0),
(3, 29, 'F', 55, 21, 38, 1, 0, 1, 0, 'NAP', 80, 80, 0, 'Normal', 180, 'N', 0, 'Flat', 0.3156999945640564);

-- --------------------------------------------------------

--
-- Structure de la table `SOLUTIONS`
--

CREATE TABLE `SOLUTIONS` (
  `ID_SOL` int NOT NULL,
  `MEDIC1` varchar(255) NOT NULL,
  `DUREE1` int NOT NULL,
  `POSOLOGIE1` varchar(255) NOT NULL,
  `MEDIC2` varchar(255) DEFAULT NULL,
  `DUREE2` int DEFAULT NULL,
  `POSOLOGIE2` varchar(255) DEFAULT NULL,
  `MEDIC3` varchar(255) DEFAULT NULL,
  `DUREE3` int DEFAULT NULL,
  `POSOLOGIE3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `SOLUTIONS`
--

INSERT INTO `SOLUTIONS` (`ID_SOL`, `MEDIC1`, `DUREE1`, `POSOLOGIE1`, `MEDIC2`, `DUREE2`, `POSOLOGIE2`, `MEDIC3`, `DUREE3`, `POSOLOGIE3`) VALUES
(1, 'EFFERALGAN', 3, '1 COMPRIME A CHAQUE REPAS', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'SMECTA', 4, 'UN SACHET A CHAQUE REPAS', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CAS`
--
ALTER TABLE `CAS`
  ADD PRIMARY KEY (`ID_CAS`),
  ADD KEY `CAS_PB` (`ID_PB`),
  ADD KEY `CAS_SOL` (`ID_SOL`);

--
-- Index pour la table `PROBLEMES`
--
ALTER TABLE `PROBLEMES`
  ADD PRIMARY KEY (`ID_PB`);

--
-- Index pour la table `SOLUTIONS`
--
ALTER TABLE `SOLUTIONS`
  ADD PRIMARY KEY (`ID_SOL`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CAS`
--
ALTER TABLE `CAS`
  MODIFY `ID_CAS` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `PROBLEMES`
--
ALTER TABLE `PROBLEMES`
  MODIFY `ID_PB` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `SOLUTIONS`
--
ALTER TABLE `SOLUTIONS`
  MODIFY `ID_SOL` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CAS`
--
ALTER TABLE `CAS`
  ADD CONSTRAINT `CAS_PB` FOREIGN KEY (`ID_PB`) REFERENCES `PROBLEMES` (`ID_PB`),
  ADD CONSTRAINT `CAS_SOL` FOREIGN KEY (`ID_SOL`) REFERENCES `SOLUTIONS` (`ID_SOL`);
COMMIT;

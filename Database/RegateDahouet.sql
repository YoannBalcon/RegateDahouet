-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2017 at 11:25 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RegateDahouet`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `intervComm` (IN `challengeId` INT, IN `dateDebut` DATE, IN `dateFin` DATE)  BEGIN
select cms.prenom as prenom, cms.nom as nom, cmt.nom as comité, re.regDate as date from commissaire cms 
INNER JOIN comite cmt ON cms.id_comite=cmt.id_comite 
INNER JOIN regate re ON cms.id_commissaire=re.id_commissaire
WHERE re.regDate > dateDebut and re.regDate<dateFin and re.id_challenge= challengeId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listEquipage` (IN `idVoilier` INT, IN `idRegate` INT)  BEGIN
select prenom, nom from personne pe INNER JOIN participation pa ON pe.id_equipage=pa.id_equipage

where pa.id_voilier =idVoilier AND pa.id_regate=idRegate;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `moyenneDist` (IN `challengeId` INT)  BEGIN
SELECT AVG(distance) FROM regate WHERE id_challenge = challengeId;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `new_function` (`idRegate` INT) RETURNS VARCHAR(25) CHARSET latin1 BEGIN
DECLARE v_codeChal varchar(25);
DECLARE v_mois int;
DECLARE v_numSeq int;
DECLARE code_regate varchar(25);

SELECT c.codeChal INTO v_codeChal FROM challenge c INNER JOIN regate r ON r.id_challenge= c.id_challenge WHERE  r.id_regate= idRegate;
SELECT MONTH(regDate) INTO v_mois FROM regate WHERE id_regate = idRegate;
SELECT COUNT(*) INTO v_numSeq FROM regate;

SET code_regate= CONCAT( v_codeChal, '-', v_mois, '-', v_numSeq+1);

RETURN code_regate;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `challenge`
--

CREATE TABLE `challenge` (
  `id_challenge` int(11) NOT NULL,
  `saison` varchar(25) DEFAULT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `codeChal` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challenge`
--

INSERT INTO `challenge` (`id_challenge`, `saison`, `nom`, `dateDebut`, `dateFin`, `codeChal`) VALUES
(1, 'été', 'Challenge d\'été 2017', '2017-05-01', '2017-09-30', 'CHAL2'),
(2, 'hiver', 'Challenge dhiver 2017-2018', '2017-11-01', '2018-03-31', 'CHAL3'),
(3, 'été', 'challenge d\'été 2016', '2016-05-01', '2016-10-23', 'CHAL1');

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `coefficient` double(2,2) DEFAULT NULL,
  `id_serie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom`, `coefficient`, `id_serie`) VALUES
(5, 'corsaire', 0.50, 1),
(6, 'surprise', 0.60, 1),
(7, '8 metres', 0.70, 1),
(8, 'maraudeur', 0.80, 1),
(34, 'figaro', 0.90, 1),
(35, 'flying fifteen', 0.10, 2),
(36, 'soling', 0.20, 2),
(37, 'star', 0.30, 2),
(38, 'tempest', 0.40, 2),
(39, 'yngling', 0.50, 2),
(40, 'flying fifteen', 0.10, 2),
(41, 'soling', 0.20, 2),
(42, 'star', 0.30, 2),
(43, 'tempest', 0.40, 2),
(44, 'yngling', 0.50, 2),
(45, '5.5', 0.60, 2);

-- --------------------------------------------------------

--
-- Table structure for table `comite`
--

CREATE TABLE `comite` (
  `id_comite` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comite`
--

INSERT INTO `comite` (`id_comite`, `nom`) VALUES
(1, 'finistère'),
(2, 'ile-de_france');

-- --------------------------------------------------------

--
-- Table structure for table `commissaire`
--

CREATE TABLE `commissaire` (
  `id_commissaire` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `id_comite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commissaire`
--

INSERT INTO `commissaire` (`id_commissaire`, `nom`, `prenom`, `id_comite`) VALUES
(1, 'Le Hegarat', 'Marcel', 1),
(2, 'Du Bateau', 'Pierre', 2);

-- --------------------------------------------------------

--
-- Table structure for table `equipage`
--

CREATE TABLE `equipage` (
  `id_equipage` int(11) NOT NULL,
  `id_skipper` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipage`
--

INSERT INTO `equipage` (`id_equipage`, `id_skipper`) VALUES
(1, 2),
(2, 4),
(6, 8),
(3, 13),
(5, 16),
(4, 21);

-- --------------------------------------------------------

--
-- Table structure for table `matelot`
--

CREATE TABLE `matelot` (
  `id_matelot` int(11) NOT NULL,
  `id_personne` int(11) DEFAULT NULL,
  `id_equipage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matelot`
--

INSERT INTO `matelot` (`id_matelot`, `id_personne`, `id_equipage`) VALUES
(1, 1, 1),
(2, 10, 1),
(3, 14, 3),
(4, 15, 3),
(5, 3, 2),
(6, 4, 2),
(7, 6, 2),
(8, 22, 4),
(9, 23, 4),
(10, 24, 4),
(11, 17, 5),
(12, 18, 5),
(13, 9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `tempsReel` int(11) DEFAULT NULL,
  `tempsComp` int(11) DEFAULT NULL,
  `id_regate` int(11) NOT NULL,
  `id_voilier` int(11) NOT NULL,
  `id_equipage` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participation`
--

INSERT INTO `participation` (`tempsReel`, `tempsComp`, `id_regate`, `id_voilier`, `id_equipage`, `position`) VALUES
(NULL, NULL, 2, 1, 1, 1),
(NULL, NULL, 2, 2, 2, 2),
(NULL, NULL, 2, 3, 3, 1),
(NULL, NULL, 2, 7, 3, 3),
(NULL, NULL, 2, 11, 2, 4),
(NULL, NULL, 5, 5, 5, 1);

--
-- Triggers `participation`
--
DELIMITER $$
CREATE TRIGGER `participation_BEFORE_UPDATE` BEFORE UPDATE ON `participation` FOR EACH ROW BEGIN
DECLARE nbVoiliers INT;

SELECT COUNT(*) INTO nbVoiliers FROM participation WHERE id_regate=NEW.id_regate;

IF NEW.position>nbVoiliers
THEN
SIGNAL SQLSTATE '32000' SET MESSAGE_TEXT = 'Position impossible';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `nomClub` varchar(25) DEFAULT NULL,
  `numLicence` int(11) DEFAULT NULL,
  `anneeLicence` int(11) DEFAULT NULL,
  `dateNaissance` int(11) DEFAULT NULL,
  `id_equipage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `email`, `nomClub`, `numLicence`, `anneeLicence`, `dateNaissance`, `id_equipage`) VALUES
(1, 'Lopez', 'Richard', 'richard@lopez.com', 'club des frate', 123456, 2017, 1986, 1),
(2, 'Callec', 'Yoann', 'yoann@callec.com', 'club des frate', 654123, 2017, 1991, 1),
(3, 'Fourteau', 'Lucas', 'lucas@fourteau.com', 'club de la Merguez', 652341, 2017, 1990, 2),
(4, 'Lengaigne', 'Nicolas', 'nicolas@lengaigne.com', 'club de la Bagarre', 154263, 2017, 1986, 2),
(5, 'Chenier', 'Tanguy', 'tanguy@chenier.com', 'club des Armées', 4563261, 2017, 1985, 2),
(6, 'Anne', 'Erwann', 'erwann@anne.com', 'club des mousses', 112563, 2017, 1999, 2),
(7, 'Simon', 'Christophe', 'christophe@simon.com', 'club de la bagarre', 556432, 2017, 1978, NULL),
(8, 'Vanel', 'Rémi', 'remi@vanel.com', 'club de la mort', 566624, 2017, 1985, 6),
(9, 'Le Hénaff', 'Gwénolé', 'gwenole@lehenaff.com', 'club des nerds', 513375, 2017, 1985, 6),
(10, 'Balcon', 'Yoann', 'yoann@balcon.com', 'club des frate', 666666, 2017, 1987, 1),
(11, 'Duboeuf', 'Lionel', 'lionel@duboeuf.com', 'club du chef', 111111, 2017, 1977, NULL),
(12, 'Martin', 'Marcel', 'marcel@martin.com', 'club de l\'éval', 123451, 2017, 1986, NULL),
(13, 'Letroc', 'Pierre', 'pierre@letroc.com', 'club de l\'éval', 123452, 2017, 1985, 3),
(14, 'Le Jay', 'Roger', 'roger@lejay', 'club de l\'éval', 123453, 2016, 1975, 3),
(15, 'De La Montagne', 'Hubert', 'hubert@delamontagne.com', 'club de l\'éval', 123454, 2017, 1972, 3),
(16, 'Le Baux', 'Etienne', 'etienne@lebaux.com', 'club de l\'éval', 123455, 2017, 1990, 5),
(17, 'Du Port', 'Emilie', 'emilie@duport.com', 'club de l\'éval', 123459, 2016, 1998, 5),
(18, 'Quintin', 'Corentin', 'corentin@quintin.com', 'club de l\'éval', 125689, 2016, 1974, 5),
(19, 'Le Fort', 'Clarisse ', 'clarisse@lefort.com', 'club de l\'éval', 5598746, 2016, 1960, NULL),
(20, 'De Carquefou', 'Hélène', 'helene@dequarcefou.com', 'club de l\'éval', 987662, 2017, 1999, NULL),
(21, 'Giquel', 'Camille', 'camille@giquel.com', 'club de l\'éval', 557846, 2017, 1989, 4),
(22, 'La Poste', 'René', 'rene@laposte.fr', 'club de l\'éval', 558649, 2017, 1968, 4),
(23, 'Bellamy', 'Rémy', 'remy@bellamy.com', 'club de l\'éval', 987654, 2017, 1978, 4),
(24, 'Le Bel', 'Hector', 'hector@lebel.com', 'club de l\'éval', 884568, 2017, 1973, 4),
(25, 'De Chaise', 'Arnaud', 'arnaud@dechaise.com', 'club de l\'éval', 589612, 2017, 1970, NULL),
(26, 'Rando', 'Maritie', 'maritie@rando.com', 'club du lol', 489621, 2017, 1967, NULL),
(27, 'Tamaran', 'Jessica', 'jessica@tamaran.com', 'club du lol', 548612, 2017, 1965, NULL),
(28, 'Bonlabar', 'Sébastien', 'sebastien@bonlabar.com', 'club du lol', 785694, 2017, 1982, NULL),
(29, 'Turquoise', 'Bruno', 'bruno@turquoise.com', 'club du lol', 658631, 2017, 1978, NULL),
(30, 'Bestan', 'Lucas', 'lucas@bestan.com', 'club du lol', 157685, 2017, 1973, NULL),
(31, 'Banc', 'Léo', 'leo@banc.com', 'club du lol', 948235, 2017, 1980, NULL),
(32, 'Bord', 'Adiba', 'adiba@bord.com', 'club du lol', 784369, 2017, 1988, NULL),
(33, 'Bord', 'Dimitri', 'dimitri@bord.com', 'club du lol', 689123, 2017, 1979, NULL),
(34, 'Aidesauvetage', 'Gilles', 'gilles@edeusovetage.com', 'club du lol', 985621, 2017, 1992, NULL),
(35, 'Viron', 'Sarah', 'sarah@viron.com', 'club du lol', 359487, 2017, 1969, NULL),
(36, 'Dille', 'Margot', 'margot@dille.com', 'club du lol', 874532, 2017, 1979, NULL),
(37, 'Avoile', 'Richard', 'richard@avoile.com', 'club du lol', 658428, 2017, 1989, NULL),
(38, 'Pitaine', 'Erica', 'erica@pitaine.com', 'club du lol', 354895, 2017, 1991, NULL),
(39, 'Plat', 'Renaud', 'renaud@plat.com', 'club du lol', 188753, 2017, 1988, NULL),
(40, 'Arébas', 'Jérôme', 'jerome@arebas.com', 'club du lol', 458621, 207, 1982, NULL),
(41, 'Gate', 'Honoré', 'honoré@gate.com', 'club jeu de mots', 657812, 2017, 1978, NULL),
(42, 'Ditérannée', 'Salomé', 'salome@diterannee.com', 'club jeu de mots', 684895, 2017, 1979, NULL),
(43, 'Clément', 'Leïla', 'leile@clement', 'club jeu de mots', 589632, 2017, 1988, NULL),
(44, 'Yodebain', 'Emma', 'emma@yodebain.com', 'club jeu de mots', 875621, 2017, 1987, NULL),
(45, 'Cre', 'Ronan', 'ronan@cre.com', 'club jeu de mots', 345978, 2017, 1982, NULL),
(52, 'Polo', 'Walter', 'walter@polo.fr', 'club de la Vanne', 132456, 2017, 1985, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id_proprietaire` int(11) NOT NULL,
  `id_personne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proprietaire`
--

INSERT INTO `proprietaire` (`id_proprietaire`, `id_personne`) VALUES
(2, 7),
(1, 10),
(6, 11),
(3, 12),
(5, 19),
(4, 20),
(9, 29),
(7, 39),
(10, 41),
(8, 45),
(16, 52);

-- --------------------------------------------------------

--
-- Table structure for table `regate`
--

CREATE TABLE `regate` (
  `id_regate` int(11) NOT NULL,
  `distance` int(11) DEFAULT NULL,
  `regDate` date DEFAULT NULL,
  `id_challenge` int(11) DEFAULT NULL,
  `id_commissaire` int(11) DEFAULT NULL,
  `numRegate` int(11) NOT NULL,
  `nomRegate` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regate`
--

INSERT INTO `regate` (`id_regate`, `distance`, `regDate`, `id_challenge`, `id_commissaire`, `numRegate`, `nomRegate`) VALUES
(2, 20, '2018-01-22', 2, 1, 1, 'Metal Militia'),
(5, 74, '2017-07-12', 1, 1, 41, 'Fast and Loose');

--
-- Triggers `regate`
--
DELIMITER $$
CREATE TRIGGER `regate_BEFORE_DELETE` BEFORE DELETE ON `regate` FOR EACH ROW BEGIN
DECLARE date_fin DATE;

SELECT dateFin INTO date_fin FROM challenge WHERE id_challenge = old.id_challenge;

IF date_fin > curdate() THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le challenge n'est pas fini !', mysql_errno='45000';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `regate_BEFORE_INSERT` BEFORE INSERT ON `regate` FOR EACH ROW BEGIN
DECLARE date_debut DATE;
DECLARE date_fin DATE;

SELECT dateDebut INTO date_debut FROM challenge WHERE id_challenge = new.id_challenge;
SELECT dateFin INTO date_fin FROM challenge WHERE id_challenge = new.id_challenge;

IF (date_debut > new.regDate OR date_fin < new.regDate) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La date ne correspond pas !', mysql_errno='45000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `id_serie` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serie`
--

INSERT INTO `serie` (`id_serie`, `nom`) VALUES
(1, 'habitables'),
(2, 'quillards de sport');

-- --------------------------------------------------------

--
-- Table structure for table `voilier`
--

CREATE TABLE `voilier` (
  `id_voilier` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `numVoile` int(11) DEFAULT NULL,
  `id_proprietaire` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voilier`
--

INSERT INTO `voilier` (`id_voilier`, `nom`, `numVoile`, `id_proprietaire`, `id_classe`) VALUES
(1, 'Crotale', 54, 1, 8),
(2, 'Pygargue', 51, 2, 41),
(3, 'Pangolin', 12, 3, 36),
(4, 'Ornithorynque', 10, 4, 45),
(5, 'Wapiti', 78, 7, 5),
(6, 'Axolotl', 2235, 6, 37),
(7, 'Rhinopithèque', 785, 9, 36),
(8, 'Chlamydophore ', 11, 10, 40),
(9, 'Okapi', 45, 8, 6),
(10, 'Nasique', 78, 5, 44),
(11, 'Casoar', 32, 1, 36),
(12, 'Babiroussa', 48, 6, 37),
(13, 'Drosophile', 984, 6, 39),
(15, 'Doryphore', 1425, 5, 35),
(25, 'test', 234, 9, 39),
(26, 'test', 123, 2, 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenge`
--
ALTER TABLE `challenge`
  ADD PRIMARY KEY (`id_challenge`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `FK_Classe_id_serie` (`id_serie`);

--
-- Indexes for table `comite`
--
ALTER TABLE `comite`
  ADD PRIMARY KEY (`id_comite`);

--
-- Indexes for table `commissaire`
--
ALTER TABLE `commissaire`
  ADD PRIMARY KEY (`id_commissaire`),
  ADD KEY `FK_Commissaire_id_comite` (`id_comite`);

--
-- Indexes for table `equipage`
--
ALTER TABLE `equipage`
  ADD PRIMARY KEY (`id_equipage`),
  ADD KEY `FK_Equipage_id_personne` (`id_skipper`);

--
-- Indexes for table `matelot`
--
ALTER TABLE `matelot`
  ADD PRIMARY KEY (`id_matelot`),
  ADD KEY `FK_Matelot_id_personne` (`id_personne`),
  ADD KEY `FK_Matelot_id_equipage` (`id_equipage`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`id_regate`,`id_voilier`,`id_equipage`),
  ADD KEY `FK_Participation_id_voilier` (`id_voilier`),
  ADD KEY `FK_Participation_id_equipage` (`id_equipage`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id_personne`),
  ADD KEY `FK_Personne_id_equipage` (`id_equipage`);

--
-- Indexes for table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id_proprietaire`),
  ADD KEY `FK_Proprietaire_id_personne` (`id_personne`);

--
-- Indexes for table `regate`
--
ALTER TABLE `regate`
  ADD PRIMARY KEY (`id_regate`),
  ADD KEY `FK_Regate_id_challenge` (`id_challenge`),
  ADD KEY `FK_Regate_id_commissaire` (`id_commissaire`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id_serie`);

--
-- Indexes for table `voilier`
--
ALTER TABLE `voilier`
  ADD PRIMARY KEY (`id_voilier`),
  ADD KEY `FK_Voilier_id_proprietaire` (`id_proprietaire`),
  ADD KEY `FK_Voilier_id_classe` (`id_classe`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenge`
--
ALTER TABLE `challenge`
  MODIFY `id_challenge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `comite`
--
ALTER TABLE `comite`
  MODIFY `id_comite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `commissaire`
--
ALTER TABLE `commissaire`
  MODIFY `id_commissaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `equipage`
--
ALTER TABLE `equipage`
  MODIFY `id_equipage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `matelot`
--
ALTER TABLE `matelot`
  MODIFY `id_matelot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `proprietaire`
--
ALTER TABLE `proprietaire`
  MODIFY `id_proprietaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `regate`
--
ALTER TABLE `regate`
  MODIFY `id_regate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `id_serie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `voilier`
--
ALTER TABLE `voilier`
  MODIFY `id_voilier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_Classe_id_serie` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id_serie`);

--
-- Constraints for table `commissaire`
--
ALTER TABLE `commissaire`
  ADD CONSTRAINT `FK_Commissaire_id_comite` FOREIGN KEY (`id_comite`) REFERENCES `comite` (`id_comite`);

--
-- Constraints for table `equipage`
--
ALTER TABLE `equipage`
  ADD CONSTRAINT `FK_Equipage_id_personne` FOREIGN KEY (`id_skipper`) REFERENCES `personne` (`id_personne`);

--
-- Constraints for table `matelot`
--
ALTER TABLE `matelot`
  ADD CONSTRAINT `FK_Matelot_id_equipage` FOREIGN KEY (`id_equipage`) REFERENCES `equipage` (`id_equipage`),
  ADD CONSTRAINT `FK_Matelot_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`);

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `FK_Participation_id_equipage` FOREIGN KEY (`id_equipage`) REFERENCES `equipage` (`id_equipage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Participation_id_regate` FOREIGN KEY (`id_regate`) REFERENCES `regate` (`id_regate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Participation_id_voilier` FOREIGN KEY (`id_voilier`) REFERENCES `voilier` (`id_voilier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_Personne_id_equipage` FOREIGN KEY (`id_equipage`) REFERENCES `equipage` (`id_equipage`);

--
-- Constraints for table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD CONSTRAINT `FK_Proprietaire_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`);

--
-- Constraints for table `regate`
--
ALTER TABLE `regate`
  ADD CONSTRAINT `FK_Regate_id_challenge` FOREIGN KEY (`id_challenge`) REFERENCES `challenge` (`id_challenge`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Regate_id_commissaire` FOREIGN KEY (`id_commissaire`) REFERENCES `commissaire` (`id_commissaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voilier`
--
ALTER TABLE `voilier`
  ADD CONSTRAINT `FK_Voilier_id_classe` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `FK_Voilier_id_proprietaire` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Peuplement de la base avec des données fictives de démonstration

-- =========================================================
-- Peuplement corrigé pour bdd2.sql
-- Corrections principales :
-- 1) insertion des rapports AVANT la table contient
-- 2) ajout de capteurs CH4 et mesures CH4 pour :
--    Île-de-France, Bretagne et Occitanie en mai/juin 2023
-- 3) respect de l'ordre des clés étrangères
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM contient;
DELETE FROM redige;
DELETE FROM responsable;
DELETE FROM agent_technique;
DELETE FROM agent_administratif;
DELETE FROM chef_agent;
DELETE FROM mesure;
DELETE FROM rapport;
DELETE FROM capteur;
DELETE FROM gaz;
DELETE FROM agent;
DELETE FROM agence;
DELETE FROM ville;
DELETE FROM region;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================
-- REGIONS
-- =====================
INSERT INTO region (id_region, nom_region) VALUES
(1, 'Île-de-France'),
(2, 'Nouvelle-Aquitaine'),
(3, 'Occitanie'),
(4, 'Auvergne-Rhône-Alpes'),
(5, 'Bretagne');

-- =====================
-- VILLES
-- =====================
INSERT INTO ville (id_ville, nom_ville, id_region) VALUES
(1, 'Paris', 1),
(2, 'Bordeaux', 2),
(3, 'Toulouse', 3),
(4, 'Lyon', 4),
(5, 'Rennes', 5),
(6, 'Limoges', 2),
(7, 'Périgueux', 2);

-- =====================
-- AGENCES
-- =====================
INSERT INTO agence (id_agence, nom_agence, region_agence, nom_rue_agence, numero_rue_agence, code_postale_agence, id_ville) VALUES
(1, 'Agence Paris', 'IDF', 'Rue de Rivoli', 10, '75001', 1),
(2, 'Agence Bordeaux', 'NA', 'Rue Sainte-Catherine', 5, '33000', 2),
(3, 'Agence Toulouse', 'Occitanie', 'Rue d Alsace', 8, '31000', 3),
(4, 'Agence Lyon', 'ARA', 'Rue Mercière', 7, '69000', 4),
(5, 'Agence Rennes', 'Bretagne', 'Rue de la République', 6, '35000', 5),
(6, 'Agence Limoges', 'NA', 'Rue Jean Jaurès', 3, '87000', 6);

-- =====================
-- AGENTS
-- =====================
INSERT INTO agent (id_agent, nom_agent, prenom_agent, date_naissance_agent, date_embauche_agent, numero_rue_agent, nom_rue_agent, code_postale, id_ville, id_agence) VALUES
(1, 'Martin', 'Jean', '1980-01-01', '2015-01-01', 1, 'Rue A', '75000', 1, 1),
(2, 'Dupont', 'Claire', '1990-02-02', '2020-03-01', 2, 'Rue B', '33000', 2, 2),
(3, 'Durand', 'Paul', '1985-03-03', '2018-04-01', 3, 'Rue C', '31000', 3, 3),
(4, 'Bernard', 'Sophie', '1992-04-04', '2021-05-01', 4, 'Rue D', '69000', 4, 4),
(5, 'Petit', 'Lucas', '1988-05-05', '2019-06-01', 5, 'Rue E', '35000', 5, 5),
(6, 'Robert', 'Emma', '1995-06-06', '2022-01-01', 6, 'Rue F', '75000', 1, 1),
(7, 'Richard', 'Hugo', '1987-07-07', '2017-02-01', 7, 'Rue G', '33000', 2, 2),
(8, 'Moreau', 'Julie', '1993-08-08', '2020-03-01', 8, 'Rue H', '31000', 3, 3),
(9, 'Simon', 'Louis', '1984-09-09', '2016-04-01', 9, 'Rue I', '69000', 4, 4),
(10, 'Laurent', 'Anna', '1996-10-10', '2023-01-01', 10, 'Rue J', '35000', 5, 5),
(11, 'Lefevre', 'Tom', '1989-01-01', '2020-01-01', 11, 'Rue K', '75000', 1, 1),
(12, 'Michel', 'Sarah', '1991-02-02', '2021-02-02', 12, 'Rue L', '33000', 2, 2),
(13, 'Garcia', 'Nina', '1994-03-03', '2022-03-03', 13, 'Rue M', '31000', 3, 3),
(14, 'David', 'Leo', '1986-04-04', '2019-04-04', 14, 'Rue N', '69000', 4, 4),
(15, 'Bertrand', 'Eva', '1997-05-05', '2023-05-05', 15, 'Rue O', '35000', 5, 5),
(16, 'Roux', 'Noah', '1983-06-06', '2018-06-06', 16, 'Rue P', '75000', 1, 1),
(17, 'Vincent', 'Lina', '1998-07-07', '2023-07-07', 17, 'Rue Q', '33000', 2, 2),
(18, 'Fournier', 'Adam', '1990-08-08', '2021-08-08', 18, 'Rue R', '31000', 3, 3),
(19, 'Morel', 'Chloe', '1992-09-09', '2022-09-09', 19, 'Rue S', '69000', 4, 4),
(20, 'Girard', 'Ethan', '1985-10-10', '2019-10-10', 20, 'Rue T', '35000', 5, 5);

-- =====================
-- SPECIALISATION DES AGENTS
-- =====================
INSERT INTO chef_agent (id_agent, diplome) VALUES
(1, 'Master Environnement'),
(3, 'Doctorat Data Science'),
(5, 'Master Pollution Air');

INSERT INTO agent_administratif (id_agent) VALUES
(2), (4), (8), (10), (12), (14), (16), (18), (20);

INSERT INTO agent_technique (id_agent) VALUES
(6), (7), (8), (9), (10), (11), (12), (13), (15), (17), (18), (20);

-- =====================
-- GAZ
-- =====================
INSERT INTO gaz (id_gaz, nom_gaz, type_gaz, sigle_gaz) VALUES
(1, 'Protoxyde d azote', 'GES', 'N2O'),
(2, 'Ozone troposphérique', 'GES', 'O3'),
(3, 'Méthane', 'GES', 'CH4'),
(4, 'Hydrofluorocarbures', 'GESI', 'HFC'),
(5, 'Hexafluorure de soufre', 'GESI', 'SF6'),
(6, 'Dioxyde de carbone', 'GES', 'CO2'),
(7, 'Ammoniac', 'Polluant', 'NH3');

-- =====================
-- CAPTEURS
-- Important pour la requête 5 :
-- id_capteur 1 = CH4 à Paris / Île-de-France
-- id_capteur 3 = CH4 à Toulouse / Occitanie
-- id_capteur 13 = CH4 à Rennes / Bretagne
-- =====================
INSERT INTO capteur (id_capteur, activite_capteur, id_agence, id_gaz) VALUES
(1, TRUE, 1, 3),   -- Paris CH4
(2, TRUE, 2, 3),   -- Bordeaux CH4
(3, TRUE, 3, 3),   -- Toulouse CH4
(4, TRUE, 4, 4),   -- Lyon HFC
(5, TRUE, 5, 5),   -- Rennes SF6
(6, TRUE, 1, 6),   -- Paris CO2
(7, TRUE, 2, 1),   -- Bordeaux N2O
(8, TRUE, 3, 2),   -- Toulouse O3
(9, TRUE, 4, 6),   -- Lyon CO2
(10, TRUE, 5, 4),  -- Rennes HFC
(11, TRUE, 6, 3),  -- Limoges CH4
(12, TRUE, 3, 7),  -- Toulouse NH3
(13, TRUE, 5, 3),  -- Rennes CH4 : ajouté pour que la Bretagne sorte dans la requête 5
(14, TRUE, 1, 4),  -- Paris HFC
(15, TRUE, 2, 7);  -- Bordeaux NH3

-- =====================
-- RESPONSABLES DES CAPTEURS
-- =====================
INSERT INTO responsable (id_agent, id_capteur) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(15, 10),
(17, 11),
(18, 12),
(20, 13),
(6, 14),
(7, 15);

-- =====================
-- MESURES
-- Les mesures 6 à 13 garantissent les résultats de la requête 5.
-- =====================
INSERT INTO mesure (id_mesure, date_mesure, valeur_ppm, id_capteur) VALUES
-- Mesures diverses
(1, '2023-05-01', 180.50, 11),
(2, '2023-06-01', 175.20, 11),
(3, '2024-05-01', 200.40, 11),
(4, '2023-05-01', 50.00, 4),
(5, '2023-06-01', 45.00, 4),

-- Requête 5 : CH4 en Île-de-France, Bretagne et Occitanie, mai/juin 2023
(6, '2023-05-01', 400.00, 1),   -- Paris / Île-de-France / CH4
(7, '2023-06-01', 410.00, 1),   -- Paris / Île-de-France / CH4
(8, '2023-05-01', 155.50, 3),   -- Toulouse / Occitanie / CH4
(9, '2023-06-01', 160.20, 3),   -- Toulouse / Occitanie / CH4
(10, '2023-05-01', 140.80, 13), -- Rennes / Bretagne / CH4
(11, '2023-06-01', 138.40, 13), -- Rennes / Bretagne / CH4
(12, '2023-05-15', 402.30, 1),  -- Paris / Île-de-France / CH4
(13, '2023-06-15', 158.90, 3),  -- Toulouse / Occitanie / CH4

-- Données complémentaires
(14, '2020-01-01', 300.00, 6),
(15, '2020-02-01', 310.00, 6),
(16, '2020-03-01', 12.50, 15),
(17, '2020-04-01', 14.20, 15),
(18, '2024-05-01', 21.10, 12),
(19, '2024-06-01', 22.30, 12),
(20, '2022-07-01', 60.40, 10),
(21, '2022-08-01', 58.20, 10),
(22, '2021-03-01', 320.00, 9),
(23, '2021-04-01', 315.50, 9);

-- =====================
-- RAPPORTS
-- Ils doivent être insérés AVANT redige et contient.
-- =====================
INSERT INTO rapport (id_rapport, titre_rapport, date_publication) VALUES
(1, 'Qualité air Paris 2020', '2021-01-01'),
(2, 'CH4 Bordeaux 2023', '2023-07-01'),
(3, 'Analyse Toulouse', '2022-06-01'),
(4, 'GES France 2024', '2024-07-01'),
(5, 'Pollution Lyon', '2021-03-01'),
(6, 'Air Bretagne', '2022-08-01'),
(7, 'NH3 analyse', '2023-09-01'),
(8, 'Rapport global 2019', '2019-12-01'),
(9, 'Étude industrie', '2024-01-01'),
(10, 'Rapport capteurs', '2020-05-01'),
(11, 'Suivi CH4 mai juin 2023', '2023-07-15'),
(12, 'Données NH3 et HFC', '2024-05-15');

-- =====================
-- REDIGE
-- =====================
INSERT INTO redige (id_agent, id_rapport) VALUES
(2, 1),
(4, 2),
(8, 3),
(10, 4),
(12, 5),
(14, 6),
(16, 7),
(18, 8),
(20, 9),
(2, 10),
(8, 11),
(16, 12);

-- =====================
-- CONTIENT
-- Correction : dans bdd2.sql, l'ordre des colonnes est (id_mesure, id_rapport).
-- =====================
INSERT INTO contient (id_mesure, id_rapport) VALUES
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(16, 7),
(17, 7),
(18, 12),
(19, 12),
(20, 9),
(21, 9),
(22, 5),
(23, 5);

-- =========================================================
-- Requête 5 de test
-- =========================================================
SELECT 
    reg.nom_region,
    v.nom_ville,
    m.date_mesure,
    g.sigle_gaz,
    m.valeur_ppm
FROM mesure m
JOIN capteur c ON c.id_capteur = m.id_capteur
JOIN gaz g ON g.id_gaz = c.id_gaz
JOIN agence a ON a.id_agence = c.id_agence
JOIN ville v ON v.id_ville = a.id_ville
JOIN region reg ON reg.id_region = v.id_region
WHERE g.sigle_gaz = 'CH4'
  AND reg.nom_region IN ('Île-de-France', 'Bretagne', 'Occitanie')
  AND YEAR(m.date_mesure) = 2023
  AND MONTH(m.date_mesure) IN (5, 6)
ORDER BY reg.nom_region, v.nom_ville, m.date_mesure;

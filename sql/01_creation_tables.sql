-- Création des tables (MySQL 8+)
-- Noms de tables en minuscules pour fonctionner aussi sous Linux (sensible à la casse).

-- =====================
-- TABLE REGION
-- =====================
CREATE TABLE region (
    id_region INT PRIMARY KEY,
    nom_region VARCHAR(100) NOT NULL
);

-- =====================
-- TABLE VILLE
-- =====================
CREATE TABLE ville (
    id_ville INT PRIMARY KEY,
    nom_ville VARCHAR(100) NOT NULL,
    id_region INT,
    FOREIGN KEY (id_region) REFERENCES region(id_region)
);

-- =====================
-- TABLE AGENCE
-- =====================
CREATE TABLE agence (
    id_agence INT PRIMARY KEY,
    nom_agence VARCHAR(100),
    region_agence VARCHAR(100),
    nom_rue_agence VARCHAR(100),
    numero_rue_agence INT,
    code_postale_agence VARCHAR(10),
    id_ville INT,
    FOREIGN KEY (id_ville) REFERENCES ville(id_ville)
);

-- =====================
-- TABLE AGENT
-- =====================
CREATE TABLE agent (
    id_agent INT PRIMARY KEY,
    nom_agent VARCHAR(100),
    prenom_agent VARCHAR(100),
    date_naissance_agent DATE,
    date_embauche_agent DATE,
    numero_rue_agent INT,
    nom_rue_agent VARCHAR(100),
    code_postale VARCHAR(10),
    id_ville INT,
    id_agence INT,
    FOREIGN KEY (id_ville) REFERENCES ville(id_ville),
    FOREIGN KEY (id_agence) REFERENCES agence(id_agence)
);

-- =====================
-- TABLE GAZ
-- =====================
CREATE TABLE gaz (
    id_gaz INT PRIMARY KEY,
    nom_gaz VARCHAR(100),
    type_gaz VARCHAR(10),
    sigle_gaz VARCHAR(10)
);

-- =====================
-- TABLE CAPTEUR
-- =====================
CREATE TABLE capteur (
    id_capteur INT PRIMARY KEY,
    activite_capteur BOOLEAN,
    id_agence INT,
    id_gaz INT,
    FOREIGN KEY (id_agence) REFERENCES agence(id_agence),
    FOREIGN KEY (id_gaz) REFERENCES gaz(id_gaz)
);

-- =====================
-- TABLE MESURE
-- =====================
CREATE TABLE mesure (
    id_mesure INT PRIMARY KEY,
    date_mesure DATE,
    valeur_ppm DECIMAL(10,2),
    id_capteur INT,
    FOREIGN KEY (id_capteur) REFERENCES capteur(id_capteur)
);

-- =====================
-- TABLE RAPPORT
-- =====================
CREATE TABLE rapport (
    id_rapport INT PRIMARY KEY,
    titre_rapport VARCHAR(200),
    date_publication DATE
);

-- =====================
-- TABLE RESPONSABLE (Agent - Capteur)
-- =====================
CREATE TABLE responsable (
    id_agent INT,
    id_capteur INT,
    PRIMARY KEY (id_agent, id_capteur),
    FOREIGN KEY (id_agent) REFERENCES agent(id_agent),
    FOREIGN KEY (id_capteur) REFERENCES capteur(id_capteur)
);

-- =====================
-- TABLE REDIGE (Agent - Rapport)
-- =====================
CREATE TABLE redige (
    id_agent INT,
    id_rapport INT,
    PRIMARY KEY (id_agent, id_rapport),
    FOREIGN KEY (id_agent) REFERENCES agent(id_agent),
    FOREIGN KEY (id_rapport) REFERENCES rapport(id_rapport)
);

CREATE TABLE contient (
    id_mesure INT,
    id_rapport INT,
    PRIMARY KEY (id_mesure, id_rapport),
    FOREIGN KEY (id_mesure) REFERENCES mesure(id_mesure),
    FOREIGN KEY (id_rapport) REFERENCES rapport(id_rapport)
    );
-- =====================
-- TABLES SPECIALISATION
-- =====================
CREATE TABLE agent_technique (
    id_agent INT PRIMARY KEY,
    FOREIGN KEY (id_agent) REFERENCES agent(id_agent)
);

CREATE TABLE agent_administratif (
    id_agent INT PRIMARY KEY,
    FOREIGN KEY (id_agent) REFERENCES agent(id_agent)
);

CREATE TABLE chef_agent (
    id_agent INT PRIMARY KEY,
    diplome VARCHAR(100),
    FOREIGN KEY (id_agent) REFERENCES agent(id_agent)
);
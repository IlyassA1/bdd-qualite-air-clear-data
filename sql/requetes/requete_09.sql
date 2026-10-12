-- Requête n°9 : Concentration moyenne de chaque gaz en Île-de-France en 2020.
SELECT g.nom_gaz, AVG(m.valeur_ppm) AS moyenne
FROM mesure m
JOIN capteur c ON m.id_capteur = c.id_capteur
JOIN gaz g ON c.id_gaz = g.id_gaz
JOIN agence ag ON c.id_agence = ag.id_agence
JOIN ville v ON ag.id_ville = v.id_ville
JOIN region r ON v.id_region = r.id_region
WHERE r.nom_region = 'Île-de-France'
AND YEAR(m.date_mesure) = 2020
GROUP BY g.nom_gaz;

-- Requête n°5 : Mesures de CH4 en Île-de-France, Bretagne et Occitanie (1er mai et 1er juin 2023).
SELECT r.nom_region, m.date_mesure, m.valeur_ppm
FROM  region r 
JOIN ville v ON v.id_region = r.id_region
JOIN agence ag ON ag.id_ville = v.id_ville
JOIN capteur c ON c.id_agence = ag.id_agence
JOIN gaz g ON c.id_gaz = g.id_gaz
JOIN mesure m ON m.id_capteur = c.id_capteur
WHERE g.sigle_gaz = 'CH4'
AND r.nom_region IN ('Île-de-France','Bretagne','Occitanie')
AND m.date_mesure IN ('2023-05-01','2023-06-01')
ORDER BY r.nom_region, m.date_mesure;

-- Requête n°8 : Mois de concentration moyenne de HFC la plus faible, par région.
SELECT region, mois, concentration_moyenne_hfc
FROM (
    SELECT
        reg.nom_region AS region,
        DATE_FORMAT(m.date_mesure, '%Y-%m') AS mois,
        ROUND(AVG(m.valeur_ppm), 2) AS concentration_moyenne_hfc,
        RANK() OVER (
            PARTITION BY reg.id_region
            ORDER BY AVG(m.valeur_ppm) ASC
        ) AS rang_region
    FROM mesure m
    JOIN capteur c ON c.id_capteur = m.id_capteur
    JOIN gaz g ON g.id_gaz = c.id_gaz
    JOIN agence a ON a.id_agence = c.id_agence
    JOIN ville v ON v.id_ville = a.id_ville
    JOIN region reg ON reg.id_region = v.id_region
    WHERE g.sigle_gaz = 'HFC'
    GROUP BY reg.id_region, reg.nom_region, DATE_FORMAT(m.date_mesure, '%Y-%m')
) hfc_min
WHERE rang_region = 1
ORDER BY region;

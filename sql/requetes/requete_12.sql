-- Requête n°12 : Régions où le nombre de capteurs dépasse le nombre d'agents.
SELECT
    reg.nom_region,
    COUNT(DISTINCT c.id_capteur) AS nombre_capteurs,
    COUNT(DISTINCT agt.id_agent) AS nombre_personnel_agence
FROM region reg
JOIN ville v ON v.id_region = reg.id_region
JOIN agence a ON a.id_ville = v.id_ville
LEFT JOIN agent agt ON agt.id_agence = a.id_agence
LEFT JOIN capteur c ON c.id_agence = a.id_agence
GROUP BY reg.id_region, reg.nom_region
HAVING COUNT(DISTINCT c.id_capteur) > COUNT(DISTINCT agt.id_agent)
ORDER BY reg.nom_region;

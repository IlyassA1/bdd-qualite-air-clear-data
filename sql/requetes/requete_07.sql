-- Requête n°7 : Rapports liés à des mesures de NH3.
SELECT DISTINCT r.titre_rapport, r.date_publication
FROM rapport r
JOIN contient co ON r.id_rapport = co.id_rapport
JOIN mesure m ON co.id_mesure = m.id_mesure
JOIN capteur c ON m.id_capteur = c.id_capteur
JOIN gaz g ON c.id_gaz = g.id_gaz
WHERE g.sigle_gaz = 'NH3'
ORDER BY r.date_publication DESC;

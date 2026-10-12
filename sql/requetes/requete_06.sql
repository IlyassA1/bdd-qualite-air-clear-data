-- Requête n°6 : Agents techniques responsables de capteurs mesurant des gaz de type GESI.
SELECT DISTINCT a.nom_agent, a.prenom_agent
FROM agent a
JOIN agent_technique t ON a.id_agent = t.id_agent
JOIN responsable res ON a.id_agent = res.id_agent
JOIN capteur c ON res.id_capteur = c.id_capteur
JOIN gaz g ON c.id_gaz = g.id_gaz
WHERE g.type_gaz = 'GESI';

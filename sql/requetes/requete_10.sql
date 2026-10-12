-- Requête n°10 : Productivité (rapports par mois depuis l'embauche) des agents administratifs de l'agence de Toulouse.
SELECT a.id_agent, a.nom_agent,
COUNT(r.id_rapport) / 
TIMESTAMPDIFF(MONTH, a.date_embauche_agent, CURDATE()) AS productivite
FROM agent a
JOIN agent_administratif ad ON a.id_agent = ad.id_agent
JOIN redige rd ON a.id_agent = rd.id_agent
JOIN rapport r ON rd.id_rapport = r.id_rapport
JOIN agence ag ON a.id_agence = ag.id_agence
WHERE ag.nom_agence = 'Agence Toulouse'
GROUP BY a.id_agent;

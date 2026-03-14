SELECT area_id,
	   round(AVG(COALESCE(compensation_from,0)),3) AS avg_compensation_from,
	   round(AVG(COALESCE(compensation_to,0)),3) AS avg_compensation_to,
	   round(AVG((COALESCE(compensation_from,0) + COALESCE(compensation_to,0)) / 2.0),3) AS avg_middle_compensation
FROM vacancies
GROUP BY area_id
ORDER BY area_id;

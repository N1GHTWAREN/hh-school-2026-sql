SELECT area_id,
	   round(AVG(compensation_from), 3) AS avg_compensation_from,
	   round(AVG(compensation_to), 3) AS avg_compensation_to,
	   round(AVG((compensation_from + compensation_to) / 2.0), 3) AS avg_middle_compensation
FROM vacancies GROUP BY area_id ORDER BY area_id;
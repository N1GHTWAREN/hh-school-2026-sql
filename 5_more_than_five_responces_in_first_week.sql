SELECT vac.vacancy_id, vac.vacancy_name
FROM vacancies vac
JOIN responces res ON res.vacancy_id = vac.vacancy_id
WHERE res.date_of_responce <= vac.date_of_public + INTERVAL '7 days'
GROUP BY vac.vacancy_id, vac.vacancy_name
HAVING COUNT(res.responce_id) > 5;

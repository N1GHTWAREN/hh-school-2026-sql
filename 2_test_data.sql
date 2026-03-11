WITH test_data AS (SELECT generate_series(1, 1000000) AS id,
    					  md5(random()::text) AS name,
						  (random() * 100)::int AS a_id,
						  round((random() * 100000)::int) AS c_from,
						  (random() * 1000)::int AS s_id,
						  '2023-01-01'::timestamp + ('2026-01-01'::timestamp - '2023-01-01'::timestamp) * random() AS dat)
INSERT INTO vacancies (vacancy_id,
    				   vacancy_name,
					   area_id,
					   compensation_from,
					   compensation_to,
					   specialization_id,
					   date_of_public)
SELECT id, name, a_id, c_from, c_from + 10000, s_id, dat
FROM test_data;

WITH test_data AS (SELECT generate_series(1, 1000000) AS id,
						  md5(random()::text) AS name,
						  (random() * 10)::int AS exp,
						  round((random() * 100000)::int) AS income,
						  (random() * 1000)::int AS s_id,
						  (random() * 1000)::int AS c_id,
						  '2023-01-01'::timestamp + ('2026-01-01'::timestamp - '2023-01-01'::timestamp) * random() AS dat)
INSERT INTO resumes (resume_id,
    				 resume_name,
					 experience,
					 income_level,
					 specialization_id,
					 last_company_id,
					 date_of_public)
SELECT id, name, exp, income, s_id, c_id, dat
FROM test_data;

INSERT INTO responces (responce_id,
    				   vacancy_id,
					   resume_id,
					   date_of_responce)
SELECT row_number() OVER () AS responce_id,
	   vac.vacancy_id,
	   (random() * 1000000)::int + 1,
	   vac.date_of_public + (random() * interval '60 days')
FROM vacancies vac
CROSS JOIN LATERAL generate_series(1, (random() * 50)::int);

UPDATE vacancies vac
SET responce_ids = r.ids
FROM (SELECT vacancy_id,
        	 array_agg(responce_id ORDER BY responce_id) AS ids
      FROM responces GROUP BY vacancy_id) res
	  WHERE vac.vacancy_id = res.vacancy_id;
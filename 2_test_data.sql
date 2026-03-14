WITH test_data AS (SELECT md5(random()::text) AS name,
						  (random()*200000)::int AS income,
						  random() > 0.5 AS edu
				   FROM generate_series(1, 1000))
INSERT INTO specializations (specialization_name,
							 avg_income_level,
							 education)
SELECT name, income, edu
FROM test_data;

WITH test_data AS (SELECT md5(random()::text) AS name,
						  (random() * 100)::int AS a_id,
						  round((random() * 100000)::int) AS c_from,
						  floor(random() * (SELECT max(specialization_id) FROM specializations))::int + 1 AS s_id,
						  '2023-01-01'::timestamp + ('2026-01-01'::timestamp - '2023-01-01'::timestamp) * random() AS dat
				   FROM generate_series(1, 1000000))
INSERT INTO vacancies (vacancy_name,
					   area_id,
					   compensation_from,
					   compensation_to,
					   specialization_id,
					   date_of_public)
SELECT name, a_id, c_from, c_from + 10000, s_id, dat
FROM test_data;

WITH test_data AS (SELECT md5(random()::text) AS name,
						  (random() * 10)::int AS exp,
						  round((random() * 100000)::int) AS income,
						  floor(random() * (SELECT max(specialization_id) FROM specializations))::int + 1 AS s_id,
						  (random() * 1000)::int AS c_id,
						  '2023-01-01'::timestamp + ('2026-01-01'::timestamp - '2023-01-01'::timestamp) * random() AS dat
				   FROM generate_series(1, 1000000))
INSERT INTO resumes (resume_name,
					 experience,
					 income_level,
					 specialization_id,
					 last_company_id,
					 date_of_public)
SELECT name, exp, income, s_id, c_id, dat
FROM test_data;

WITH test_data AS (SELECT floor(random() * (SELECT max(vacancy_id) FROM vacancies))::int + 1 AS v_id,
        				  floor(random() * (SELECT max(resume_id) FROM resumes))::int + 1 AS r_id,
						  '2023-01-01'::timestamp + ('2026-01-01'::timestamp - '2023-01-01'::timestamp) * random() AS dat
				   FROM generate_series(1, 1000000))
INSERT INTO responces (vacancy_id,
					   resume_id,
					   date_of_responce)
SELECT v_id, r_id, dat
FROM test_data;

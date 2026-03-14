CREATE INDEX idx_vacancies_area_id ON vacancies(area_id); -- поле используется в аналитическом запросе GROUP BY area_id
CREATE INDEX idx_vacancies_date_of_public ON vacancies(date_of_public); -- поле используется для фильтрации по дате и статистики по месяцам

CREATE INDEX idx_resumes_date_of_public ON resumes(date_of_public); -- поле используется при расчете количества резюме по месяцам

CREATE INDEX idx_responces_vacancy_id ON responces(vacancy_id); -- важный индекс, используется в запросах JOIN responces ON responces.vacancy_id = vacancies.vacancy_id
CREATE INDEX idx_responces_vacancy_date ON responces(vacancy_id, date_of_responce); -- составной индекс для откликов по вакансии и дате оптимален для запроса, который был написан WHERE res.date_of_responce BETWEEN vac.date_of_public AND vac.date_of_public + INTERVAL '7 days'
CREATE INDEX idx_responces_resume_id ON responces(resume_id); -- поле используется при соединении responces.resume_id = resumes.resume_id

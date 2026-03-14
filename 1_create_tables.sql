CREATE TABLE specializations (
	specialization_id integer GENERATED ALWAYS AS IDENTITY primary key,
	specialization_name text not null,
	avg_income_level integer not null,
	education bool not null
);

CREATE TABLE vacancies (
	vacancy_id integer GENERATED ALWAYS AS IDENTITY primary key,
	vacancy_name text not null,
	area_id integer not null,
	compensation_from integer not null,
	compensation_to integer not null,
	specialization_id integer not null references specializations(specialization_id),
	date_of_public timestamp not null
);

CREATE TABLE resumes (
	resume_id integer GENERATED ALWAYS AS IDENTITY primary key,
	resume_name text not null,
	experience integer not null,
	income_level integer not null,
	specialization_id integer not null references specializations(specialization_id),
	last_company_id integer not null,
	date_of_public timestamp not null
);

CREATE TABLE responces (
	responce_id integer GENERATED ALWAYS AS IDENTITY primary key,
	vacancy_id integer not null references vacancies(vacancy_id),
	resume_id integer not null references resumes(resume_id),
	date_of_responce timestamp not null
);

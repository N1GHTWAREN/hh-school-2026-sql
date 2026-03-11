CREATE TABLE specializations (
	specialization_id serial primary key,
	specialization_name text not null,
	avg_income_level integer not null,
	education bool not null
);

CREATE TABLE vacancies (
	vacancy_id serial primary key,
	vacancy_name text not null,
	area_id integer not null,
	compensation_from integer not null,
	compensation_to integer not null,
	specialization_id integer not null,
	date_of_public timestamp not null,
	responce_ids integer[]
);

CREATE TABLE resumes (
	resume_id serial primary key,
	resume_name text not null,
	experience integer not null,
	income_level integer not null,
	specialization_id integer not null,
	last_company_id integer not null,
	date_of_public timestamp not null
);

CREATE TABLE responces (
	responce_id serial primary key,
	vacancy_id integer not null,
	resume_id integer not null,
	date_of_responce timestamp not null
);
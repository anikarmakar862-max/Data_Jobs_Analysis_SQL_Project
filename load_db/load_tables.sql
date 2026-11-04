--   company_dim table
CREATE TABLE public.company_dim (
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);
--   skills_dim table
CREATE TABLE public.skills_dim (
    skill_id INT PRIMARY KEY,
    skills VARCHAR (30),
    type VARCHAR (30)
);
--  data_jobs_postings table
CREATE TABLE public.data_jobs_postings (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(30),
    job_title VARCHAR(182),
    job_location VARCHAR(100),
    job_via VARCHAR(140),
    job_schedule_type VARCHAR(40),
    job_work_from_home BOOLEAN,
    search_location VARCHAR(35),
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country VARCHAR(35),
    salary_rate VARCHAR(5),
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id)
);

-- skills_to_job table with composite key
CREATE TABLE public.skills_to_job (
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES public.data_jobs_postings (job_id),
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id)
);

--   Create indexes on foreign key columns for better performance
CREATE INDEX index_company_id ON public.data_jobs_postings (company_id);
CREATE INDEX index_skill_id ON public.skills_to_job (skill_id);
CREATE INDEX index_job_id ON public.skills_to_job (job_id);
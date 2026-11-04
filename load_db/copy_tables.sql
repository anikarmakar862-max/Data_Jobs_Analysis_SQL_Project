-- copy csv_s to tables  -- order matters
COPY company_dim
FROM './Resources/company_dim.csv'
DELIMITER ',' CSV HEADER;

COPY skills_dim
FROM './Resources/skills_dim.csv'
DELIMITER ',' CSV HEADER;

COPY data_jobs_postings
FROM './Resources/job_postings_fact.csv'
DELIMITER ',' CSV HEADER;

COPY skills_to_job
FROM './Resources/skills_job_dim.csv'
DELIMITER ',' CSV HEADER; 




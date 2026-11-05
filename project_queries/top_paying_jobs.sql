/* What are the top paying jobs for my roles, location and country */

SELECT
    job_title,
    job_title_short,
    company_dim.name AS company_name,
    job_location,
    job_country,
    ROUND (salary_year_avg, 2) AS average_salary

FROM
    data_jobs_postings

LEFT JOIN 
    company_dim
    ON data_jobs_postings.company_id = company_dim.company_id

WHERE
    job_title_short IN ('Data Analyst', 'Data Scientist', 'Business Analyst')
    AND
    (   LOWER (job_location) LIKE '%india%' -- in India
     OR LOWER (job_location) LIKE '%anywhere%' ) -- Remote Jobs
    AND
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT  500;


SELECT
    skills_dim.skills AS job_skill,
    data_jobs_postings.job_title_short,
    data_jobs_postings.job_location,
    data_jobs_postings.job_country,
    ROUND (data_jobs_postings.salary_year_avg, 2) AS average_salary

FROM
    data_jobs_postings

LEFT JOIN 
    skills_to_job
    ON data_jobs_postings.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim
    ON skills_to_job.skill_id = skills_dim.skill_id

WHERE
    job_title_short IN ('Data Analyst', 'Data Scientist', 'Business Analyst')
    AND
    (   LOWER (job_location) LIKE '%india%' -- in India
     OR LOWER (job_location) LIKE '%anywhere%' ) -- Remote Jobs
    AND
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC;

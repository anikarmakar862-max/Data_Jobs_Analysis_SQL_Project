SELECT
    skills_dim.skills AS job_skill,
    ROUND (AVG (data_jobs_postings.salary_year_avg), 0) AS average_salary
FROM
   data_jobs_postings   
INNER JOIN
    skills_to_job ON data_jobs_postings.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim ON skills_to_job.skill_id = skills_dim.skill_id

WHERE
    data_jobs_postings.job_title_short IN ('Data Analyst', 'Data Scientist', 'Business Analyst')
    AND
    (   LOWER (job_location) LIKE '%india%'   -- in India
     OR LOWER (job_location) LIKE '%anywhere%' ) -- Remote Jobs
    AND
    salary_year_avg IS NOT NULL
GROUP BY
  skills_dim.skills
ORDER BY
    average_salary DESC;
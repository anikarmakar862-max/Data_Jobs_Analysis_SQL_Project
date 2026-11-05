SELECT
    skills_dim.skills AS job_skill,
    COUNT(data_jobs_postings.job_id) AS job_count
FROM
   data_jobs_postings   
INNER JOIN
    skills_to_job ON data_jobs_postings.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim ON skills_to_job.skill_id = skills_dim.skill_id

WHERE
    data_jobs_postings.job_title IN ('Data Analyst', 'Data Scientist', 'Business Analyst')
    AND
    (   LOWER (job_location) LIKE '%india%' 
     OR LOWER (job_location) LIKE '%anywhere%' )

GROUP BY
  skills_dim.skills
ORDER BY
    job_count DESC;
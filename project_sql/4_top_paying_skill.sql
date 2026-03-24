/*
Answer: What are the top skills based on salary?
Look at the average salary associated with each skill for Data Analyst positions
Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
limit 50

/*
Top-Tier Outliers: Pyspark and Bitbucket are the highest-paying skills, 
commanding premium average salaries of approximately $208,000 and $189,000, respectively.

Data Science Dominance: Specialized data tools like Pandas, Jupyter, and Numpy represent a 
high-value cluster with average earnings consistently exceeding $143,000.

Lucrative Baseline: Even the 50th ranked skill on this list (Qlik) maintains a high floor of nearly $100,000, 
reflecting strong market demand across all top tech competencies.

*/
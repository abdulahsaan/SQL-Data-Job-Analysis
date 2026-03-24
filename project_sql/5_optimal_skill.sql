/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
- offering strategic insights for career development in data analysis
*//*
WITH high_demand_skill AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT(skills_dim.skill_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
), 
high_avg_salary AS (
    SELECT
        skills_dim.skill_id,
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
        skills_dim.skill_id
)
SELECT
    high_demand_skill.skill_id,
    high_demand_skill.skills,
    demand_count,
    average_salary
FROM
    high_demand_skill
INNER JOIN high_avg_salary ON high_demand_skill.skill_id = high_avg_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25 
*/
-- rewriting the same query more concisely 
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_dim.skills_id) AS skill_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 5


/*
Question: What skills are required for top-paying data analyst job?
- Use the top 10 highest-pyaing data analyst job from the first query
- Add the specific skill required for these role
- Why? it provide a detailed at which highest-paying jobs demand certain skill,
     helping job skill understand which skill to devlop that align with top salaries 
*/
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere'
    ORDER BY 
        salary_year_avg DESC 
        LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM
     top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
        salary_year_avg DESC 

/*

📊 Key Insights from the Dataset
1️⃣ Most Demanded Skills

These skills appear the most in job postings.

Rank	Skill	Frequency
1	Python	7
2	SQL	6
3	R	5
4	Tableau	3
5	Looker	3
6	Excel	3

👉 Insight:
The core data analyst toolkit clearly appears to be:

Python + SQL + R

*/
/***************************************************/
/*

[
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "job_posted_date": "2023-09-25 10:59:56",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "job_posted_date": "2023-09-25 10:59:56",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "job_posted_date": "2023-09-25 10:59:56",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders",
    "skills": "qlik"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "job_posted_date": "2023-11-23 12:38:59",
    "company_name": "Overmind",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "job_posted_date": "2023-11-23 12:38:59",
    "company_name": "Overmind",
    "skills": "python"
  },
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-06-26 17:00:18",
    "company_name": "EPIC Brokers",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-02-26 01:04:44",
    "company_name": "InvestM Technology LLC",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-02-26 01:04:44",
    "company_name": "InvestM Technology LLC",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-02-26 01:04:44",
    "company_name": "InvestM Technology LLC",
    "skills": "power bi"
  }
]

*/
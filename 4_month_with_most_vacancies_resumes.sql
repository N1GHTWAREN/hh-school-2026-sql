SELECT 'vacancy' AS type, month, count
FROM (SELECT date_trunc('month', date_of_public) AS month, COUNT(*) count
      FROM vacancies GROUP BY month ORDER BY count DESC LIMIT 1)
UNION ALL
SELECT 'resume', month, count
FROM (SELECT date_trunc('month', date_of_public) AS month, COUNT(*) count
      FROM resumes GROUP BY month ORDER BY count DESC LIMIT 1);

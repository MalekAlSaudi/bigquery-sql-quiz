-- This query shows a list of the daily top Google Search terms.
SELECT
 refresh_date AS week,
 term AS Top_Term,
 rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank = 1 OR rank = 2 OR rank = 3
 -- Choose the top 3 terms each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
 -- Filter to the last 1 MONTH.
GROUP BY week, Top_Term, rank
ORDER BY week DESC
 -- Show the weeks in reverse chronological order and groups by week.
 

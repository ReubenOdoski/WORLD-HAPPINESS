--1. Top 10 Happiest Countries Across All Years
SELECT Country, Year, Score FROM World_Happiness
ORDER BY Score DESC
LIMIT 10;

--2. Average Happiness Score per Year
SELECT Year, AVG(Score) AS Avg_Score FROM World_Happiness
GROUP BY Year
ORDER BY Year;

--3. Average Happiness Score per Country
SELECT Country, AVG(Score) AS Avg_Score
FROM World_Happiness 
GROUP BY Country
ORDER BY Avg_Score DESC
LIMIT 20;

--4. Top 10 Countries by GDP per Capita
SELECT Country, Year, GDP_per_Capita
FROM World_Happiness
ORDER BY GDP_per_Capita DESC
LIMIT 10;

--5. Countries with the Largest Improvement from 2015 → 2019
--For Improvement:
SELECT h1.Country, h2.Score - h1.Score AS Score_Change FROM World_Happiness h1
JOIN World_Happiness h2
ON h1.Country = h2.Country
WHERE h1.Year = 2015
AND h2.Year = 2019
ORDER BY Score_Change DESC
LIMIT 10;

--For Biggest Decline:
SELECT h1.Country,
       h2.Score - h1.Score AS Score_Change
FROM World_Happiness h1
JOIN World_Happiness h2
    ON h1.Country = h2.Country
WHERE h1.Year = 2015
  AND h2.Year = 2019
ORDER BY Score_Change ASC
LIMIT 10;


--6.Top 10 Countries with Highest Social Support
SELECT Country, Year, Social_Support
FROM World_Happiness
ORDER BY Social_Support DESC
LIMIT 10;

--7.7. Average Happiness Score by Region
--(Works only for 2015–2016 where Region exists)
SELECT Region, AVG(Score) AS Avg_Score
FROM World_Happiness
WHERE Region IS NOT NULL
GROUP BY Region
ORDER BY Avg_Score DESC;

--8. Top 10 Countries with Lowest Corruption
SELECT Country, Year, Perceptions_of_Corruption
FROM World_Happiness
WHERE Perceptions_of_Corruption IS NOT NULL
ORDER BY Perceptions_of_Corruption ASC
LIMIT 10;

--9.Relationship Between Freedom and Happiness Score
SELECT Country, Year, Freedom, Score
FROM World_Happiness
ORDER BY Freedom DESC;

--10.Rank Countries by Happiness Score
SELECT Country, Score
FROM World_Happiness
ORDER BY Score DESC;


--11. Get Happiness Trend Over All Years for the happiest Country (Finland)
SELECT Year, Score
FROM World_Happiness
WHERE Country = 'Finland'
ORDER BY Year;

--12. Volatility Index: 15 Most Emotionally Unstable Countries (Measures how much happiness score varies across years).
SELECT 
    Country,
    AVG(Score) AS Avg_Score,
    (AVG(Score * Score) - AVG(Score) * AVG(Score)) AS Score_Variance
FROM World_Happiness
GROUP BY Country
ORDER BY Score_Variance DESC
LIMIT 15;

--13. Determine each Country's Top Contributors to Happiness
SELECT 
    Country,
    Year,
    GDP_per_Capita + Social_Support + Healthy_Life_Expectancy + Freedom
         + Generosity - Perceptions_of_Corruption AS Component_Sum,
    Score
FROM World_Happiness
ORDER BY Component_Sum DESC;

--14.Countries With High Freedom but Low Happiness
SELECT 
    Country,
    Year,
    Freedom,
    Score
FROM World_Happiness
WHERE Freedom > 0.5 AND Score < 5
ORDER BY Freedom DESC;

--15. Countries With High Corruption but High Happiness
SELECT 
    Country,
    Year,
    Perceptions_of_Corruption,
    Score
FROM World_Happiness
WHERE Perceptions_of_Corruption > 0.4
ORDER BY Score DESC;

--16. Top 10 Most Generous Countries Over All Years
SELECT 
    Country,
    AVG(Generosity) AS Avg_Generosity
FROM World_Happiness
GROUP BY Country
ORDER BY Avg_Generosity DESC
LIMIT 10;

--17.Countries With Strong Social Support but Poor Happiness
SELECT 
    Country,
    Year,
    Social_Support,
    Score
FROM World_Happiness
WHERE Social_Support > 1 AND Score < 5
ORDER BY Social_Support DESC;

--18.. Cluster Countries by Score Level (Simple Classification)
SELECT 
    Country,
    Year,
    Score,
    CASE
        WHEN Score >= 7 THEN 'Very Happy'
        WHEN Score >= 6 THEN 'Happy'
        WHEN Score >= 5 THEN 'Neutral'
        ELSE 'Unhappy'
    END AS Happiness_Level
FROM World_Happiness;



--19. Country with the highest happiness for each Year
SELECT country, year, score from World_Happiness
Group BY Year
order by score DESC

--20. Top 10 countries with the highest hhealthy life expectancy
SELECT Country, Healthy_Life_Expectancy from World_Happiness
order by Healthy_Life_Expectancy DESC
limit 10
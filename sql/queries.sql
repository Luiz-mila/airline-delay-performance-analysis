-- What are the airlines with the highest delay rates?
SELECT 
    Airline,
    COUNT(*) AS total_flights,
    SUM(Delay) AS total_delayed,
    ROUND(AVG(Delay) * 100, 2) AS delay_rate_pct
FROM flights
GROUP BY Airline
ORDER BY delay_rate_pct DESC;


-- Which days of the week have the highest delay rates?
SELECT 
    DayOfWeek,
    COUNT(*) AS total_flights,
    ROUND(AVG(Delay) * 100, 2) AS delay_rate_pct
FROM flights
GROUP BY DayOfWeek
ORDER BY DayOfWeek;


-- Which time of day has the highest delay rates?
SELECT 
    CASE 
        WHEN Time BETWEEN 0 AND 359 THEN 'Dawn (00h-06h)'
        WHEN Time BETWEEN 360 AND 719 THEN 'Morning (06h-12h)'
        WHEN Time BETWEEN 720 AND 1079 THEN 'Afternoon (12h-18h)'
        ELSE 'Night (18h-24h)'
    END AS time_period,
    COUNT(*) AS total_flights,
    ROUND(AVG(Delay) * 100, 2) AS delay_rate_pct
FROM flights
GROUP BY time_period
ORDER BY delay_rate_pct DESC;

-- Which routes have the highest delay rates?
SELECT 
    AirportFrom,
    AirportTo,
    COUNT(*) AS total_flights,
    ROUND(AVG(Delay) * 100, 2) AS delay_rate_pct
FROM flights
GROUP BY AirportFrom, AirportTo
HAVING COUNT(*) > 100
ORDER BY delay_rate_pct DESC
LIMIT 10;
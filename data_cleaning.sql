UPDATE space_missions
SET Location = SUBSTRING_INDEX(Location, ',', 2);

ALTER TABLE space_missions
ADD COLUMN decade VARCHAR(40);

UPDATE space_missions
SET decade = CASE
    WHEN date BETWEEN '1957-01-01' AND '1959-12-31' THEN '1950s'
    WHEN date BETWEEN '1960-01-01' AND '1969-12-31' THEN '1960s'
    WHEN date BETWEEN '1970-01-01' AND '1979-12-31' THEN '1970s'
    WHEN date BETWEEN '1980-01-01' AND '1989-12-31' THEN '1980s'
    WHEN date BETWEEN '1990-01-01' AND '1999-12-31' THEN '1990s'
    WHEN date BETWEEN '2000-01-01' AND '2000-12-31' THEN '2000s'
    WHEN date BETWEEN '2010-01-01' AND '2019-12-31' THEN '2010s'
    ELSE '2020s'
END;

SET sql_safe_updates = 1;

SELECT * FROM space_missions;

ALTER TABLE space_missions
ADD COLUMN time_period VARCHAR(40);

UPDATE space_missions
SET time_period = CASE
    WHEN Time IS NULL THEN 'Unknown'
    WHEN Time BETWEEN '00:00:00' AND '03:59:59' THEN 'Midnight'
    WHEN Time BETWEEN '04:00:00' AND '05:59:59' THEN 'Early Morning'
    WHEN Time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN Time = '12:00:00' THEN 'Noon'
    WHEN Time BETWEEN '12:00:01' AND '15:59:59' THEN 'Afternoon'
    WHEN Time BETWEEN '16:00:00' AND '18:59:59' THEN 'Evening'
    ELSE 'Night'
END;

SET sql_safe_updates = 0;


UPDATE space_missions
SET Mission = 'Tubular Bells, Part One'
WHERE time = '14:47:00' AND rocket = 'LauncherOne';

UPDATE space_missions
SET Mission = 'NOSS-8'
WHERE time = '10:06:00' AND rocket = 'Atlas-H MSD';

UPDATE space_missions
SET Mission = REPLACE(Mission, 'nt-', 'No. ')
WHERE Mission LIKE '%nt-%';

SELECT rocketstatus, SUM(price) 
FROM space_missions
WHERE rocketstatus = 'Retired'
GROUP BY 1;

UPDATE space_missions
SET Mission = 'Luna 1 (E-1 No.4)'
WHERE Mission LIKE '%E-1 No.4%' OR Mission LIKE '%E-1 nt-4%';

UPDATE space_missions
SET Mission = 'Luna 2 (E-1A No.2)'
WHERE Mission LIKE '%E-1A No. 2%' OR Mission LIKE '%E-1A nt-2%';

UPDATE space_missions
SET Mission = 'Luna 3 (E-2A No.1)'
WHERE Mission LIKE '%E-2A No. 1%' OR Mission LIKE '%E-2A nt-1%';

UPDATE space_missions
SET Mission = 'Diadème 2'
WHERE time = '10:06:00';

SELECT mission, COUNT(*) 
FROM space_missions
GROUP BY 1
ORDER BY 2 DESC;

UPDATE space_missions
SET Launch_site = 'VLS Pad, Alcântara Launch Center, Maranhão'
WHERE rocket = 'VLS-1';

UPDATE space_missions
SET Country = 'Brazil'
WHERE rocket = 'VLS-1';
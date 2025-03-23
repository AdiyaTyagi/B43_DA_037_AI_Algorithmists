# Creating new Database 
CREATE DATABASE IF NOT EXISTS constructweek;

# Selecting a Database
USE constructweek;

# View the Tables that exists in the selected Database 
SHOW TABLES;

# Describing the Table
DESC cleaned_mxmh;

# Retrieving the data 
SELECT * FROM cleaned_mxmh;


# 1. Most Preferred Streaming Servie
SELECT Primary_streaming_service, COUNT(*) AS Users 
FROM cleaned_mxmh 
GROUP BY Primary_streaming_service 
ORDER BY Users DESC;


# 2. Most Preferred Music Genre by Age Group
SELECT 
    CASE 
        WHEN Age BETWEEN 10 AND 20 THEN 'Teenagers'
        WHEN Age BETWEEN 21 AND 30 THEN 'Young Adults'
        WHEN Age BETWEEN 31 AND 40 THEN 'Adults'
        ELSE 'Older Adults' 
    END AS Age_Group,
    Fav_genre, COUNT(*) AS Listener_Count
FROM cleaned_mxmh 
GROUP BY Age_Group, Fav_genre
ORDER BY Listener_Count DESC;

# 3. Do People Who Listen to Music While Working Have Lower Stress Levels?
SELECT While_working, AVG(Anxiety) AS Avg_Anxiety, AVG(Depression) AS Avg_Depression 
FROM cleaned_mxmh 
GROUP BY While_working;

# 4. Most Popular Genres Among Foreign Language Music Listeners
SELECT Fav_genre, COUNT(*) AS Listeners 
FROM cleaned_mxmh 
WHERE Foreign_languages = 'Yes' 
GROUP BY Fav_genre 
ORDER BY Listeners DESC;

# 5. Does BPM (Beats Per Minute) of Songs Affect Mental Health?
SELECT 
    CASE 
        WHEN BPM < 100 THEN 'Slow Tempo'
        WHEN BPM BETWEEN 100 AND 130 THEN 'Medium Tempo'
        ELSE 'Fast Tempo'
    END AS BPM_Category,
    AVG(Anxiety) AS Avg_Anxiety, 
    AVG(Depression) AS Avg_Depression
FROM cleaned_mxmh 
GROUP BY BPM_Category 
ORDER BY Avg_Anxiety DESC;

# 6. Which Genres Are Most Associated with Improving Mental Health?
SELECT Fav_genre, COUNT(*) AS Count 
FROM cleaned_mxmh 
WHERE Music_effects = 'Improve'
GROUP BY Fav_genre 
ORDER BY Count DESC;

# 7. How does Listening Time Affect Mental Health?
SELECT 
    CASE 
        WHEN Hours_per_day < 1 THEN 'Less than 1 hour'
        WHEN Hours_per_day BETWEEN 1 AND 3 THEN '1-3 hours'
        WHEN Hours_per_day BETWEEN 4 AND 6 THEN '4-6 hours'
        ELSE 'More than 6 hours' 
    END AS Listening_Hours,
    AVG(Anxiety) AS Avg_Anxiety, 
    AVG(Depression) AS Avg_Depression 
FROM cleaned_mxmh 
GROUP BY Listening_Hours 
ORDER BY Listening_Hours;

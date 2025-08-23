CREATE TABLE daily_activity (
    Id BIGINT NULL,
    ActivityDate DATE NULL,
    TotalSteps INT NULL,
    TotalDistance FLOAT NULL,
    TrackerDistance FLOAT NULL,
    LoggedActivitiesDistance FLOAT NULL,
    VeryActiveDistance FLOAT NULL,
    ModeratelyActiveDistance FLOAT NULL,
    LightActiveDistance FLOAT NULL,
    SedentaryActiveDistance FLOAT NULL,
    VeryActiveMinutes INT NULL,
    FairlyActiveMinutes INT NULL,
    LightlyActiveMinutes INT NULL,
    SedentaryMinutes INT NULL,
    Calories INT NULL
);

CREATE TABLE daily_calories (
    Id BIGINT NULL,
    ActivityDay DATE NULL,
    Calories INT NULL
);

CREATE TABLE daily_intensities (
    Id BIGINT NULL,
    ActivityDay DATE NULL,
    SedentaryMinutes INT NULL,
    LightlyActiveMinutes INT NULL,
    FairlyActiveMinutes INT NULL,
    VeryActiveMinutes INT NULL
);

CREATE TABLE daily_steps (
    Id BIGINT NULL,
    ActivityDay DATE NULL,
    StepTotal INT NULL
);

CREATE TABLE heartrate_seconds (
    Id BIGINT NULL,
    Time DATETIME NULL,
    Value INT NULL
);

CREATE TABLE hourly_calories (
    Id BIGINT NULL,
    ActivityHour DATETIME NULL,
    Calories INT NULL
);

CREATE TABLE hourly_intensities (
    Id BIGINT NULL,
    ActivityHour DATETIME NULL,
    TotalIntensity INT NULL,
    AverageIntensity FLOAT NULL
);

CREATE TABLE hourly_steps (
    Id BIGINT NULL,
    ActivityHour DATETIME NULL,
    StepTotal INT NULL
);

CREATE TABLE minute_calories_narrow (
    Id BIGINT NULL,
    ActivityMinute DATETIME NULL,
    Calories FLOAT NULL
);

CREATE TABLE minute_calories_wide (
    Id BIGINT NULL,
    Time DATETIME NULL,
    Calories FLOAT NULL
    -- Additional columns if there are multiple Ids side by side, let me know if so
);

CREATE TABLE minute_intensities_narrow (
    Id BIGINT NULL,
    ActivityMinute DATETIME NULL,
    Intensity INT NULL
);

CREATE TABLE minute_intensities_wide (
    Id BIGINT NULL,
    Time DATETIME NULL,
    Intensity FLOAT NULL
    -- Add more columns if it's a wide format with multiple users
);

CREATE TABLE minute_mets_narrow (
    Id BIGINT NULL,
    ActivityMinute DATETIME NULL,
    METs FLOAT NULL
);

CREATE TABLE minute_sleep (
    Id BIGINT NULL,
    DateTime DATETIME NULL,
    Value INT NULL,
    LogId BIGINT NULL
);

CREATE TABLE minute_steps_narrow (
    Id BIGINT NULL,
    ActivityMinute DATETIME NULL,
    Steps INT NULL
);

CREATE TABLE minute_steps_wide (
    Id BIGINT NULL,
    Time DATETIME NULL,
    Steps INT NULL
    -- Add more columns if wide format
);

CREATE TABLE sleep_day (
    Id BIGINT NULL,
    SleepDay DATETIME NULL,
    TotalSleepRecords INT NULL,
    TotalMinutesAsleep INT NULL,
    TotalTimeInBed INT NULL
);

CREATE TABLE weight_log (
    Id BIGINT NULL,
    Date DATETIME NULL,
    WeightKg FLOAT NULL,
    WeightPounds FLOAT NULL,
    Fat FLOAT NULL,
    BMI FLOAT NULL,
    IsManualReport BIT NULL,
    LogId BIGINT NULL
);

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

-- 1. DailyActivityMerged2.csv
BULK INSERT daily_activity
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\DailyActivityMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 2. DailyCaloriesMerged1.csv
BULK INSERT daily_calories
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\DailyCaloriesMerged1.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 3. DailyIntensitiesMerged1.csv
--i used import flat file

-- 4. DailyStepsMerged1.csv
BULK INSERT daily_steps
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\DailyStepsMerged1.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 5. HeartrateSecondsMerged2.csv
BULK INSERT heartrate_seconds
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\HeartrateSecondsMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 6. HourlyCaloriesMerged2.csv
BULK INSERT hourly_calories
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\HourlyCaloriesMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 7. HourlyIntensitieMerged2.csv
BULK INSERT hourly_intensities
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\HourlyIntensitieMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 8. HourlyStepsMerged2.csv
BULK INSERT hourly_steps
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\HourlyStepsMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 9. MinuteCaloriesNarrowMerged2.csv
BULK INSERT minute_calories_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteCaloriesNarrowMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 10. MinuteCaloriesWideMerged1.csv
BULK INSERT minute_calories_wide
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteCaloriesWideMerged1.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 11. MinuteIntensitiesNarrowMerged2.csv
BULK INSERT minute_intensities_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteIntensitiesNarrowMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 12. MinuteIntensitiesWideMerged1.csv
-- importfile

-- 13. MinuteMETsNarrowMerged2.csv
BULK INSERT minute_mets_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteMETsNarrowMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 14. MinuteSleepMerged2.csv
BULK INSERT minute_sleep
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteSleepMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 15. MinuteStepsNarrowMerged2.csv
BULK INSERT minute_steps_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\MinuteStepsNarrowMerged2.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 16. MinuteStepsWideMerged1.csv
-- used importfile

-- 17. SleepDayMerged1.csv
BULK INSERT sleep_day
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 4.12.16-5.12.16\SleepDayMerged1.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');

-- 18. WeightLogInfoMerged1.csv
-- importfile

--NOW FOR FIRST MONTH DATA
-- 1. DailyActivityMerged1.csv
BULK INSERT daily_activity
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\DailyActivityMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 2. HeartrateSecondsMerged1.csv
BULK INSERT heartrate_seconds
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\HeartrateSecondsMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 3. HourlyCaloriesMerged1.csv
BULK INSERT hourly_calories
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\HourlyCaloriesMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 4. HourlyIntensitiesMerged1.csv
BULK INSERT hourly_intensities
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\HourlyIntensitiesMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 5. HourlyStepsMerged1.csv
BULK INSERT hourly_steps
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\HourlyStepsMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 6. MinuteCaloriesNarrowMerged1.csv
BULK INSERT minute_calories_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\MinuteCaloriesNarrowMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 7. MinuteIntensitiesNarrowMerged1.csv
BULK INSERT minute_intensities_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\MinuteIntensitiesNarrowMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 8. MinuteMETsNarrowMerged1.csv
BULK INSERT minute_mets_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\MinuteMETsNarrowMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 9. MinuteSleepMerged1.csv
BULK INSERT minute_sleep
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\MinuteSleepMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

-- 10. MinuteStepsNarrowMerged1.csv
BULK INSERT minute_steps_narrow
FROM 'C:\Bellabeat-Fitbit-Data-Case-Study\DatasetRaw\Fitabase Data 3.12.16-4.11.16\MinuteStepsNarrowMerged1.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

SELECT 'daily_activity' AS count_all, COUNT(*) AS total_rows FROM dbo.daily_activity
UNION ALL
SELECT 'daily_calories', COUNT(*) FROM dbo.daily_calories
UNION ALL
SELECT 'daily_intensities', COUNT(*) FROM dbo.daily_intensities
UNION ALL
SELECT 'daily_steps', COUNT(*) FROM dbo.daily_steps
UNION ALL
SELECT 'heartrate_seconds', COUNT(*) FROM dbo.heartrate_seconds
UNION ALL
SELECT 'hourly_calories', COUNT(*) FROM dbo.hourly_calories
UNION ALL
SELECT 'hourly_intensities', COUNT(*) FROM dbo.hourly_intensities
UNION ALL
SELECT 'hourly_steps', COUNT(*) FROM dbo.hourly_steps
UNION ALL
SELECT 'minute_calories_narrow', COUNT(*) FROM dbo.minute_calories_narrow
UNION ALL
SELECT 'minute_calories_wide', COUNT(*) FROM dbo.minute_calories_wide
UNION ALL
SELECT 'minute_intensities_narrow', COUNT(*) FROM dbo.minute_intensities_narrow
UNION ALL
SELECT 'minute_intensities_wide', COUNT(*) FROM dbo.minute_intensities_wide
UNION ALL
SELECT 'minute_mets_narrow', COUNT(*) FROM dbo.minute_mets_narrow
UNION ALL
SELECT 'minute_sleep', COUNT(*) FROM dbo.minute_sleep
UNION ALL
SELECT 'minute_steps_narrow', COUNT(*) FROM dbo.minute_steps_narrow
UNION ALL
SELECT 'minute_steps_wide', COUNT(*) FROM dbo.minute_steps_wide
UNION ALL
SELECT 'sleep_day', COUNT(*) FROM dbo.sleep_day;

SELECT * FROM dbo.daily_activity;
SELECT * FROM dbo.daily_calories;
SELECT * FROM dbo.daily_intensities;
SELECT * FROM dbo.daily_steps;
SELECT * FROM dbo.heartrate_seconds;
SELECT * FROM dbo.hourly_calories;
SELECT * FROM dbo.hourly_intensities;
SELECT * FROM dbo.hourly_steps;
SELECT * FROM dbo.minute_calories_narrow;
SELECT * FROM dbo.minute_calories_wide;
SELECT * FROM dbo.minute_intensities_narrow;
SELECT * FROM dbo.minute_intensities_wide;
SELECT * FROM dbo.minute_mets_narrow;
SELECT * FROM dbo.minute_sleep;
SELECT * FROM dbo.minute_steps_narrow;
SELECT * FROM dbo.minute_steps_wide;
SELECT * FROM dbo.sleep_day;

-- (daily_activity)
-- Remove rows with NULLs in key columns
DELETE FROM daily_activity
WHERE Id IS NULL OR ActivityDate IS NULL;

-- Remove duplicates
WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityDate ORDER BY Id) AS rn
  FROM daily_activity
)
DELETE FROM CTE WHERE rn > 1;

-- (daily_calories)
DELETE FROM daily_calories
WHERE Id IS NULL OR ActivityDay IS NULL OR Calories IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityDay ORDER BY Id) AS rn
  FROM daily_calories
)
DELETE FROM CTE WHERE rn > 1;

-- (daily_intensities)
-- Remove duplicates
DELETE FROM daily_intensities
WHERE Id IS NULL OR ActivityDay IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityDay ORDER BY Id) AS rn
  FROM daily_intensities
)
DELETE FROM CTE WHERE rn > 1;

-- (daily_steps)
DELETE FROM daily_steps
WHERE Id IS NULL OR ActivityDay IS NULL OR StepTotal IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityDay ORDER BY Id) AS rn
  FROM daily_steps
)
DELETE FROM CTE WHERE rn > 1;

-- (heartrate_seconds)
DELETE FROM heartrate_seconds
WHERE Id IS NULL OR Time IS NULL OR Value IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, Time ORDER BY Id) AS rn
  FROM heartrate_seconds
)
DELETE FROM CTE WHERE rn > 1;

-- hourly_calories
DELETE FROM hourly_calories
WHERE Id IS NULL OR ActivityHour IS NULL OR Calories IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityHour ORDER BY Id) AS rn
  FROM hourly_calories
)
DELETE FROM CTE WHERE rn > 1;

-- hourly_intensities
DELETE FROM hourly_intensities
WHERE Id IS NULL OR ActivityHour IS NULL OR TotalIntensity IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityHour ORDER BY Id) AS rn
  FROM hourly_intensities
)
DELETE FROM CTE WHERE rn > 1;

-- hourly_steps
DELETE FROM hourly_steps
WHERE Id IS NULL OR ActivityHour IS NULL OR StepTotal IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityHour ORDER BY Id) AS rn
  FROM hourly_steps
)
DELETE FROM CTE WHERE rn > 1;

-- minute_calories_narrow
DELETE FROM minute_calories_narrow
WHERE Id IS NULL OR ActivityMinute IS NULL OR Calories IS NULL;

WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Id, ActivityMinute ORDER BY Id) AS rn
  FROM minute_calories_narrow
)
DELETE FROM CTE WHERE rn > 1;

-- minute_calories_wide
-- First, remove rows with NULL Id
DELETE FROM minute_calories_wide
WHERE Id IS NULL;

-- Then, remove duplicate rows
WITH CTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY Id, Calories00, Calories01, Calories02, Calories03, Calories04, Calories05,
                         Calories06, Calories07, Calories08, Calories09, Calories10, Calories11,
                         Calories12, Calories13, Calories14, Calories15, Calories16, Calories17,
                         Calories18, Calories19, Calories20, Calories21, Calories22, Calories23,
                         Calories24, Calories25, Calories26, Calories27, Calories28, Calories29,
                         Calories30, Calories31, Calories32, Calories33, Calories34, Calories35,
                         Calories36, Calories37, Calories38, Calories39, Calories40, Calories41,
                         Calories42, Calories43, Calories44, Calories45, Calories46, Calories47,
                         Calories48, Calories49, Calories50, Calories51, Calories52, Calories53,
                         Calories54, Calories55, Calories56, Calories57, Calories58, Calories59
            ORDER BY Id
        ) AS rn
    FROM dbo.minute_calories_wide
)
DELETE FROM CTE WHERE rn > 1;

-- minute_intensities_narrow
DELETE FROM minute_intensities_narrow
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, ActivityMinute, Intensity
        ORDER BY Id
    ) AS rn
    FROM minute_intensities_narrow
)
DELETE FROM CTE WHERE rn > 1;

-- minute_intensities_wide
DELETE FROM minute_intensities_wide
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, ActivityHour,
            Intensity00, Intensity01, Intensity02, Intensity03, Intensity04, Intensity05,
            Intensity06, Intensity07, Intensity08, Intensity09, Intensity10, Intensity11,
            Intensity12, Intensity13, Intensity14, Intensity15, Intensity16, Intensity17,
            Intensity18, Intensity19, Intensity20, Intensity21, Intensity22, Intensity23,
            Intensity24, Intensity25, Intensity26, Intensity27, Intensity28, Intensity29,
            Intensity30, Intensity31, Intensity32, Intensity33, Intensity34, Intensity35,
            Intensity36, Intensity37, Intensity38, Intensity39, Intensity40, Intensity41,
            Intensity42, Intensity43, Intensity44, Intensity45, Intensity46, Intensity47,
            Intensity48, Intensity49, Intensity50, Intensity51, Intensity52, Intensity53,
            Intensity54, Intensity55, Intensity56, Intensity57, Intensity58, Intensity59
        ORDER BY Id
    ) AS rn
    FROM minute_intensities_wide
)
DELETE FROM CTE WHERE rn > 1;

-- minute_mets_narrow
DELETE FROM minute_mets_narrow
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, ActivityMinute, METs
        ORDER BY Id
    ) AS rn
    FROM minute_mets_narrow
)
DELETE FROM CTE WHERE rn > 1;

-- minute_sleep
DELETE FROM minute_sleep
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, DateTime, Value, LogId
        ORDER BY Id
    ) AS rn
    FROM minute_sleep
)
DELETE FROM CTE WHERE rn > 1;

-- minute_steps_narrow
DELETE FROM minute_steps_narrow
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, ActivityMinute, Steps
        ORDER BY Id
    ) AS rn
    FROM minute_steps_narrow
)
DELETE FROM CTE WHERE rn > 1;

-- minute_steps_wide
DELETE FROM minute_steps_wide
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, ActivityHour,
            Steps00, Steps01, Steps02, Steps03, Steps04, Steps05,
            Steps06, Steps07, Steps08, Steps09, Steps10, Steps11,
            Steps12, Steps13, Steps14, Steps15, Steps16, Steps17,
            Steps18, Steps19, Steps20, Steps21, Steps22, Steps23,
            Steps24, Steps25, Steps26, Steps27, Steps28, Steps29,
            Steps30, Steps31, Steps32, Steps33, Steps34, Steps35,
            Steps36, Steps37, Steps38, Steps39, Steps40, Steps41,
            Steps42, Steps43, Steps44, Steps45, Steps46, Steps47,
            Steps48, Steps49, Steps50, Steps51, Steps52, Steps53,
            Steps54, Steps55, Steps56, Steps57, Steps58, Steps59
        ORDER BY Id
    ) AS rn
    FROM minute_steps_wide
)
DELETE FROM CTE WHERE rn > 1;

-- sleep_day
DELETE FROM sleep_day
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed
        ORDER BY Id
    ) AS rn
    FROM sleep_day
)
DELETE FROM CTE WHERE rn > 1;

-- weight_log
DELETE FROM weight_log
WHERE Id IS NULL;

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY Id, Date, WeightKg, WeightPounds, Fat, BMI, IsManualReport, LogId
        ORDER BY Id
    ) AS rn
    FROM weight_log
)
DELETE FROM CTE WHERE rn > 1;

-- daily_steps
SELECT 
    Id,
    AVG(StepTotal) AS AvgStepsPerDay
FROM 
    dbo.daily_steps
GROUP BY 
    Id;

-- Time-Based Activity Trends
SELECT 
    DATEPART(HOUR, ActivityHour) AS Hour,
    AVG(StepTotal) AS AvgSteps
FROM 
    dbo.hourly_steps
GROUP BY 
    DATEPART(HOUR, ActivityHour)
ORDER BY 
    Hour;

-- Time-Based Activity Trends (by week)
SELECT 
    DATENAME(WEEKDAY, ActivityHour) AS DayOfWeek,
    AVG(StepTotal) AS AvgSteps
FROM 
    dbo.hourly_steps
GROUP BY 
    DATENAME(WEEKDAY, ActivityHour)
ORDER BY 
    CASE DATENAME(WEEKDAY, ActivityHour)
        WHEN 'Sunday' THEN 1
        WHEN 'Monday' THEN 2
        WHEN 'Tuesday' THEN 3
        WHEN 'Wednesday' THEN 4
        WHEN 'Thursday' THEN 5
        WHEN 'Friday' THEN 6
        WHEN 'Saturday' THEN 7
    END;

-- Average Active vs Sedentary Minutes
SELECT 
    AVG(VeryActiveMinutes) AS AvgVeryActive,
    AVG(FairlyActiveMinutes) AS AvgFairlyActive,
    AVG(LightlyActiveMinutes) AS AvgLightlyActive,
    AVG(SedentaryMinutes) AS AvgSedentary
FROM 
    dbo.daily_activity;

-- Correlation Between Steps, Calories, and Active Minutes
SELECT 
    TotalSteps,
    Calories,
    VeryActiveMinutes
FROM 
    dbo.daily_activity;

-- Average sleep duration (in hours) per user
SELECT 
    Id,
    AVG(TotalMinutesAsleep) / 60.0 AS AvgHoursAsleep
FROM 
    dbo.sleep_day
GROUP BY 
    Id;

-- Average time in bed per user
SELECT 
    Id,
    AVG(TotalTimeInBed) / 60.0 AS AvgHoursInBed
FROM 
    dbo.sleep_day
GROUP BY 
    Id;

-- Sleep efficiency
SELECT 
    Id,
    AVG(CAST(TotalMinutesAsleep AS FLOAT) / NULLIF(TotalTimeInBed, 0)) * 100 AS SleepEfficiencyPercent
FROM 
    dbo.sleep_day
GROUP BY 
    Id;

 -- Average heart rate per user
 SELECT 
    Id,
    AVG(Value) AS AvgHeartRate
FROM 
    dbo.heartrate_seconds
GROUP BY 
    Id;

 -- Distribution by hour
 SELECT 
    DATEPART(HOUR, Time) AS Hour,
    AVG(Value) AS AvgHeartRate
FROM 
    dbo.heartrate_seconds
GROUP BY 
    DATEPART(HOUR, Time)
ORDER BY 
    Hour;

-- Average weight and BMI per user
SELECT 
    Id,
    AVG(WeightKg) AS AvgWeightKg,
    AVG(BMI) AS AvgBMI
FROM 
    dbo.weight_log
GROUP BY 
    Id;




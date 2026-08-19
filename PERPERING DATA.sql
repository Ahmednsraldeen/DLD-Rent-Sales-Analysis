SELECT  TOP 10 * FROM [Transactions-2026-01-01] 

-----------------------------------------------

SELECT COUNT(*) FROM [Transactions-2026-01-01]

-----------------------------------------------

SELECT 
COLUMN_NAME ,
DATA_TYPE,
CHARACTER_MAXIMUM_LENGTH,
IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Transactions-2026-01-01'
ORDER BY ORDINAL_POSITION

----------------------------------------------------

ALTER TABLE [Transactions-2026-01-01]
DROP COLUMN NEAREST_MALL_EN,NEAREST_LANDMARK_EN

------------------------------------------------------------------------
ALTER TABLE [Transactions-2026-01-01]
ADD ROW_ID INT  IDENTITY (1,1)

----------------------------------------------------------------

SELECT
SUM(CASE WHEN AREA_EN IS NULL THEN 1 ELSE 0 END) AS MISSING_AERE,
SUM (CASE WHEN TRANS_VALUE IS NULL THEN 1 ELSE 0 END) AS MISSING_VALUE,
SUM(CASE WHEN NEAREST_METRO_EN IS NULL THEN 1 ELSE 0 END ) AS MISSING_AC_AREA
FROM [Transactions-2026-01-01]


---------------------------------------
UPDATE  [Transactions-2026-01-01] SET ROOMS_EN =  PROP_SB_TYPE_EN WHERE ROOMS_EN = 'NA'


-------------------------------------------------
SELECT  TOP 10 * FROM [Transactions-2026-01-01] 

-------------------------------------------------------------------------

SELECT  INSTANCE_DATE,GROUP_EN,TRANS_VALUE,ACTUAL_AREA,AREA_EN,PROJECT_EN,ROOMS_EN,PARKING,IS_OFFPLAN_EN,IS_FREE_HOLD_EN,USAGE_EN
,COUNT(*) AS REPETED
FROM [Transactions-2026-01-01]
GROUP BY  INSTANCE_DATE,GROUP_EN,TRANS_VALUE,ACTUAL_AREA ,AREA_EN,PROJECT_EN,ROOMS_EN,PARKING,IS_OFFPLAN_EN,IS_FREE_HOLD_EN,USAGE_EN
HAVING COUNT (*)>1 


------------------------------------------------------------------
ALTER TABLE [Transactions-2026-01-01]  ADD PRICE_PER_M AS (TRANS_VALUE/NULLIF(ACTUAL_AREA,0))
----------------------------------------------------------------
UPDATE [Transactions-2026-01-01]
SET 
    GROUP_EN = TRIM(GROUP_EN),
    IS_OFFPLAN_EN = TRIM(IS_OFFPLAN_EN),
    IS_FREE_HOLD_EN = TRIM(IS_FREE_HOLD_EN),
    USAGE_EN = TRIM(USAGE_EN),
    AREA_EN = TRIM(AREA_EN),
    PROP_SB_TYPE_EN = TRIM(PROP_SB_TYPE_EN),
    ROOMS_EN = TRIM(ROOMS_EN),
    PARKING = TRIM(PARKING),
    PROJECT_EN = TRIM(PROJECT_EN)

    ----------------------------------------------------------------------
    UPDATE [Transactions-2026-01-01]
SET 
    GROUP_EN = UPPER(TRIM(GROUP_EN)),
    IS_OFFPLAN_EN = UPPER(TRIM(IS_OFFPLAN_EN)),
    IS_FREE_HOLD_EN = UPPER(TRIM(IS_FREE_HOLD_EN)),
    USAGE_EN = UPPER(TRIM(USAGE_EN)),
    AREA_EN = UPPER (TRIM(AREA_EN)),
    PROP_SB_TYPE_EN = UPPER (TRIM(PROP_SB_TYPE_EN)),
    ROOMS_EN = UPPER (TRIM(ROOMS_EN)),
    PARKING = UPPER(TRIM(PARKING)),
    PROJECT_EN = UPPER(TRIM(PROJECT_EN))

    -------------------------------------------------------------
    SELECT COUNT(*) AS STILL_SPACE
    FROM [Transactions-2026-01-01]
    WHERE AREA_EN <> TRIM(AREA_EN)
    OR PROJECT_EN <> TRIM(PROJECT_EN)

    ----------------------------------------------------------
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS
      WHERE TABLE_NAME = 'Transactions-2026-01-01'


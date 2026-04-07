WITH DEDUP_ITEMS AS (
SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate DESC) AS deduped_row_num
FROM {{ source('source', 'items') }}
)
SELECT 
    id,
    name,
    category,
    updateDate
FROM DEDUP_ITEMS
WHERE deduped_row_num = 1;
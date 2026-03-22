USE pharmacy_inventory;
SELECT
name,
packing,
expiry,
qty,
tvalue,

CASE
WHEN STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y') < '2025-01-01'
THEN 'Expired'

WHEN DATEDIFF(
STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y'),
'2025-01-01'
) <= 60
THEN 'Expiring Soon'

ELSE 'Safe'

END AS status

FROM medicines;
SELECT
expiry,
SUM(tvalue) AS total_value
FROM medicines
GROUP BY expiry
ORDER BY expiry;
SELECT
name,
qty
FROM medicines
ORDER BY tvalue DESC
LIMIT 10;
SELECT
SUM(tvalue) AS total_inventory_value
FROM medicines;
SELECT
SUM(tvalue) AS expired_stock_loss
FROM medicines
WHERE STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y') < '2025-01-01';
SELECT
name,
packing,
expiry,
qty
FROM medicines
WHERE DATEDIFF(
STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y'),
'2025-01-01'
) <= 60
AND STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y') >= '2025-01-01';
SELECT
name,
expiry,

CASE
WHEN STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y') < '2025-01-01'
THEN 'Expired'

WHEN DATEDIFF(
STR_TO_DATE(CONCAT('01-',expiry),'%d-%b-%y'),
'2025-01-01'
) <= 60
THEN 'Expiring Soon'

ELSE 'Safe'

END AS status

FROM medicines;
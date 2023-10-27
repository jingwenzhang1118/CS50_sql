
-- *** The Lost Letter ***
-- Find the id of the address
SELECT * FROM "addresses"
WHERE "address" = '900 Somerville Avenue'; -- from address id = 432

SELECT * FROM "addresses"
WHERE "address" = '2 Finnegan Street';

SELECT * FROM "addresses"
WHERE "address" LIKE '2 Finnegan%';

SELECT * FROM "addresses"
WHERE "address" LIKE '2 %';

SELECT * FROM "addresses"
WHERE "address" LIKE '2 Finnigan Street'; -- to address id = 854, residential

-- identify the id of the package
SELECT * FROM "packages"
WHERE "from_address_id" = 432
AND "to_address_id" = 854; -- package id = 384

-- check where it was delivered
SELECT * FROM "scans"
WHERE "package_id" = 384; -- delivered at the right address

-- *** The Devious Delivery ***
-- Find the expected delivery address and package id
SELECT * FROM "packages"
WHERE "from_address_id" is NULL; -- package id = 5098, to address is = 50, content is duck debugger

-- Find the drop-off address
SELECT * FROM "scans"
WHERE "package_id" = 5098; -- it was dropped at address 348

-- Find the type of the location
SELECT * FROM "addresses"
WHERE "id" = 348;

-- *** The Forgotten Gift ***
-- Find the id of the addresses
SELECT * FROM "addresses"
WHERE "address" = '109 Tileston Street' OR "address" = '728 Maple Place'; -- from_address_id = 9873, to_address_id = 4983

-- Find the id of the package
SELECT * FROM "packages"
WHERE "from_address_id" = 9873 OR "to_address_id" = 4983; -- package id = 9523, content = "flowers"

-- Find the driver and where it was delivered
SELECT * FROM "scans"
WHERE "package_id" = 9523; -- dopped of address = 7432, driver_id = 17

-- Find the name of the driver
SELECT * FROM "drivers"
WHERE "id" = 17;






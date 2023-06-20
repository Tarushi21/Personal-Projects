USE BANK;

/*DATA TRANSFORNATION IN TRANSACTIONS TABLE

CONVERT 2016 TXN_YEAR TO 2017
CONVERT 2017 TXN_YEAR TO 2018
CONVERT 2018 TXN_YEAR TO 2019
CONVERT 2019 TXN_YEAR TO 2020
CONVERT 2020 TXN_YEAR TO 2021
CONVERT 2021 TXN_YEAR TO 2022*/

SELECT DISTINCT YEAR(DATE) FROM TRANSACTIONS
ORDER BY 1 DESC;

UPDATE TRANSACTIONS
SET DATE =DATEADD('YEAR', '1', DATE)
WHERE YEAR(DATE) = 2016;

SELECT MIN(DATE), MAX(DATE) FROM TRANSACTIONS;
SELECT COUNT(*) FROM TRANSACTIONS;

/*IN BANK COLUMN REPLACING NULL WITH 
'SKY BANK' FOR THE YEAR 2022
DBS BANK FOR 2021
NOTHERN BANK FOR 2019
SOUTHERN BANK FOR 2018
ADB BANK FOR 2017*/

UPDATE TRANSACTIONS
SET BANK = 'Sky Bank' WHERE BANK IS NULL AND YEAR(DATE) = 2022;

UPDATE TRANSACTIONS
SET BANK = 'DBS Bank' WHERE BANK IS NULL AND YEAR(DATE) = 2021;

UPDATE TRANSACTIONS
SET BANK = 'Northern Bank' WHERE BANK = 'Nothern Bank' AND YEAR(DATE) = 2019;

UPDATE TRANSACTIONS
SET BANK = 'Southern Bank' WHERE BANK ='Sothern Bank' AND YEAR(DATE) = 2018;

UPDATE TRANSACTIONS
SET BANK = 'ADB Bank' WHERE BANK IS NULL AND YEAR(DATE) = 2017;

SELECT * FROM TRANSACTIONS WHERE BANK IS NULL;
-----------------------------------------------------------------------------------

SELECT * FROM CARD;

SELECT DISTINCT YEAR(ISSUED) FROM CARD;

------ADD COLUMN AGE IN CLIENT TABLE--------------

CREATE OR REPLACE TABLE CLIENT AS
SELECT c.CLIENT_ID, c.SEX, c.BIRTH_DATE, c.DISTRICT_ID, MAX(YEAR(t.DATE))- YEAR(c.BIRTH_DATE) AS AGE
FROM CLIENT c 
JOIN ACCOUNT a ON a.DISTRICT_ID=c.DISTRICT_ID
JOIN TRANSACTIONS t ON t.account_id=a.account_id
GROUP BY 1,2,3,4;

--THE ABOVE TASK CAN ALSO BE DONE USING ALTER COMMAND

SELECT * FROM CLIENT
ORDER BY CLIENT_ID;

---------------------------------------------------
/*DATA TRANSFORNATION IN CARD TABLE

CONVERT 2016 TXN_YEAR TO 2017
CONVERT 2017 TXN_YEAR TO 2018
CONVERT 2018 TXN_YEAR TO 2019
CONVERT 2019 TXN_YEAR TO 2020
CONVERT 2020 TXN_YEAR TO 2021
CONVERT 2021 TXN_YEAR TO 2022*/

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2021;

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2020;

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2019;

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2018;

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2017;

UPDATE CARD
SET ISSUED =DATEADD('YEAR', '1', ISSUED)
WHERE YEAR(ISSUED) = 2016;

SELECT DISTINCT YEAR(ISSUED) FROM CARD;

SELECT * FROM CARD;

SELECT * FROM TRANSACTIONS;

SELECT YEAR(DATE), BANK 
FROM TRANSACTIONS
WHERE BANK='Sky Bank'
AND YEAR(DATE) = '2021/';

SELECT year(DATE) AS X, COUNT(TYPE) AS Y FROM TRANSACTIONS
WHERE X = 2022 AND Type = 'Credit'
GROUP BY 1;


SELECT SUM(amount ordered)
FROM orders
WHERE item = 'chicken breast'
          AND month IN ('May','June')
          AND year = '2018';

SELECT CONCAT('', (SUM(population)*2.00)) AS 'Coffee Cost'
FROM world
WHERE name IN ('Germany', 'Spain');
SELECT SUM(amount ordered)
FROM orders
WHERE item = 'chicken breast'
          AND month IN ('May','June')
          AND year = '2018';

SELECT CONCAT('', (SUM(population)*2.00)) AS 'Coffee Cost'
FROM world
WHERE name IN ('Germany', 'Spain');Hola mundoHola mundo
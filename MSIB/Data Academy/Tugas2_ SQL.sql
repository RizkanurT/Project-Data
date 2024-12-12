SELECT * FROM belajar.orders;
SELECT * FROM belajar.customers;
SELECT * FROM belajar.orderdetails;
SELECT * FROM belajar.employees;

-- nomer 1 
SELECT
	A.customerNumber,
	A.country,
	B.orderNumber,
	SUM(C.quantityOrdered) AS qty_order
FROM belajar.customers A
JOIN belajar.orders B
ON A.customerNumber = B.customerNumber
JOIN belajar.orderdetails C
ON B.orderNumber = C.orderNumber
GROUP BY A.customerNumber, A.country, B.orderNumber;

-- Nomer 2
SELECT
	A.productCode,
	A.productName,
	SUM(B.quantityOrdered) AS kuantitas
FROM belajar.products A
JOIN belajar.orderdetails B 
ON A.productCode = B.productCode
GROUP BY A.productName
ORDER BY kuantitas DESC
LIMIT 10;

-- nomer 3
SELECT 
	A.employeeNumber,
    CONCAT(A.firstName, ' ', A.lastName) AS SalesRep,
    B.customerNumber,
    C.orderNumber,
    SUM(D.quantityOrdered * D.priceEach) AS TotalRevenue
FROM belajar.employees A 
JOIN belajar.customers B 
ON A.employeeNumber = B.salesRepEmployeeNumber
JOIN belajar.orders C  
ON B.customerNumber = C.customerNumber
JOIN belajar.orderdetails D
ON C.orderNumber = D.orderNumber
GROUP BY SalesRep;

-- Nomer 4
SELECT 
	A.country,
	AVG(A.creditLimit) AS AverageCreditLimit 
FROM belajar.customers A
GROUP BY A.country;

-- Nomer 5
SELECT 
	A.officeCode,
	A.city AS Kota,
COUNT(C.customerNumber) AS NumberOfCustomers
FROM belajar.offices A
LEFT JOIN belajar.employees B
ON A.officeCode = B.officeCode
LEFT JOIN belajar.customers C 
ON B.employeeNumber = C.salesRepEmployeeNumber
GROUP BY A.city;







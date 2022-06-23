/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name AS 'Product', c.Name AS 'Category' FROM bestbuy.products AS P
 INNER JOIN categories AS c on c.CategoryID = p.CategoryID
 WHERE p.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating FROM bestbuy.products AS p
LEFT JOIN bestbuy.reviews AS r on p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS Total FROM bestbuy.Employees AS e
INNER JOIN bestbuy.Sales AS s on s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID ORDER BY Total DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department', c.Name AS 'Category' From departments AS d
LEFT JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name LIKE '%liance%' OR c.Name LIKE '%ame%';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name as 'Product Name', SUM(s.Quantity) as 'Quantity Sold', s.PricePerUnit * SUM(s.Quantity) as 'Total Price Sold' FROM sales as s
LEFT JOIN products AS p ON p.ProductID = s.ProductID
WHERE p.Name LIKE '%Hotel California%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'Product Name', r.Reviewer AS 'Reviewer Name', MIN(r.Rating) AS 'Rating', r.Comment AS 'Comment' FROM products AS p
LEFT JOIN reviews AS r on r.ProductID = r.ProductID
WHERE p.Name LIKE 'Visio tv' AND r.Rating = 1
ORDER BY r.Rating ASC;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS TotalSold 
FROM sales AS s
JOIN employees AS e ON e.EmployeeID = s.EmployeeID
JOIN products AS p ON p.ProductID = s.ProductID
Group BY e.EmployeeID, p.ProductID
ORDER BY TotalSold DESC;
USE northwind;

/*
1. List the product id, product name, unit price and category name of all products.
Order by category name and within that, by product name.
*/
SELECT
	ProductID,
	ProductName,
	UnitPrice,
	CategoryName
FROM
	Products p
	JOIN Categories c ON(c.CategoryID = p.CategoryID)
ORDER BY
	CategoryName,
	ProductName;

/*
2. List the product id, product name, unit price and supplier name of all products
that cost more than $75. Order by product name.
*/
SELECT
	ProductID,
	ProductName,
	UnitPrice,
	CompanyName
FROM
	Products p
	JOIN Suppliers s ON(s.SupplierID = p.SupplierID)
WHERE
	UnitPrice > 75
ORDER BY
	ProductName;
	
/*
3. List the product id, product name, unit price, category name, and supplier name
of every product. Order by product name.
*/
SELECT
	productID,
	productName,
	unitPrice,
	categoryName,
	CompanyName
FROM
	Products p
	JOIN Suppliers s ON (s.supplierID = p.supplierID)
	JOIN Categories c ON(c.categoryID = p.categoryID)
ORDER BY
	productName;
	
/*
4. What is the product name(s) and categories of the most expensive products?
HINT: Find the max price in a subquery and then use that in your more complex
query that joins products with categories.
*/
SELECT
	productName,
	categoryName
FROM
	Products p
	JOIN Categories c ON(c.CategoryID = p.CategoryID)
WHERE
	unitPrice IN(
    SELECT
		MAX(unitPrice)
	FROM
		Products
    );
    
/*
5. List the order id, ship name, ship address, and shipping company name of every
order that shipped to Germany.
*/
SELECT
	orderID,
	shipName,
	shipAddress,
	companyName
FROM
	Orders o
	JOIN Shippers s ON(s.shipperID = o.shipVia)
WHERE
	shipCountry = "Germany";
/*
6. List the order id, order date, ship name, ship address of all orders that ordered
"Sasquatch Ale"?
*/
SELECT
	o.orderID,
	orderDate,
	shipName,
	ShipAddress,
	productName
FROM
	Orders o
	JOIN `Order Details` od ON(od.OrderID = o.OrderID)
	JOIN Products p ON(p.ProductID = od.ProductID)
Where
	productName = "Sasquatch Ale"
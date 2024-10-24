SELECT Customer.name AS CustomerName,
    Product.name AS ProductName,
    Order.quantity,
    Delivery.date
FROM Order o
    JOIN Customer c ON o.Customer_nif = c.nif
    JOIN Product p ON o.Productcode = p.code
    JOIN Delivery d ON o.OrderID = d.OrderID
WHERE d.date BETWEEN 'startDate???' AND 'endDate???';

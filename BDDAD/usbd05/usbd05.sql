SELECT c.name AS CustomerName,
    p.name AS ProductName,
    po.quantity,
    d.dateDelivery
FROM ClientOrder o
    JOIN Customer c ON o.Customer_nif = c.nif
    JOIN ProductionOrder po ON o.ID = po.OrderID
    JOIN Product p ON po.Productcode = p.code
    JOIN Delivery d ON o.ID = d.OrderID
WHERE d.dateDelivery BETWEEN TO_DATE('15/09/2020', 'DD/MM/YYYY') AND TO_DATE('30/12/2024', 'DD/MM/YYYY');
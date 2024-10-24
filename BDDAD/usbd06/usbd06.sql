SELECT wt.name AS WorkstationType
FROM ProductOrder po
    INNER JOIN Product p ON po.Productcode = p.code
    INNER JOIN BillOfOperations boo ON p.ProductFamilyID = boo.ProductFamilyID
    INNER JOIN Operation_WorkstationType owt ON boo.OperationID = owt.Operation_ID
    INNER JOIN WorkstationType wt ON owt.WorkstationType_ID = wt.ID
WHERE ProductOrder.OrderID = 'orderID???';

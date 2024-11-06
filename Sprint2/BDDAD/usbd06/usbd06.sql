SELECT DISTINCT wt.name AS WorkstationType
FROM ProductionOrder po
         INNER JOIN Product p ON po.Productcode = p.code
         INNER JOIN BillOfOperations boo ON p.ProductFamily_ID = boo.ProductFamilyID
         INNER JOIN Operation_WorkstationType owt ON boo.OperationID = owt.Operation_ID
         INNER JOIN WorkstationType wt ON owt.WorkstationType_ID = wt.ID
WHERE po.OrderID = 1;

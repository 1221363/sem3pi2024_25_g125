SELECT boo.sequenceNumber AS "Operation Sequence",
       op.description AS "Operation Description",
       wt.name AS "Workstation Type"
FROM Product p
         INNER JOIN BillOfOperations boo ON p.ProductFamily_ID = boo.ProductFamilyID
         INNER JOIN Operation op ON boo.OperationID = op.ID
         INNER JOIN Operation_WorkstationType owt ON op.ID = owt.Operation_ID
         INNER JOIN WorkstationType wt ON owt.WorkstationType_ID = wt.ID
WHERE p.code = 'AS12945S22'
ORDER BY boo.sequenceNumber;

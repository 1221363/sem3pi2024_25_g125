SELECT
    bom.child_code AS "Part Code",
    SUM(bom.quantity * po.quantity) AS "Total Quantity"
FROM
    ProductionOrder po
        JOIN
    BillOfMaterials bom
    ON
        po.Productcode = bom.parent_code
WHERE
    po.OrderID = 1
GROUP BY
    po.OrderID, bom.child_code
ORDER BY
    po.OrderID, "Part Code";

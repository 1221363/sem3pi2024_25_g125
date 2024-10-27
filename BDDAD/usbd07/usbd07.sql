SELECT
    bom.child_code AS "Part Code",
    SUM(bom.quantity * po.quantity) AS "Total Quantity"
FROM
    ProductionOrder po
        JOIN
    BillOfMaterials bom
    ON
        po.Productcode = bom.parent_code  -- Relaciona o código do produto na ProductionOrder com o parent_code na BillOfMaterials
WHERE
    po.OrderID = 1  -- Código específico da ordem de cliente
GROUP BY
    po.OrderID, bom.child_code
ORDER BY
    po.OrderID, "Part Code";

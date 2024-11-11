-- As a Production Manager, I want to register an order in the system.
-- Acceptance criteria: A function should be used to create the order, and to return
-- the Order ID or an error. An order must be from an active customer and a
-- product in the current line-up.

CREATE OR REPLACE FUNCTION RegisterOrder ( -- não preciso de pedir a order ID pois é gerada
    p_product_id IN VARCHAR2,
    po_quantity IN NUMBER,
    c_nif IN NUMBER,
    o_dateOrder IN DATE
) RETURN VARCHAR2
IS
    v_message VARCHAR2(255);
    v_order_id NUMBER;
BEGIN
    -- Verificar se o product_id já existe na tabela Product
BEGIN
    SELECT code INTO v_message
    FROM Product
    WHERE code = p_product_id;

EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Error: Product does not exist.';
END;

   -- Verificar se o nif do cliente existe e está ativo na tabela Customer
BEGIN
SELECT status INTO v_message
FROM Customer
WHERE nif = c_nif AND status = 'active';

EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Error: Customer does not exist or is not active.';
END;

BEGIN
    INSERT INTO ClientOrder (Customer_nif, dateOrder)
    VALUES (c_nif, o_dateOrder);

    -- Obter o último OrderID inserido com MAX()
    SELECT MAX(ID) INTO v_order_id FROM ClientOrder;

    -- Inserir a ordem de produção associada ao produto e à quantidade
    INSERT INTO ProductionOrder (OrderID, ProductCode, quantity)
    VALUES (v_order_id, p_product_id, po_quantity);

    -- Mensagem de sucesso com o ID da ordem gerada
    RETURN 'Order registered successfully with Order ID: ' || v_order_id;

EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error: Unable to register order due to an unexpected issue.';
END;
END;
/

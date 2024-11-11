DECLARE
v_result VARCHAR2(255);
BEGIN
    v_result := RegisterOrder(
        p_product_id => 'AS1111S11',
        po_quantity => 100,
        c_nif => 348,
        o_dateOrder => TO_DATE('01/05/2021', 'DD/MM/YYYY')
    );

    -- Exibir o resultado
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

DECLARE
v_result VARCHAR2(255);
BEGIN
    v_result := RegisterProduct(
        p_product_id => 'AS1111S11',
        p_ProductFamily_ID => 125,
        p_name => 'Product AS1111S11',
        p_description => 'Description for product AS1111S11'
    );

    -- Output the result
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

CREATE OR REPLACE FUNCTION RegisterProduct (
    p_product_id IN VARCHAR2,
    p_ProductFamily_ID IN NUMBER,
    p_name IN VARCHAR2,
    p_description IN VARCHAR2
) RETURN VARCHAR2
IS
    v_message VARCHAR2(255);
BEGIN
    -- Verificar se o ProductFamily_ID existe na tabela ProductFamily
BEGIN
    SELECT ID INTO v_message
    FROM ProductFamily
    WHERE ID = p_ProductFamily_ID;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Error: No data found.';
END;

    -- Verificar se o product_id já existe na tabela Product
BEGIN
    SELECT code INTO v_message
    FROM Product
    WHERE code = p_product_id;
    RETURN 'Error: Product with this ID already exists.';
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL; -- Continua se o produto não existir
END;

    -- Verificar se o nome do produto já existe na tabela Product
BEGIN
    SELECT name INTO v_message
    FROM Product
    WHERE name = p_name;
    RETURN 'Error: Product with this name already exists.';
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL; -- Continua se o nome não existir
END;

    -- Verificar se a descrição do produto já existe na tabela Product
BEGIN
    SELECT description INTO v_message
    FROM Product
    WHERE description = p_description;
    RETURN 'Error: Product with this description already exists.';
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL; -- Continua se a descrição não existir
END;

    -- Tentar inserir o novo produto
BEGIN
    INSERT INTO Product (code, ProductFamily_ID, name, description)
    VALUES (p_product_id, p_ProductFamily_ID, p_name, p_description);

    -- Se for bem-sucedido, definir mensagem de sucesso
    RETURN 'Product registered successfully.';
EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error: Unable to register product due to an unexpected issue.';
END;
END;
/

DECLARE
    result VARCHAR2(100);
BEGIN

    -- test 1: try to deactivate a customer with valid data
    result := deactivateCustomer(785);
    DBMS_OUTPUT.PUT_LINE('Test 1 - ' || result);

    -- test 2: try to deactivate a customer that does not exist
    result := deactivateCustomer(000);
    DBMS_OUTPUT.PUT_LINE('Test 2 - ' || result);

    -- test 3: try to deactivate a customer that is already deactivated
    result := deactivateCustomer(785);
    DBMS_OUTPUT.PUT_LINE('Test 3 - ' || result);

    -- test 4: try to deactivate a customer with undelivered orders
    result := deactivateCustomer(657);
    DBMS_OUTPUT.PUT_LINE('Test 4 - ' || result);

END;

--

-- test 5: check if only the first customer was deactivated
SELECT *
FROM Customer c
WHERE c.nif IN (785);

SELECT *
FROM Customer c
WHERE c.nif IN (657);

--

-- delete the test data if necessary
UPDATE Customer c
SET c.status = 'active'
WHERE c.nif IN (785);


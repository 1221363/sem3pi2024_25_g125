CREATE OR REPLACE FUNCTION deactivateCustomer(
    c_customerNif IN Customer.nif%TYPE
)
    RETURN VARCHAR2 IS

    CUSTOMER_NIF_DOES_NOT_EXIST EXCEPTION;
    CUSTOMER_ALREADY_DEACTIVATED EXCEPTION;
    CUSTOMER_HAS_UNDELIVERED_ORDERS EXCEPTION;

    cNifCount   NUMBER; -- stores the number of customers with the same nif in the database
    cStatus     VARCHAR2(25); -- stores the status of the customer
    cOrderCount NUMBER; -- stores the number of undelivered orders for the customer

BEGIN

    -- check if the customer exists and raise an exception if it does not
    SELECT COUNT(*)
    INTO cNifCount
    FROM Customer c
    WHERE c.nif = c_customerNif;

    IF cNifCount = 0 THEN
        RAISE CUSTOMER_NIF_DOES_NOT_EXIST;
    END IF;

    -- check if the customer is already deactivated and raise an exception if it is
    SELECT c.status
    INTO cStatus
    FROM Customer c
    WHERE c.nif = c_customerNif;

    IF LOWER(cStatus) = 'deactivated' THEN
        RAISE CUSTOMER_ALREADY_DEACTIVATED;
    END IF;

    -- check if the customer has undelivered orders and raise an exception if it does
    SELECT COUNT(*)
    INTO cOrderCount
    FROM ClientOrder co
             JOIN Delivery d ON co.ID = d.OrderID
    WHERE co.Customer_nif = c_customerNif
      AND d.dateDelivery IS NULL;

    IF
        cOrderCount > 0 THEN
        RAISE CUSTOMER_HAS_UNDELIVERED_ORDERS;
    END IF;

    -- deactivate the customer
    UPDATE Customer c
    SET c.status = 'deactivated'
    WHERE c.nif = c_customerNif;

    RETURN 'Customer successfully deactivated.';

EXCEPTION
    WHEN CUSTOMER_NIF_DOES_NOT_EXIST THEN
        RETURN 'Error: Customer nif does not exist.';
    WHEN CUSTOMER_ALREADY_DEACTIVATED THEN
        RETURN 'Error: Customer is already deactivated.';
    WHEN CUSTOMER_HAS_UNDELIVERED_ORDERS THEN
        RETURN 'Error: Customer has undelivered orders.';
    WHEN OTHERS THEN
        RETURN 'Error: Customer could not be deactivated.';

END deactivateCustomer;

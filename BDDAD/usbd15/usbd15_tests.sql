DECLARE
    result VARCHAR2(100);
BEGIN

    -- test 1: try to register a workstation with valid data
    result := registerWorkstation('1000', 'A4578', 'Test 01', 'Test station');
    DBMS_OUTPUT.PUT_LINE('Test 1 - ' || result);

    -- test 2: try to register a workstation with the same id
    result := registerWorkstation('1000', 'A4578', 'Test 02', 'Test station');
    DBMS_OUTPUT.PUT_LINE('Test 2 - ' || result);

    -- test 3: try to register a workstation with the same name
    result := registerWorkstation('1001', 'A4578', 'Test 01', 'Test station');
    DBMS_OUTPUT.PUT_LINE('Test 3 - ' || result);

    -- test 4: try to register a workstation with a non-existent workstation type
    result := registerWorkstation('1002', 'N0000', 'Test 05', 'Test station');
    DBMS_OUTPUT.PUT_LINE('Test 5 - ' || result);

END;

--

-- test 5: check if only the first workstation was registered
SELECT *
FROM Workstation w
WHERE w.ID IN ('1000');

SELECT *
FROM Workstation w
WHERE w.ID IN ('1001');

SELECT *
FROM Workstation w
WHERE w.ID IN ('1002');

--

-- delete the test data if necessary
DELETE
FROM Workstation w
WHERE w.ID IN ('1000');

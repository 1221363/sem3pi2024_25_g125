CREATE OR REPLACE FUNCTION registerWorkstation(
    w_workstationID IN Workstation.ID%TYPE,
    w_workstationTypeID IN WorkstationType.ID%TYPE,
    w_name IN Workstation.name%TYPE,
    w_description IN Workstation.description%TYPE
)
    RETURN VARCHAR2 IS

    WORKSTATION_ID_ALREADY_EXISTS EXCEPTION;
    WORKSTATION_NAME_ALREADY_EXISTS EXCEPTION;
    WORKSTATION_TYPE_DOES_NOT_EXIST EXCEPTION;

    wIdCount   NUMBER; -- stores the number of workstations with the same id in the database
    wNameCount NUMBER; -- stores the number of workstations with the same name in the database
    wTypeCount NUMBER; -- stores the number of workstation types with the same id in the database

BEGIN

    -- check if the workstation id or name(unique) already exists and raise an exception if it does
    SELECT COUNT(*)
    INTO wIdCount
    FROM Workstation w
    WHERE w.ID = w_workstationID;

    IF wIdCount > 0 THEN
        RAISE WORKSTATION_ID_ALREADY_EXISTS;
    END IF;

    -- check if the workstation id or name(unique) already exists and raise an exception if it does
    SELECT COUNT(*)
    INTO wNameCount
    FROM Workstation w
    WHERE w.name = w_name;

    IF wNameCount > 0 THEN
        RAISE WORKSTATION_NAME_ALREADY_EXISTS;
    END IF;

    -- check if the workstation type exists and raise an exception if it does not
    SELECT COUNT(*)
    INTO wTypeCount
    FROM WorkstationType w
    WHERE w.ID = w_workstationTypeID;

    IF wTypeCount = 0 THEN
        RAISE WORKSTATION_TYPE_DOES_NOT_EXIST;
    END IF;

    -- insert the workstation into the database
    INSERT INTO Workstation (ID, WorkstationType_ID, name, description)
    VALUES (w_workstationID, w_workstationTypeID, w_name, w_description);

    RETURN 'Workstation registered successfully.';

EXCEPTION
    WHEN WORKSTATION_ID_ALREADY_EXISTS THEN
        RETURN 'Error: Workstation id already exists.';
    WHEN WORKSTATION_NAME_ALREADY_EXISTS THEN
        RETURN 'Error: Workstation name already exists.';
    WHEN WORKSTATION_TYPE_DOES_NOT_EXIST THEN
        RETURN 'Error: Workstation type id does not exist.';
    WHEN OTHERS THEN
        RETURN 'Error: Workstation could not be registered.';

END registerWorkstation;

SELECT * FROM Fedas_InputOrder;
/
SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE RejectInputOrder(InputOrder_Id IN Fedas_InputOrder.Id%type)
AS
  in_status Fedas_InputOrder.STATUS%type;
  sNew Fedas_InputOrder.STATUS%type := 1;
  sReject Fedas_InputOrder.STATUS%type := 3;
  ex_invalid_status exception;
BEGIN
  SELECT STATUS INTO in_status FROM Fedas_InputOrder
  WHERE Fedas_InputOrder.Id = InputOrder_Id;
  IF (in_status <> sNew) THEN
    RAISE ex_invalid_status;
  ELSE
    UPDATE Fedas_InputOrder
    SET STATUS = sReject WHERE Fedas_InputOrder.Id = InputOrder_Id;
  END IF;
EXCEPTION
  WHEN ex_invalid_status THEN
    DBMS_OUTPUT.put_line('Exception: bad status');
END;

/
BEGIN
RejectInputOrder(1);
END;
 /
 
SELECT * FROM Fedas_InputOrder;


--UPDATE Fedas_InputOrder
--SET STATUS = 1 WHERE Fedas_InputOrder.Id = 1;

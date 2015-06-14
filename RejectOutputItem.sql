SELECT * FROM Fedas_OutputOrder;
/
SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE RejectOutputOrder(OutputOrder_Id IN Fedas_OutputOrder.Id%type)
AS
  in_status Fedas_OutputOrder.STATUS%type;
  sNew Fedas_OutputOrder.STATUS%type := 1;
  sReject Fedas_OutputOrder.STATUS%type := 3;
  ex_invalid_status exception;
BEGIN
  SELECT STATUS INTO in_status FROM Fedas_OutputOrder
  WHERE Fedas_OutputOrder.Id = OutputOrder_Id;
  IF (in_status <> sNew) THEN
    RAISE ex_invalid_status;
  ELSE
    UPDATE Fedas_OutputOrder
    SET STATUS = sReject WHERE Fedas_OutputOrder.Id = OutputOrder_Id;
  END IF;
EXCEPTION
  WHEN ex_invalid_status THEN
    DBMS_OUTPUT.put_line('Exception: bad status');
END;

/
BEGIN
RejectOutputOrder(5);
END;
 /
 
SELECT * FROM Fedas_OutputOrder;


--UPDATE Fedas_InputOrder
--SET STATUS = 1 WHERE Fedas_InputOrder.Id = 1;
--SELECT * FROM Fedas_warehouseitem;
--SELECT * FROM Fedas_InputOrder;
--SELECT * FROM Fedas_InputOrderItem;
--/
SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE ApprovedInputOrder(InputOrder_Id IN Fedas_InputOrder.Id%type)
AS
  cursor cur is
  SELECT * FROM Fedas_InputOrderItem
  WHERE Fedas_InputOrderItem.INPUTORDERID = InputOrder_Id;
  
  s_approved Fedas_InputOrder.STATUS%type := 2;
  s_new Fedas_InputOrder.STATUS%type := 1;
  orderStatus Fedas_InputOrder.STATUS%type;
  ex_invalid_status exception;
BEGIN
  SELECT STATUS INTO orderStatus FROM Fedas_InputOrder
  WHERE Fedas_InputOrder.ID = InputOrder_Id;
  
  FOR InputOrderItem IN cur
  LOOP
  IF (orderStatus <> s_new) THEN
    RAISE ex_invalid_status;
  ELSE
    UPDATE Fedas_WarehouseItem
    SET Fedas_WarehouseItem.QUANTITY = Fedas_WarehouseItem.QUANTITY + InputOrderItem.QUANTITY
    WHERE Fedas_WarehouseItem.PACKAGEID = InputOrderItem.PACKAGEID;
  
    UPDATE Fedas_InputOrder
    SET STATUS = s_approved 
    WHERE Fedas_InputOrder.Id = InputOrder_Id;
    EXIT;
  END IF;
  END LOOP;
EXCEPTION
  WHEN ex_invalid_status THEN
    DBMS_OUTPUT.put_line('Exception: bad status');
END;

/
BEGIN
ApprovedInputOrder(2);
END;
/
SELECT * FROM Fedas_warehouseitem;
SELECT * FROM Fedas_InputOrder;
SELECT * FROM Fedas_InputOrderItem;

/*
SELECT * FROM Fedas_InputOrderItem
WHERE Fedas_InputOrderItem.INPUTORDERID = 3;
*/
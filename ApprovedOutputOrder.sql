SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE ApprovedOutputOrder(OutputOrder_Id IN Fedas_OutputOrder.Id%type)
AS
  cursor cur is
  SELECT * FROM Fedas_OutputOrderItem
  WHERE Fedas_OutputOrderItem.OutputORDERID = OutputOrder_Id;
  
  s_approved Fedas_OutputOrder.STATUS%type := 2;
  s_new Fedas_OutputOrder.STATUS%type := 1;
  orderStatus Fedas_OutputOrder.STATUS%type;
BEGIN
  SELECT STATUS INTO orderStatus FROM Fedas_OutputOrder
  WHERE Fedas_OutputOrder.ID = OutputOrder_Id;
  
  FOR OutputOrderItem IN cur
  LOOP
  IF (orderStatus = s_new) THEN
    UPDATE Fedas_WarehouseItem
    SET Fedas_WarehouseItem.QUANTITY = Fedas_WarehouseItem.QUANTITY - OutputOrderItem.QUANTITY
    WHERE Fedas_WarehouseItem.PACKAGEID = OutputOrderItem.PACKAGEID;
  
    UPDATE Fedas_OutputOrder
    SET STATUS = s_approved 
    WHERE Fedas_OutputOrder.Id = OutputOrder_Id;
  ELSE
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line('Item is not NEW');
    EXIT;
  END IF;
  END LOOP;
END;

/
BEGIN
ApprovedOutputOrder(2);
END;

/
SELECT * FROM Fedas_warehouseitem;
SELECT * FROM Fedas_OutputOrderItem;
SELECT * FROM Fedas_OutputOrder;

/*
SELECT * FROM Fedas_Packages;

SELECT * FROM Fedas_OutputOrderItem
WHERE Fedas_OutputOrderItem.OutputORDERID = 3;
*/
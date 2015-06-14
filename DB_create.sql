--drop table Fedas_Producers
--DROP TABLE Fedas_Categories;
CREATE TABLE Fedas_Producers (
	Id NUMBER(4) NOT NULL,
	Name VARCHAR2(64) NOT NULL,
	Address VARCHAR2(128) NOT NULL,
	Phone VARCHAR2 (64) NOT NULL,
	 
	CONSTRAINT pk_F_producer_id PRIMARY KEY(Id)	
);

CREATE SEQUENCE f_producer_seq
	MINVALUE 1
	MAXVALUE 9999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
/
CREATE OR REPLACE TRIGGER producer_Id_increment
	BEFORE INSERT ON Fedas_Producers
	FOR EACH ROW
BEGIN
	SELECT f_producer_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_producer_seq;
-----------------------------------------------------------------------
CREATE TABLE Fedas_Categories(
	Id NUMBER(4) NOT NULL,
	ParentID NUMBER(4) NULL,
	Name VARCHAR2(100) NOT NULL,
	
	CONSTRAINT pk_F_category_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_category_parentId_id 
		FOREIGN KEY (ParentId) REFERENCES Fedas_Categories(Id)
);

CREATE SEQUENCE f_category_seq
	MINVALUE 1
	MAXVALUE 9999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
/	
CREATE OR REPLACE TRIGGER category_Id_increment
	BEFORE INSERT ON Fedas_Categories
	FOR EACH ROW
BEGIN
	SELECT f_category_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_category_seq;
---------------------------------------------------------------

CREATE TABLE Fedas_Products(
	Id NUMBER(6) NOT NULL,
	Name VARCHAR2(128) NOT NULL,
	ProducerId NUMBER(4) NULL,
	CategoryId NUMBER(4) NOT NULL,
	
	CONSTRAINT pk_F_product_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_product_producerId_id
		FOREIGN KEY (ProducerId) REFERENCES Fedas_Producers(Id),
		
	CONSTRAINT fk_F_product_categoryId_id
		FOREIGN KEY (CategoryId) REFERENCES Fedas_Categories(Id)
);

CREATE SEQUENCE f_product_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPLACE TRIGGER product_id_increment
	BEFORE INSERT ON Fedas_Products
	FOR EACH ROW
BEGIN
	SELECT f_product_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_product_seq;
---------------------------------------------------------------

CREATE TABLE Fedas_Measures(
	Id NUMBER(2) NOT NULL,
	Name VARCHAR2(128) NOT NULL,
	ShortName VARCHAR2(32) NOT NULL,
	
	CONSTRAINT pk_F_measure_id PRIMARY KEY(Id)
);


CREATE SEQUENCE f_measure_seq
	MINVALUE 1
	MAXVALUE 99
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPLACE TRIGGER measure_id_increment
	BEFORE INSERT ON Fedas_Measures
	FOR EACH ROW
BEGIN
	SELECT f_measure_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_measure_seq;
---------------------------------------------------------------

CREATE TABLE Fedas_Packages(
	Id NUMBER(6) NOT NULL,
	ProductId NUMBER(6) NOT NULL,
	VolumeMeasureId NUMBER(2) NOT NULL,
	MeasureId NUMBER(2) NOT NULL,
	Volume NUMBER(6,2) NOT NULL,
   
	CONSTRAINT pk_F_packages_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_package_productId_id
		FOREIGN KEY (ProductId) REFERENCES Fedas_Products(Id),
    
  CONSTRAINT fk_F_package_measureId_id
		FOREIGN KEY (MeasureId) REFERENCES Fedas_Measures(Id),
		
	CONSTRAINT fk_F_package_volMeasId_id
		FOREIGN KEY (VolumeMeasureId) REFERENCES Fedas_Measures(Id)
);

CREATE SEQUENCE f_package_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPLACE TRIGGER package_id_increment
	BEFORE INSERT ON Fedas_Packages
	FOR EACH ROW
BEGIN
	SELECT f_package_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_package_seq;
---------------------------------------------------------------

CREATE TABLE Fedas_Price(
	Id NUMBER(6) NOT NULL,
	PackageId NUMBER(6) NOT NULL,
	UnitCost NUMBER(6,2) NOT NULL,
  PriceTime DATE NOT NULL,

	CONSTRAINT pk_F_price_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_price_packageId_id
		FOREIGN KEY(PackageId) REFERENCES Fedas_Packages(Id)
);

CREATE SEQUENCE f_price_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPLACE TRIGGER price_id_increment
	BEFORE INSERT ON Fedas_Price
	FOR EACH ROW
BEGIN
	SELECT f_price_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_price_seq;
---------------------------------------------------------------

CREATE TABLE Fedas_Customers(
	Id NUMBER(6) NOT NULL,
	Name VARCHAR2(128) NOT NULL,
	Address VARCHAR2(256) NULL,
	Phone VARCHAR2(32) NULL,
	
	CONSTRAINT pk_F_customer_id PRIMARY KEY(Id)
);

CREATE SEQUENCE f_customer_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
/
CREATE OR REPLACE TRIGGER customer_id_increment
	BEFORE INSERT ON Fedas_Customers
	FOR EACH ROW
BEGIN
	SELECT f_customer_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_customer_seq;

---------------------------------------------------------------

CREATE TABLE Fedas_InputOrder(
	Id NUMBER(6) NOT NULL,
	CustomerId NUMBER(6) NOT NULL,
	CreateTime DATE NOT NULL,
	Cost NUMBER(6,2) NOT NULL,
	Status NUMBER(1) NOT NULL,
	
	CONSTRAINT pk_F_inputOrder_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_inOrder_customerId_id 
		FOREIGN KEY(CustomerId) REFERENCES Fedas_Customers(Id)	
);

CREATE SEQUENCE f_inputOrder_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPlACE TRIGGER inputOrder_Id_increment
	BEFORE INSERT ON Fedas_InputOrder
	FOR EACH ROW
BEGIN
	SELECT f_inputOrder_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_inputOrder_seq;

---------------------------------------------------------------

CREATE TABLE Fedas_InputOrderItem(
	Id NUMBER(6) NOT NULL,
	InputOrderId NUMBER(6) NOT NULL,
	PackageId NUMBER(6) NOT NULL,
  Quantity  NUMBER(6, 2) NOT NULL,
  UnitCost  NUMBER(6, 2) NOT NULL,
  
  CONSTRAINT pk_F_inOrderItem_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_inOrderItem_inOrderId_id 
		FOREIGN KEY(InputOrderId) REFERENCES Fedas_InputOrder(Id),
    
  CONSTRAINT fk_F_inOrderItem_packageId_id 
		FOREIGN KEY(PackageId) REFERENCES Fedas_Packages(Id)	
);

CREATE SEQUENCE f_inputOrderItem_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPLACE TRIGGER inputOrderItem_Id_increment
	BEFORE INSERT ON Fedas_InputOrderItem
	FOR EACH ROW
BEGIN
	SELECT f_inputOrderItem_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_inputOrderItem_seq;

 ---------------------------------------------------------------
 
CREATE TABLE Fedas_OutputOrder(
	Id NUMBER(6) NOT NULL,
	CustomerId NUMBER(6) NOT NULL,
	CreateTime DATE NOT NULL,
	Cost NUMBER(6,2) NOT NULL,
	Status NUMBER(1) NOT NULL,
	
	CONSTRAINT pk_F_outputOrder_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_outOrder_customerId_id 
		FOREIGN KEY(CustomerId) REFERENCES Fedas_Customers(Id)	
);

CREATE SEQUENCE f_outputOrder_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPlACE TRIGGER outputOrder_Id_increment
	BEFORE INSERT ON Fedas_OutputOrder
	FOR EACH ROW
BEGIN
	SELECT f_outputOrder_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_outputOrder;
 ---------------------------------------------------------------

CREATE TABLE Fedas_OutputOrderItem(
	Id NUMBER(6) NOT NULL,
	OutputOrderId NUMBER(6) NOT NULL,
	PackageId NUMBER(6) NOT NULL,
  Quantity  NUMBER(6, 2) NOT NULL,
  UnitCost  NUMBER(6, 2) NOT NULL,
  
  CONSTRAINT pk_F_outOrderItem_id PRIMARY KEY(Id),
	
	CONSTRAINT fk_F_outOrdItem_outOrderId_id 
		FOREIGN KEY(OutputOrderId) REFERENCES Fedas_OutputOrder(Id),
    
  CONSTRAINT fk_F_outOrdItem_packageId_id 
		FOREIGN KEY(PackageId) REFERENCES Fedas_Packages(Id)	
);

CREATE SEQUENCE f_outputOrderItem_seq
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
	/
CREATE OR REPlACE TRIGGER outputOrderItem_Id_increment
	BEFORE INSERT ON Fedas_OutputOrderItem
	FOR EACH ROW
BEGIN
	SELECT f_outputOrderItem_seq.NEXTVAL
	INTO :new.Id
	FROM dual;
END;
/
--DROP SEQUENCE f_outputOrderItem_seq;

---------------------------------------------------------------

CREATE TABLE Fedas_Warehouse(
  Id NUMBER(3) NOT NULL,
  Address NVARCHAR2(256) NOT NULL,
  
  CONSTRAINT pk_F_warehouse_id PRIMARY KEY(Id)
);

CREATE SEQUENCE f_warehouse_seq
  MINVALUE 1
  MAXVALUE 999
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
  
/
CREATE OR REPLACE TRIGGER warehouse_id_increment
    BEFORE INSERT ON Fedas_Warehouse
    FOR EACH ROW
BEGIN
    SELECT f_warehouse_seq.NEXTVAL
    INTO :new.Id
    FROM dual;
END;
/
--DROP SEQUENCE f_warehouse_seq;
  
  ---------------------------------------------------------------
  
  CREATE TABLE Fedas_WarehouseItem(
    Id NUMBER(6) NOT NULL,
    WarehouseId NUMBER(3) NOT NULL,
    PackageId NUMBER(6) NOT NULL,
    Quantity NUMBER(6, 2) NOT NULL,
    
    CONSTRAINT pk_F_warehouseItem_id PRIMARY KEY(Id),
    
    CONSTRAINT fk_F_whouseItem_whouseId_Id
      FOREIGN KEY (WarehouseId) REFERENCES Fedas_Warehouse(Id),
      
    CONSTRAINT fk_F_whouseItem_packageId_id
      FOREIGN KEY (PackageId) REFERENCES Fedas_Packages(Id)
  );
  
  CREATE SEQUENCE f_warehouseItem_seq
  MINVALUE 1
  MAXVALUE 999999
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
  /
  CREATE OR REPLACE TRIGGER warehouseItem_id_increment
    BEFORE INSERT ON Fedas_WarehouseItem
    FOR EACH ROW
  BEGIN
    SELECT f_warehouseItem_seq.NEXTVAL
    INTO :new.Id
    FROM dual;
  END;
/
--DROP SEQUENCE f_warehouseItem_seq;-
















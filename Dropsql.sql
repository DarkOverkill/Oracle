
ALTER TABLE Fedas_Categories
DROP CONSTRAINT fk_F_category_parentId_id;

ALTER TABLE Fedas_Products
DROP CONSTRAINT fk_F_product_producerId_id;

ALTER TABLE Fedas_Products
DROP CONSTRAINT fk_F_product_categoryId_id;

ALTER TABLE Fedas_Packages
DROP CONSTRAINT fk_F_package_productId_id;

ALTER TABLE Fedas_Packages
DROP CONSTRAINT fk_F_package_measureId_id;

ALTER TABLE Fedas_Packages
DROP CONSTRAINT fk_F_package_volMeasId_id;

ALTER TABLE Fedas_Price
DROP CONSTRAINT fk_F_price_packageId_id;

ALTER TABLE Fedas_InputOrder
DROP CONSTRAINT fk_F_inOrder_customerId_id;

ALTER TABLE Fedas_InputOrderItem
DROP CONSTRAINT fk_F_inOrderItem_inOrderId_id;

ALTER TABLE Fedas_InputOrderItem
DROP CONSTRAINT fk_F_inOrderItem_packageId_id;

ALTER TABLE Fedas_OutputOrder
DROP CONSTRAINT fk_F_outOrder_customerId_id;

ALTER TABLE Fedas_OutputOrderItem
DROP CONSTRAINT fk_F_outOrdItem_outOrderId_id;

ALTER TABLE Fedas_OutputOrderItem
DROP CONSTRAINT fk_F_outOrdItem_packageId_id;

ALTER TABLE Fedas_WarehouseItem
DROP CONSTRAINT fk_F_whouseItem_whouseId_Id;

ALTER TABLE Fedas_WarehouseItem
DROP  CONSTRAINT fk_F_whouseItem_packageId_id;


DROP SEQUENCE f_producer_seq;
DROP SEQUENCE f_category_seq;
DROP SEQUENCE f_product_seq;
DROP SEQUENCE f_measure_seq;
DROP SEQUENCE f_package_seq;
DROP SEQUENCE f_price_seq;
DROP SEQUENCE f_customer_seq;
DROP SEQUENCE f_inputOrder_seq;
DROP SEQUENCE f_inputOrderItem_seq;
DROP SEQUENCE f_outputOrder_seq;
DROP SEQUENCE f_outputOrderItem_seq;
DROP SEQUENCE f_warehouse_seq;
DROP SEQUENCE f_warehouseItem_seq;

DROP TABLE Fedas_WarehouseItem;
DROP TABLE Fedas_Warehouse;
DROP TABLE Fedas_OutputOrderItem;
DROP TABLE Fedas_OutputOrder;
DROP TABLE Fedas_InputOrderItem;
DROP TABLE Fedas_InputOrder;
DROP TABLE Fedas_Customers;
DROP TABLE Fedas_Price;
DROP TABLE Fedas_Packages;
DROP TABLE Fedas_Measures;
DROP TABLE Fedas_Products;
DROP TABLE Fedas_Categories;
DROP TABLE Fedas_Producers;
--










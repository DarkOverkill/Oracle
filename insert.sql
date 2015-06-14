INSERT INTO Fedas_Producers(NAME ,ADDRESS, PHONE)
  SELECT 'ООО Металл', 'Киев, ул. Космонавтов 1', '095-111-11-11' FROM dual
  UNION ALL
	SELECT 'ООО Дерево', 'Львов, ул.Шевченка 23', '097-222-22-22' FROM dual
  UNION ALL
	SELECT 'ООО Камень', 'Харьков, ул.Гагарина 5', '099-333-33-33' FROM dual
  UNION ALL
	SELECT 'ООО ВсеОстальное', 'Днепропетровск, ул.Победы 2','050-444-44-44' FROM dual;
/
/*
INSERT INTO Fedas_Producers(NAME ,ADDRESS, PHONE) values
 ('ООО Металл', 'Киев, ул. Космонавтов 1', '095-111-11-11');
INSERT INTO Fedas_Producers(NAME ,ADDRESS, PHONE) values
 ('ООО Дерево', 'Львов, ул.Шевченка 23', '097-222-22-22');
  INSERT INTO Fedas_Producers(NAME ,ADDRESS, PHONE) values
	('ООО Камень', 'Харьков, ул.Гагарина 5', '099-333-33-33') ;
INSERT INTO Fedas_Producers(NAME ,ADDRESS, PHONE) values
	 ('ООО ВсеОстальное', 'Днепропетровск, ул.Победы 2','050-444-44-44');
  --SELECT ID, NAME ,ADDRESS, PHONE FROM Fedas_Producers;
  */
  
  /*INSERT INTO Fedas_Producers
  (NAME ,ADDRESS, PHONE)
  VALUES
  ('ООО Камень', 'Харьков, ул.Гагарина 5', '099-333-33-33');*/
INSERT INTO Fedas_Categories(PARENTID, NAME)
	SELECT null, 'Изделия из дерева' FROM dual
  UNION ALL
	SELECT 1, 'Доска' FROM dual
  UNION ALL
	SELECT 1, 'Фанера' FROM dual
  UNION ALL
	SELECT 1, 'Брус' FROM dual;
  
INSERT INTO Fedas_Categories(PARENTID, NAME)
	SELECT null, 'Изделия из металла' FROM dual
  UNION ALL
	SELECT 5, 'Швеллер' FROM dual
  UNION ALL
	SELECT 5, 'Двутавр' FROM dual
  UNION ALL
	SELECT 5, 'Уголок' FROM dual
  UNION ALL
	SELECT 5, 'Лист Стальной' FROM dual
  UNION ALL
	SELECT 5, 'Труба круглая' FROM dual;
  
  
INSERT INTO Fedas_Categories(PARENTID, NAME)
	SELECT null, 'Беттонные изделия' FROM dual
  UNION ALL
	SELECT 11, 'Кирпич' FROM dual
  UNION ALL
	SELECT 11, 'Плита перекрытия' FROM dual
  UNION ALL
	SELECT 11, 'Фундаментный блок' FROM dual
  UNION ALL
	SELECT 11, 'Перемычка бетонная' FROM dual
  UNION ALL
	SELECT 11, 'Цемент' FROM dual;
  
INSERT INTO Fedas_Categories(PARENTID, NAME)
	SELECT null, 'Разнок' FROM dual
  UNION ALL
	SELECT 17, 'Гипсокартон' FROM dual
  UNION ALL
	SELECT 17, 'Обои' FROM dual
  UNION ALL
	SELECT 17, 'Краска' FROM dual
  UNION ALL
	SELECT 17, 'Гвозди' FROM dual
  UNION ALL
	SELECT 17, 'Саморезы' FROM dual;

/
--UPDATE Fedas_Categories
  --SET ParentId = 5 WHERE ParentId = 2
  --SET ParentId = 11 WHERE ParentId = 3
  --SET ParentId = 17 WHERE ParentId = 4
-------------------------------------------------------------------------
INSERT INTO Fedas_Products(NAME, PRODUCERID, CATEGORYID)
  SELECT 'Доска 20х100х6000 мм', 2, 2 FROM dual
  UNION ALL
  SELECT 'Доска 30х200х6000 мм', 2, 2 FROM dual
  UNION ALL
  SELECT 'Фанера 18х1200х2500 мм', 2, 3 FROM dual
  UNION ALL
  SELECT 'Фанера финская 22х1800х2400 мм', 2, 3 FROM dual
  UNION ALL
  SELECT 'Брус 100х100х6000 мм', 2, 4 FROM dual
  UNION ALL
  SELECT 'Брус 150х150х6000 мм', 2, 4 FROM dual;
  
INSERT INTO Fedas_Products(NAME, PRODUCERID, CATEGORYID)
  SELECT 'Швеллер 10', 1, 6 FROM dual
  UNION ALL
	SELECT 'Швеллер 12', 1, 6 FROM dual
  UNION ALL
	SELECT 'Швеллер 14', 1, 6 FROM dual
  UNION ALL
	SELECT 'Двутавр 18', 1, 7 FROM dual
  UNION ALL
	SELECT 'Двутавр 20', 1, 7 FROM dual
  UNION ALL
	SELECT 'Уголок равнополочный 50х4', 1, 8 FROM dual
  UNION ALL
	SELECT 'Уголок равнополочный 63х4', 1, 8 FROM dual
  UNION ALL
	SELECT 'Уголок равнополочный 63х5', 1, 8 FROM dual
  UNION ALL
	SELECT 'Уголок равнополочный 75х5', 1, 8 FROM dual
  UNION ALL
	SELECT 'Сталь листовая t = 4 мм', 1, 9 FROM dual
  UNION ALL
	SELECT 'Сталь листовая t = 10 мм', 1, 9 FROM dual
  UNION ALL
	SELECT 'Труба, диаметром 159мм t=4мм', 1, 10 FROM dual
  UNION ALL
	SELECT 'Труба, диаметром 159мм t=5мм', 1, 10 FROM dual;
  
INSERT INTO Fedas_Products(NAME, PRODUCERID, CATEGORYID)
  SELECT 'Кирпич силикатный', 3, 12 FROM dual
  UNION ALL
  SELECT 'Кирпич кервмический', 3, 12 FROM dual
  UNION ALL
  SELECT 'Плита ребристая 1,5х12м', 3, 13 FROM dual
  UNION ALL
  SELECT 'Плита ребристая 1,8х12м', 3, 13 FROM dual
  UNION ALL
  SELECT 'Плита пустотная 1,2х6м', 3, 13 FROM dual
  UNION ALL
  SELECT 'Блок фундаментный 400х500х2000мм', 3, 14 FROM dual
  UNION ALL
  SELECT 'Блок фундаментный 600х700х1500мм', 3, 14 FROM dual
  UNION ALL
  SELECT 'Перемычка дверная 100х120х1200', 3, 15 FROM dual
  UNION ALL
  SELECT 'Перемычка дверная 100х120х1500', 3, 15 FROM dual
  UNION ALL
  SELECT 'Портланд цемент 50кг', 3, 16 FROM dual
  UNION ALL
  SELECT 'Портланд цемент 25кг', 3, 16 FROM dual;
  
INSERT INTO Fedas_Products(NAME, PRODUCERID, CATEGORYID)
  SELECT 'Гипсокартон потолочный 12мм, 2000х1500мм', 4, 18 FROM dual
  UNION ALL
	SELECT 'Гипсокартон стеновой 10мм, 2000х1500мм', 4, 18 FROM dual
  UNION ALL
	SELECT 'Обои 1, 1х20м', 4, 19 FROM dual
  UNION ALL
	SELECT 'Обои 2, 1х20м', 4, 19 FROM dual
  UNION ALL
	SELECT 'Краска красная', 4, 20 FROM dual
  UNION ALL
	SELECT 'Краска белая', 4, 20 FROM dual
  UNION ALL
	SELECT 'Краска черная', 4, 20 FROM dual
  UNION ALL
	SELECT 'Грунтовка', 4, 20 FROM dual
  UNION ALL
	SELECT 'Гвозди 70мм', 4, 21 FROM dual
  UNION ALL
	SELECT 'Гвозди 100мм', 4, 21 FROM dual
  UNION ALL
	SELECT 'Саморезы по дереву 70мм', 4, 22 FROM dual
  UNION ALL
  SELECT 'Саморезы по дереву 50мм', 4, 22 FROM dual
  UNION ALL
	SELECT 'Саморезы по металу 30мм', 4, 22 FROM dual
  UNION ALL
  SELECT 'Гвозди 50мм', null, 21 FROM dual
  UNION ALL
	SELECT 'Краска водостойкая серая', null, 20 FROM dual;
  /
  ------------------------------------------------------------------------
INSERT INTO Fedas_Measures(NAME, SHORTNAME)
 SELECT 'литров', 'л' FROM dual
 UNION ALL
 SELECT 'килограмм', 'кг' FROM dual
 UNION ALL
 SELECT 'штук', 'шт' FROM dual
 UNION ALL
 SELECT 'м.п.''метров погонных', 'м.п.' FROM dual
 UNION ALL
 SELECT 'кубических метров', 'м.куб.' FROM dual
 UNION ALL
 SELECT 'тонн', 'т' FROM dual
 UNION ALL
 SELECT 'метров квадратных', 'м.кв.' FROM dual
 UNION ALL
 SELECT 'упаковка', 'уп.' FROM dual
 UNION ALL
 SELECT 'мешок', 'м-к' FROM dual;
 /
 --------------------------------------------------------------------------
 INSERT INTO Fedas_Packages(PRODUCTID, VOLUMEMEASUREID, MEASUREID, VOLUME)
 SELECT 1, 3, 5, 1 FROM dual
 UNION ALL
 SELECT 2, 3, 5, 1 FROM dual
 UNION ALL
 SELECT 3, 3, 7 , 1 FROM dual
 UNION ALL
 SELECT 4, 3, 7, 1 FROM dual
 UNION ALL
 SELECT 5, 3, 5, 1 FROM dual
 UNION ALL
 SELECT 6, 3, 5, 1 FROM dual
 UNION ALL
 SELECT 7, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 8, 4, 6, 1  FROM dual
 UNION ALL
 SELECT 9, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 10, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 11, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 12, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 13, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 14, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 15, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 16, 7, 6, 1 FROM dual
 UNION ALL
 SELECT 17, 7, 6, 1 FROM dual
 UNION ALL
 SELECT 18, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 19, 4, 6, 1 FROM dual
 UNION ALL
 SELECT 20, 3, 5, 1000 FROM dual
 UNION ALL
 SELECT 21, 3, 5, 1000 FROM dual
 UNION ALL
 SELECT 22, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 23, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 24, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 25, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 26, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 27, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 28, 3, 3, 1 FROM dual
 UNION ALL
 SELECT 29, 2, 9, 50 FROM dual
 UNION ALL
 SELECT 30, 2, 9, 25 FROM dual
 UNION ALL
 SELECT 31, 7, 1, 3 FROM dual
 UNION ALL
 SELECT 32, 7, 1, 3 FROM dual
 UNION ALL
 SELECT 33, 7, 3, 20 FROM dual
 UNION ALL
 SELECT 34, 7, 3, 20 FROM dual
 UNION ALL
 SELECT 35, 1, 3, 2.5 FROM dual
 UNION ALL
 SELECT 36, 1, 3, 2.5 FROM dual
 UNION ALL
 SELECT 37, 1, 3, 2.5 FROM dual
 UNION ALL
 SELECT 38, 1, 3, 3.0 FROM dual
 UNION ALL
 SELECT 39, 2, 2, 1 FROM dual
 UNION ALL
 SELECT 40, 2, 2, 1 FROM dual
 UNION ALL
 SELECT 41, 3, 8, 100 FROM dual
 UNION ALL
 SELECT 42, 3, 8, 100 FROM dual
 UNION ALL
 SELECT 43, 3, 8, 100 FROM dual
 UNION ALL
 SELECT 44, 2, 2, 1 FROM dual
 UNION ALL
 SELECT 45, 1, 3, 2.7 FROM dual;
 
 /
 INSERT INTO Fedas_Price(PACKAGEID, UNITCOST, PRICETIME)
 SELECT 1, 23.3, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 2, 33.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 3, 73.1, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 4, 120.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 5, 32.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 6, 45.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 7, 88.2, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 8, 98.2, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 9, 108.2, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 10, 161.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 11, 180.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 12, 28.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 13, 35.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 14, 50.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 15, 65.7, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 16, 300.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 17, 550.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 18, 110.8, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 19, 130.8, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 20, 3500.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 21, 2600.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 22, 1280.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 23, 1480.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 24, 770.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 25, 470.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 26, 450.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 27, 170.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 28, 210.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 29, 59.9, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 30, 35.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 31, 127.3, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 32, 117.6, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 33, 101.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 34, 150.0, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 35, 77.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 36, 77.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 37, 77.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 38, 90.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 39, 53.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 40, 67.5, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 41, 39.9, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 42, 32.9, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 43, 29.9, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 44, 150.33, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual
 UNION ALL
 SELECT 45, 77.1, TO_DATE('2015/06/06', 'yyyy/mm/dd') FROM dual;
  
  /
INSERT INTO Fedas_Customers(NAME, ADDRESS, PHONE)
  VALUES ('Bill', 'Kiev', '00-111-222');
INSERT INTO Fedas_Customers(NAME, ADDRESS, PHONE)
  VALUES ('John', 'Lviv', '889-551-482');
INSERT INTO Fedas_Customers(NAME, ADDRESS, PHONE)
  VALUES ('Tod', 'Rivne', '357-64-574');
INSERT INTO Fedas_Customers(NAME, ADDRESS, PHONE)
  VALUES ('Sara', 'Lviv', '179-841-005');
 
 /
INSERT INTO Fedas_InputOrder(CUSTOMERID, CREATETIME, COST, STATUS)
  VALUES (1, TO_DATE('20150606', 'yyyy/mm/dd'), 25.9, 1);
INSERT INTO Fedas_InputOrder(CUSTOMERID, CREATETIME, COST, STATUS)
  VALUES (2, TO_DATE('20150606', 'yyyy/mm/dd'), 223.8, 1);
INSERT INTO Fedas_InputOrder(CUSTOMERID, CREATETIME, COST, STATUS)
  VALUES (2, TO_DATE('20150607', 'yyyy/mm/dd'), 1223.8, 1);
INSERT INTO Fedas_InputOrder(CUSTOMERID, CREATETIME, COST, STATUS)
  VALUES (2, TO_DATE('20150609', 'yyyy/mm/dd'), 975.4, 1);
 
/

INSERT INTO Fedas_Warehouse(ADDRESS)
  SELECT 'г.Киев, Склад №1' FROM dual
  UNION ALL
  SELECT 'г.Киев, Склад №2' FROM dual
  UNION ALL
  SELECT 'г.Киев, Склад №3' FROM dual
  UNION ALL
  SELECT 'г.Львов, Склад №1' FROM dual
  UNION ALL
  SELECT 'г.Одесса, Склад №1' FROM dual;
/

INSERT INTO Fedas_WarehouseItem (WAREHOUSEID, PACKAGEID, QUANTITY)
  SELECT 1, 1, 90 FROM dual
  UNION ALL
  SELECT  1, 2, 190 FROM dual
  UNION ALL
  SELECT  1, 3, 70 FROM dual
  UNION ALL
  SELECT  1, 4, 90 FROM dual
  UNION ALL
  SELECT  1, 5, 100 FROM dual
  UNION ALL
  SELECT  1, 6, 200 FROM dual
  UNION ALL
  SELECT  1, 7, 30 FROM dual
  UNION ALL
  SELECT  1, 8, 120 FROM dual
  UNION ALL
  SELECT  1, 9, 75 FROM dual
  UNION ALL
  SELECT  1, 10, 95 FROM dual
  UNION ALL
  SELECT  2, 11, 90 FROM dual
  UNION ALL
  SELECT  2, 12, 190 FROM dual
  UNION ALL
  SELECT  2, 13, 70 FROM dual
  UNION ALL
  SELECT  2, 14, 90 FROM dual
  UNION ALL
  SELECT  2, 15, 100 FROM dual
  UNION ALL
  SELECT 2, 16, 200 FROM dual
  UNION ALL
  SELECT 2, 17, 30 FROM dual
  UNION ALL
  SELECT 2, 18, 120 FROM dual
  UNION ALL
  SELECT 2, 19, 75 FROM dual
  UNION ALL
  SELECT 2, 20, 95 FROM dual
  UNION ALL
  SELECT 3, 21, 90 FROM dual
  UNION ALL
  SELECT 3, 22, 190 FROM dual
  UNION ALL
  SELECT 3, 23, 70 FROM dual
  UNION ALL
  SELECT 3, 24, 90 FROM dual
  UNION ALL
  SELECT 3, 25, 100 FROM dual
  UNION ALL
  SELECT 3, 26, 200 FROM dual
  UNION ALL
  SELECT 4, 27, 30 FROM dual
  UNION ALL
  SELECT 4, 28, 120 FROM dual
  UNION ALL
  SELECT 4, 29, 75 FROM dual
  UNION ALL
  SELECT 4, 30, 95 FROM dual
  UNION ALL
  SELECT 4, 31, 90 FROM dual
  UNION ALL
  SELECT 4, 32, 190 FROM dual
  UNION ALL
  SELECT 4, 33, 70 FROM dual
  UNION ALL
  SELECT 4, 34, 90 FROM dual
  UNION ALL
  SELECT 4, 35, 100 FROM dual
  UNION ALL
  SELECT 4, 36, 200 FROM dual
  UNION ALL
  SELECT 5, 37, 30 FROM dual
  UNION ALL
  SELECT 5, 38, 120 FROM dual
  UNION ALL
  SELECT 5, 39, 75 FROM dual
  UNION ALL
  SELECT 5, 40, 95 FROM dual
  UNION ALL
  SELECT 5, 41, 120 FROM dual
  UNION ALL
  SELECT 5, 42, 75 FROM dual
  UNION ALL
  SELECT 5, 43, 95 FROM dual
  UNION ALL
  SELECT 5, 44, 0 FROM dual
  UNION ALL
  SELECT 5, 45, 0 FROM dual;

/  

INSERT INTO Fedas_InputOrderItem (INPUTORDERID, PACKAGEID, QUANTITY, UNITCOST)
  SELECT 1, 20, 3, 5.50 FROM dual
  UNION ALL 
  SELECT 1, 21, 2, 44.33 FROM dual
  UNION ALL 
  SELECT 2, 3, 100, 11.98 FROM dual
  UNION ALL 
  SELECT 2, 4, 20, 41.20 FROM dual
  UNION ALL 
  SELECT 3, 11, 120, 141.70 FROM dual
  UNION ALL 
  SELECT 4, 35, 450, 413.55 FROM dual
  UNION ALL 
  SELECT 4, 36, 450, 471.10 FROM dual
  UNION ALL 
  SELECT 4, 37, 420, 169.87 FROM dual;
/

INSERT INTO Fedas_OutputOrder(CUSTOMERID, CREATETIME, COST, STATUS)
  SELECT  1, TO_DATE('20150610', 'yyyy/mm//dd'), 100, 1 FROM dual
  UNION ALL
  SELECT  1, TO_DATE('20150610', 'yyyy/mm//dd'), 350.5, 1 FROM dual
  UNION ALL
  SELECT  1, TO_DATE('20150610', 'yyyy/mm//dd'), 290, 1 FROM dual
  UNION ALL
  SELECT  2, TO_DATE('20150610', 'yyyy/mm//dd'), 1500, 1 FROM dual
  UNION ALL
  SELECT  2, TO_DATE('20150610', 'yyyy/mm//dd'), 210, 1 FROM dual
  UNION ALL
  SELECT  3, TO_DATE('20150610', 'yyyy/mm//dd'), 600, 1 FROM dual;
  /
 
INSERT INTO Fedas_OutputOrderItem(OUTPUTORDERID, PACKAGEID, QUANTITY, UNITCOST)
  SELECT  1, 1 , 0.1, 98.60 FROM dual
  UNION ALL
  SELECT  2, 35, 2, 205.17 FROM dual
  UNION ALL
  SELECT  2, 36, 5, 134.50 FROM dual
  UNION ALL
  SELECT  3, 4, 4, 287.54 FROM dual
  UNION ALL
  SELECT  4, 24, 2, 750.41 FROM dual
  UNION ALL
  SELECT  5, 19, 3, 169.00 FROM dual
  UNION ALL
  SELECT  6, 39, 4, 123.21 FROM dual
  UNION ALL
  SELECT  6, 1, 0.5, 307.87 FROM dual
  UNION ALL
  SELECT  6, 5, 0.2, 54.15 FROM dual;


  
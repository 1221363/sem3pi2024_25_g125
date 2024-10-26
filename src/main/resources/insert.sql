-- SQL Commands for sheet: Clients
INSERT INTO Location(address, ZIP, Town, Country) values ('Tv. Augusto Lessa 23','4200-047','Porto','Portugal');
INSERT INTO Location(address, ZIP, Town, Country) values ('R. Dr. Barros 93','4465-219','São Mamede de Infesta','Portugal');
INSERT INTO Location(address, ZIP, Town, Country) values ('EDIFICIO CRISTAL lj18,R. António Correia de Carvalho 88','4400-023','Vila Nova de Gaia','Portugal');
INSERT INTO Location(address, ZIP, Town, Country) values ('Křemencova 11','110 00','Nové Město','Czechia');
INSERT INTO Customer(nif, Name, VATIN, Location_address, Location_zip, Email, phoneNumber) values (456,'Carvalho & Carvalho,Lda','PT501245987','Tv. Augusto Lessa 23','4200-047','idont@care.com',003518340500);
INSERT INTO Customer(nif, Name, VATIN, Location_address, Location_zip, Email, phoneNumber) values (785,'Tudo para a casa,Lda','PT501245488','R. Dr. Barros 93','4465-219','me@neither.com',003518340500);
INSERT INTO Customer(nif, Name, VATIN, Location_address, Location_zip, Email, phoneNumber) values (657,'Sair de Cena','PT501242417','EDIFICIO CRISTAL lj18,R. António Correia de Carvalho 88','4400-023','some@email.com',003518340500);
INSERT INTO Customer(nif, Name, VATIN, Location_address, Location_zip, Email, phoneNumber) values (348,'U Fleku','CZ6451237810','Křemencova 11','110 00','some.random@email.cz',004201234567);

-- SQL Commands for sheet: ProductFamily
INSERT INTO ProductFamily(ID, Name) values (125,'Pro Line pots');
INSERT INTO ProductFamily(ID, Name) values (130,'La Belle pots');
INSERT INTO ProductFamily(ID, Name) values (132,'Pro Line pans');
INSERT INTO ProductFamily(ID, Name) values (145,'Pro Line lids');
INSERT INTO ProductFamily(ID, Name) values (146,'Pro Clear lids');

-- SQL Commands for sheet: Products
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945T22','La Belle 22 5l pot','5l 22 cm aluminium and teflon non stick pot',130);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945S22','Pro 22 5l pot','5l 22 cm stainless steel pot',125);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945S20','Pro 20 3l pot','3l 20 cm stainless steel pot',125);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945S17','Pro 17 2l pot','2l 17 cm stainless steel pot',125);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945P17','Pro 17 2l sauce pan','2l 17 cm stainless steel souce pan',132);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945S48','Pro 17 lid','17 cm stainless steel lid',145);
INSERT INTO Product(Code, Name, Description, productFamily_ID) values ('AS12945G48','Pro Clear 17 lid','17 cm glass lid',146);

-- SQL Commands for sheet: Orders
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (1,785,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (1,785,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (2,657,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (2,657,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (3,348,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (3,348,TO_DATE('15/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (4,785,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (4,785,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (4,785,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (5,657,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (6,348,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (6,348,TO_DATE('18/09/2024','DD/MM/YYYY'));
INSERT INTO ClientOrder(ID, customer_nif, DateOrder) values (7,456,TO_DATE('21/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (1,785,TO_DATE('23/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (1,785,TO_DATE('23/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (2,657,TO_DATE('26/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (2,657,TO_DATE('26/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (3,348,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (3,348,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (4,785,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (4,785,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (4,785,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (5,657,TO_DATE('25/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (6,348,TO_DATE('26/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (6,348,TO_DATE('26/09/2024','DD/MM/YYYY'));
INSERT INTO Delivery(OrderID, customer_nif, DateDelivery) values (7,456,TO_DATE('26/09/2024','DD/MM/YYYY'));
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (1,'AS12945S22',5);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (1,'AS12945S20',15);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (2,'AS12945S22',10);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (2,'AS12945P17',20);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (3,'AS12945S22',10);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (3,'AS12945S20',10);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (4,'AS12945S20',24);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (4,'AS12945S22',16);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (4,'AS12945S17',8);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (5,'AS12945S22',12);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (6,'AS12945S17',8);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (6,'AS12945P17',16);
INSERT INTO ProductionOrder(OrderID, productcode, Quantity) values (7,'AS12945S22',8);

-- SQL Commands for sheet: WorkstationTypes
INSERT INTO WorkstationType(ID, Name) values ('A4578','600t cold forging stamping press');
INSERT INTO WorkstationType(ID, Name) values ('A4588','600t cold forging precision stamping press');
INSERT INTO WorkstationType(ID, Name) values ('A4598','1000t cold forging precision stamping press');
INSERT INTO WorkstationType(ID, Name) values ('S3271','Handle rivet');
INSERT INTO WorkstationType(ID, Name) values ('K3675','Packaging');
INSERT INTO WorkstationType(ID, Name) values ('K3676','Packaging for large itens');
INSERT INTO WorkstationType(ID, Name) values ('C5637','Border trimming');
INSERT INTO WorkstationType(ID, Name) values ('D9123','Spot welding');
INSERT INTO WorkstationType(ID, Name) values ('Q5478','Teflon application station');
INSERT INTO WorkstationType(ID, Name) values ('Q3547','Stainless steel polishing');
INSERT INTO WorkstationType(ID, Name) values ('T3452','Assembly T1');
INSERT INTO WorkstationType(ID, Name) values ('G9273','Circular glass cutting');
INSERT INTO WorkstationType(ID, Name) values ('G9274','Glass trimming');

-- SQL Commands for sheet: Operations
INSERT INTO Operation(ID, Description) values (5647,'Disc cutting');
INSERT INTO Operation(ID, Description) values (5649,'Initial pot base pressing');
INSERT INTO Operation(ID, Description) values (5651,'Final pot base pressing');
INSERT INTO Operation(ID, Description) values (5653,'Pot base finishing');
INSERT INTO Operation(ID, Description) values (5655,'Lid pressing');
INSERT INTO Operation(ID, Description) values (5657,'Lid finishing');
INSERT INTO Operation(ID, Description) values (5659,'Pot handles riveting');
INSERT INTO Operation(ID, Description) values (5661,'Lid handle screw');
INSERT INTO Operation(ID, Description) values (5663,'Pot test and packaging');
INSERT INTO Operation(ID, Description) values (5665,'Handle welding');
INSERT INTO Operation(ID, Description) values (5667,'Lid polishing');
INSERT INTO Operation(ID, Description) values (5669,'Pot base polishing');
INSERT INTO Operation(ID, Description) values (5671,'Teflon painting');
INSERT INTO Operation(ID, Description) values (5681,'Initial pan base pressing');
INSERT INTO Operation(ID, Description) values (5682,'Final pan base pressing');
INSERT INTO Operation(ID, Description) values (5683,'Pan base finishing');
INSERT INTO Operation(ID, Description) values (5665,'Handle welding');
INSERT INTO Operation(ID, Description) values (5688,'Pan test and packaging');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5647,'A4578');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5647,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5647,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5649,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5649,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5651,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5651,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5653,'C5637');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5655,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5655,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5657,'C5637');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5659,'S3271');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5661,'T3452');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5663,'K3675');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5665,'D9123');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5667,'Q3547');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5669,'Q3547');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5671,'Q5478');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5681,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5681,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5682,'A4588');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5682,'A4598');

INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5683,'C5637');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5665,'D9123');
INSERT INTO Operation_WorkstationType(Operation_ID, WorkstationType_ID) VALUES (5688,'K3675');

-- SQL Commands for sheet: Workstations
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (9875,'A4578','Press 01','220-630t cold forging press');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (9886,'A4578','Press 02','220-630t cold forging press');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (9847,'A4588','Press 03','220-630t precision cold forging press');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (9855,'A4588','Press 04','160-1000t precison cold forging press');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (8541,'S3271','Rivet 02','Rivet station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (8543,'S3271','Rivet 03','Rivet station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (6814,'K3675','Packaging 01','Packaging station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (6815,'K3675','Packaging 02','Packaging station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (6816,'K3675','Packaging 03','Packaging station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (6821,'K3675','Packaging 04','Packaging station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (6822,'K3676','Packaging 05','Packaging station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (8167,'D9123','Welding 01','Spot welding staion');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (8170,'D9123','Welding 02','Spot welding staion');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (8171,'D9123','Welding 03','Spot welding staion');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (7235,'T3452','Assembly 01','Product assembly station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (7236,'T3452','Assembly 02','Product assembly station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (7238,'T3452','Assembly 03','Product assembly station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (5124,'C5637','Trimming 01','Metal trimming station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (4123,'Q3547','Polishing 01','Metal polishing station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (4124,'Q3547','Polishing 02','Metal polishing station');
INSERT INTO Workstation(ID, WorkstationType_ID, Name, Description) values (4125,'Q3547','Polishing 03','Metal polishing station');

-- SQL Commands for sheet: BOM
INSERT INTO Part(code, Description) values ('PN12344A21','Screw M6 35 mm');
INSERT INTO Part(code, Description) values ('PN52384R50','300x300 mm 5mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN52384R10','300x300 mm 1mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN18544A21','Rivet 6 mm');
INSERT INTO Part(code, Description) values ('PN18544C21','Stainless steel handle model U6');
INSERT INTO Part(code, Description) values ('PN18324C54','Stainless steel handle model R12');
INSERT INTO Part(code, Description) values ('PN12344A21','Screw M6 35 mm');
INSERT INTO Part(code, Description) values ('PN52384R50','300x300 mm 5mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN52384R10','300x300 mm 1mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN18544A21','Rivet 6 mm');
INSERT INTO Part(code, Description) values ('PN18544C21','Stainless steel handle model U6');
INSERT INTO Part(code, Description) values ('PN18324C51','Stainless steel handle model R11');
INSERT INTO Part(code, Description) values ('PN12344A21','Screw M6 35 mm');
INSERT INTO Part(code, Description) values ('PN52384R45','250x250 mm 5mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN52384R12','250x250 mm 1mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN18544A21','Rivet 6 mm');
INSERT INTO Part(code, Description) values ('PN18544C21','Stainless steel handle model U6');
INSERT INTO Part(code, Description) values ('PN18324C51','Stainless steel handle model R11');
INSERT INTO Part(code, Description) values ('PN52384R45','250x250 mm 5mm stainless steel sheet');
INSERT INTO Part(code, Description) values ('PN18324C91','Stainless steel handle model S26');
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN12344A21',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN52384R50',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN52384R10',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN18544A21',4);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN18544C21',2);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S22','PN18324C54',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN12344A21',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN52384R50',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN52384R10',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN18544A21',4);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN18544C21',2);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S20','PN18324C51',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN12344A21',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN52384R45',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN52384R12',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN18544A21',4);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN18544C21',2);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945S17','PN18324C51',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945P17','PN52384R45',1);
INSERT INTO BillOfMaterials(Productcode, Partcode, Quantity) values ('AS12945P17','PN18324C91',1);

-- SQL Commands for sheet: BOO
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5647,1);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5647,2);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5649,3);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5651,4);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5653,5);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5659,6);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5669,7);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5655,8);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5657,9);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5661,10);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5667,11);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (125,5663,12);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (132,5681,1);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (132,5682,2);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (132,5683,3);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (132,5665,4);
INSERT INTO BillOfOperations(ProductFamilyID, OperationID, sequenceNumber) values (132,5688,5);


begin;
-- REM INSERTING into Articles
Insert into Articles (AID,ANAME,Weight) values ('A-001','Schokolade',125);
Insert into Articles (AID,ANAME,Weight) values ('A-002','Waschmittel',2500);
Insert into Articles (AID,ANAME,Weight) values ('A-003','Knuspermuesli',250);
Insert into Articles (AID,ANAME,Weight) values ('A-300','Bananenshake',550);

-- REM INSERTING into StorageUnits
Insert into StorageUnits (SUId,AID,Quantity,StoLId) values ('Le-001','A-001',101,'Lo-001');
Insert into StorageUnits (SUId,AID,Quantity,StoLId) values ('Le-002','A-002',24,'Lo-001');
Insert into StorageUnits (SUId,AID,Quantity,StoLId) values ('Le-003','A-002',24,'Lo-003');
Insert into StorageUnits (SUId,AID,Quantity,StoLId) values ('Le-004','A-003',100,'Lo-002');
Insert into StorageUnits (SUId,AID,Quantity,StoLId) values ('Le-005','A-300',40,'Lo-005');

-- REM INSERTING into StorageLocations
Insert into StorageLocations (StoLId,POSITION,StoSId) values ('Lo-001',1,'Loa-001');
Insert into StorageLocations (StoLId,POSITION,StoSId) values ('Lo-002',2,'Loa-001');
Insert into StorageLocations (StoLId,POSITION,StoSId) values ('Lo-003',10,'Loa-002');
Insert into StorageLocations (StoLId,POSITION,StoSId) values ('Lo-004',8,'Loa-003');
Insert into StorageLocations (StoLId,POSITION,StoSId) values ('Lo-005',11,'Loa-003');

-- REM INSERTING into StorageLocationSpecifications
Insert into StorageLocationSpecifications (StoSId,Length,Width,Height,MaxWeight) values ('Loa-001','1','1','1','100000');
Insert into StorageLocationSpecifications (StoSId,Length,Width,Height,MaxWeight) values ('Loa-002','2','1','2','200000');
Insert into StorageLocationSpecifications (StoSId,Length,Width,Height,MaxWeight) values ('Loa-003','2','2','1','100000');

-- REM INSERTING into Compatibilities
Insert into Compatibilities (AId,StoLId) values ('A-001','Lo-001');
Insert into Compatibilities (AId,StoLId) values ('A-002','Lo-003');
Insert into Compatibilities (AId,StoLId) values ('A-003','Lo-002');
commit;
 
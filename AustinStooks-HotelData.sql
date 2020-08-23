use hotel;


insert into Guests (guestId, guestFirstName, guestLastName, address, city, zip, state, phoneNumber) values
    ('1', 'Austin', 'Stooks', '42 Wallaby Way', 'Sydney', '23113', 'FL', '(214) 356-5623'),
    ('2','Mack','Simmer','379 Old Shore Street','Council Bluffs','51501','IA','(291) 553-0508'),
    ('3','Bettyann','Seery','750 Wintergreen Dr.','Wasilla','AK','99654','(478) 277-9632'),
    ('4','Duane','Cullison','9662 Foxrun Lane','Harlingen','TX','78552','(308) 494-0198'),
    ('5','Karie','Yang','9378 W. Augusta Ave.','West Deptford','NJ','08096','(214) 730-0298'),
    ('6','Aurore','Lipton','762 Wild Rose Street','Saginaw','MI','48601','(377) 507-0974'),
    ('7','Zachery','Luechtefeld','7 Poplar Dr.','Arvada','CO','80003','(814) 485-2615'),
    ('8','Jeremiah','Pendergrass','70 Oakwood St.','Zion','IL','60099','(279) 491-0960'),
    ('9','Walter','Holaway','7556 Arrowhead St.','Cumberland','RI','02864','(446) 396-6785'),
    ('10','Wilfred','Vise','77 West Surrey Street','Oswego','NY','13126','(834) 727-1001'),
    ('11','Maritza','Tilton','939 Linda Rd.','Burke','VA','22015','(446) 351-6860'),
    ('12','Joleen','Tison','87 Queen St.','Drexel Hill','PA','19026','(231) 893-2755');
    
insert into RoomType (typeID, typeRoom, typePrice, standardOccupancy, maxoccupancy, addPeoplePrice) values
	('1','Single','149.99','2','2','0.00'),
    ('2','Double','174.99','2','4','10.00'),
    ('3','Suite','399.99','3','8','20.00'),
    ('4','DoubleJacuzzi','199.99','2','4','10.00'),
    ('5','SingleJacuzzi','174.99','2','2','0.00');
    
    
insert into amenitys (amenitysID, amenitysName, amenitysPrice, hasJacuzzi) values
	('1','Microwave','0.00',0),
    ('2','Refrigerator','0.00',0),
    ('3','Oven','0.00',0),
    ('4','Jacuzzi','25.00',1);
    -- get rid of 
    /*
    ('5','Microwave,Refrigerator','0.00'), 1 2 
    ('6','Microwave,Jacuzzi','0.00'), 1 4 
    ('7','Microwave,Refrigerator,Jacuzzi','25.00'), 124
    ('8','Microwave,Refrigerator,Oven','0.00'); 123
    */
    
insert into reservations(reservationId, numAdults, numChildren, startDate, endDate, childAge, totalPrice) values
	('1','1','1','2023-03-17','2023-03-20','11','524.97'),
    ('2','1','0','2023-02-02','2023-02-04','10','299.98'),
    ('3','2','1','2023-02-05','2023-02-10','11','999.95'),
    ('4','2','0','2023-02-22','2023-02-24','10','349.98'),
    ('5','2','2','2023-03-06','2023-03-07','11','199.99'),
    ('6','3','0','2023-03-18','2023-03-23','10','924.95'),
    ('7','2','2','2023-03-29','2023-03-31','10','349.98'),
    ('8','2','0','2023-03-31','2023-04-05','10','874.95'),
    ('9','1','0','2023-04-09','2023-04-13','11','799.96'),
    ('10','1','1','2023-04-23','2023-04-24','11','174.99'),
    ('11','2','4','2023-05-30','2023-06-02','11','1199.97'),
    ('12','2','0','2023-06-10','2023-06-14','10','599.96'),
    ('13','1','0','2023-06-10','2023-06-14','10','599.96'),
    ('14','3','0','2023-06-17','2023-06-18','10','184.99'),
    ('15','2','0','2023-06-28','2023-07-02','10','699.96'),
    ('16','3','1','2023-07-13','2023-07-14','11','184.99'),
    ('17','4','2','2023-07-18','2023-07-21','11','1259.97'),
    ('18','2','1','2023-07-28','2023-07-29','11','199.99'),
    ('19','1','0','2023-08-30','2023-09-01','10','349.98'),
    ('20','2','0','2023-09-16','2023-09-17','11','149.99'),
    ('21','2','2','2023-09-13','2023-09-15','11','399.98'),
    ('22','2','2','2023-11-22','2023-11-25','11','1199.97'),
    ('23','2','0','2023-11-22','2023-11-25','11','449.97'),
    ('24','2','2','2023-11-22','2023-11-25','11','599.97'),
    ('25','2','0','2023-12-24','2023-12-28','11','699.96');
    
-- alter table room add constraint room foreign key(typeRoom) references roomType(typeRoom);
    
insert into room(roomId, roomNumber, roomFloor, adaAcess, typeRoom) values
	('1','201','2','0','DoubleJacuzzi'),
    ('2','202','2','1','Double'),
    ('3','203','2','0','DoubleJacuzzi'),
    ('4','204','2','1','Double'),
    ('5','205','2','0','SingleJacuzzi'),
    ('6','206','2','1','Single'),
    ('7','207','2','0','SingleJacuzzi'),
    ('8','208','2','1','Single'),
    ('9','301','3','0','DoubleJacuzzi'),
    ('10','302','3','1','Double'),
    ('11','303','3','0','DoubleJacuzzi'),
    ('12','304','3','1','Double'),
    ('13','305','3','0','DoubleJacuzzi'),
    ('14','306','3','1','Single'),
    ('15','307','3','0','SingleJacuzzi'),
    ('16','308','3','1','Single'),
    ('17','401','4','1','Suite'),
    ('18','402','4','1','Suite');
    
insert into typeAmenity(typeId, amenitysId) values
	('1','1'),
    ('1','2'),
    ('1','4'),
    ('2','2'),
    ('2','1'),
    ('2','4'),
    ('3','1'),
    ('3','2'),
    ('3','3');
    
insert into roomReservations(roomId, reservationId) values
	('1','5'),
    ('2','7'),
    ('3','3'),
    ('3','21'),
    ('4','16'),
    ('5','15'),
    ('6','12'),
    ('6','23'),
    ('7','10'),
    ('8','13'),
    ('8','20'),
    ('9','9'),
    ('9','24'),
    ('10','6'),
    ('10','25'),
    ('11','18'),
    ('12','8'),
    ('12','14'),
    ('13','4'),
    ('13','19'),
    ('15','1'),
    ('17','11'),
    ('17','17'),
    ('17','22');
    
insert into guestReservations(guestId, reservationId) values
	('1','1'),
    ('1','15'),
    ('2','2'),
    ('2','20'),
    ('2','23'),
    ('2','24'),
    ('3','3'),
    ('3','18'),
    ('3','19'),
    ('4','4'),
    ('4','22'),
    ('5','5'),
    ('5','21'),
    ('6','6'),
    ('6','14'),
    ('7','7'),
    ('8','8'),
    ('9','9'),
    ('9','16'),
    ('10','10'),
	('10','17'),
	('11','11'),
    ('11','25'),
    ('12','12'),
    ('12','13');

	-- delete jeremiah guest id = 8 and reservation = 8 delete children first
	set SQL_SAFE_UPDATES = 0;
    
    delete from roomreservations 
    where reservationid = 8;
    
	delete from guestreservations 
    where guestId = 8 and reservationId = 8;
    
    delete from reservations 
    where reservationid = 8;
    
    
    delete from guests 
    where guestid = 8;
    
    SET SQL_SAFE_UPDATES = 1;
    

	
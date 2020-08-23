drop database if exists Hotel;

create database Hotel;

use Hotel;

-- tables


create table Guests (
	guestID int auto_increment primary key,
    guestFirstName varchar(25),
    guestLastName varchar(25),
    address varchar(25),
    -- char 2 for small 
    city varchar(25),
    zip varchar(25),
    state varchar(25),
    phoneNumber varchar(25)
);    

create table RoomType (
	typeId int auto_increment primary key,
    typeRoom varchar(25) unique,
    typePrice decimal(5,2),
    standardOccupancy int,
    maxOccupancy int,
    addPeoplePrice decimal(5,2)
);

create table Amenitys (
	amenitysID int auto_increment primary key,
    amenitysName varchar(50),
    amenitysPrice decimal(5,2),
	hasJacuzzi boolean
);

create table Reservations (
	reservationId int auto_increment primary key,
    numAdults int,
    numChildren int,
    startDate date,
    endDate date,
	childAge int,
    totalPrice decimal(6,2)
);

create table Room (
	roomID int auto_increment primary key,
    roomNumber int,
    roomFloor int,
    adaAcess boolean,
    -- belongs in amenities
    -- typeid 
    typeRoom varchar(25) not null,
    foreign key fk_Room_RoomType(typeRoom)
		references RoomType(typeRoom)
);


create table typeAmenity (
	typeId int not null,
    amenitysId int not null,
    primary key (typeId, amenitysId),
    foreign key fk_typeAmenity_typeId (typeId)
		references RoomType(typeId),
	foreign key fk_typeAmenity_amenitysId (amenitysId)
		references Amenitys(amenitysId)
);

create table roomReservations (
	roomId int not null,
    reservationId int not null,
    primary key (roomId, reservationId),
    foreign key fk_roomReservations_roomId (roomId)
		references Room(roomId),
	foreign key fk_roomReservations_reservationId (reservationId)
		references Reservations(reservationId)
);

create table guestReservations (
	guestId int not null,
    reservationId int not null,
    primary key (guestId, reservationId),
    foreign key fk_guestReservations_guestId (guestId)
		references Guests(guestId),
    foreign key fk_guestReservations_reservationId (reservationId)
		references Reservations(reservationId)
    
	
);

use hotel;
describe Guests;

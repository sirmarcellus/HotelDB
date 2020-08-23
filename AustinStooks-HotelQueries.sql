use hotel;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
select 
	guests.guestFirstname, 
	guests.guestlastname, 
	room.roomnumber,
	reservations.startDate,
    reservations.enddate
From reservations 
left join guestreservations on reservations.reservationId  = guestreservations.reservationId
left join guests on guestreservations.guestId = guests.guestID
left join roomreservations on reservations.reservationId = roomreservations.reservationId
left join room on roomreservations.roomId = room.roomID
where Month(reservations.endDate) = 7;
-- this returned 4 rows 
/*
Austin	Stooks	205	2023-06-28	2023-07-02
Walter	Holaway	204	2023-07-13	2023-07-14
Wilfred	Vise	401	2023-07-18	2023-07-21
Bettyann Seery	303	2023-07-28	2023-07-29
*/

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
select
	guests.guestFirstName,
    guests.guestLastName,
    room.roomnumber,
    reservations.startDate,
    reservations.enddate
from reservations -- replace all lefts inner 
	inner join guestreservations on reservations.reservationId  = guestreservations.reservationId
	inner join guests on guestreservations.guestId = guests.guestID
	inner join roomreservations on reservations.reservationId = roomreservations.reservationId
	inner join room on roomreservations.roomId = room.roomID
    inner join roomtype on room.typeRoom = roomtype.typeRoom
	inner join typeamenity on roomtype.typeid = typeamenity.typeid 
where typeamenity.amenitysid = 4;
/*
returned this 
Karie	Yang	201	2023-03-06	2023-03-07
BettyannSeery	203	2023-02-05	2023-02-10
Karie	Yang	203	2023-09-13	2023-09-15
Austin	Stooks	205	2023-06-28	2023-07-02
Wilfred	Vise	207	2023-04-23	2023-04-24
Walter	Holaway	301	2023-04-09	2023-04-13
Mack	Simmer	301	2023-11-22	2023-11-25
Bettyann Seery	303	2023-07-28	2023-07-29
Duane Cullison	305	2023-02-22	2023-02-24
Bettyann Seery	305	2023-08-30	2023-09-01
Austin	Stooks	307	2023-03-17	2023-03-20
*/

-- 3. Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)
select
	guests.guestFirstName,
    guests.guestLastName,
    room.roomnumber,
    reservations.startDate,
    reservations.enddate,
    reservations.numadults,
    reservations.numchildren
from reservations -- inner joins
	left join guestreservations on reservations.reservationId  = guestreservations.reservationId
	left join guests on guestreservations.guestId = guests.guestID
	left join roomreservations on reservations.reservationId = roomreservations.reservationId
	left join room on roomreservations.roomId = room.roomID
where guests.guestFirstname = 'Austin';
/*
returned 
first	last	room# start         end         numadult numchildren
Austin	Stooks	307	  2023-03-17	2023-03-20	1		1
Austin	Stooks	205	  2023-06-28	2023-07-02	2		0

*/

-- 4. Write a query that returns a list of rooms, reservation ID, and 
-- per-room cost for each reservation. The results should include all 
-- rooms, whether or not there is a reservation associated with the room.

select
	room.roomNumber,
    roomtype.typePrice,
    reservations.reservationId
from room
	left join roomReservations on roomReservations.roomId = room.roomID
    left join reservations on reservations.reservationId = roomReservations.reservationId
	left join roomtype on room.typeRoom = roomtype.typeRoom;

/*
roomNumber typeprice  reservationid 
		    2
201	199.99	5
202	174.99	7
203	199.99	3
203	199.99	21
204	174.99	16
205	174.99	15
206	149.99	12
206	149.99	23
207	174.99	10
208	149.99	13
208	149.99	20
301	199.99	9
301	199.99	24
302	174.99	6
302	174.99	25
303	199.99	18
304	174.99	14
305	199.99	4
305	199.99	19
307	174.99	1
401	399.99	11
401	399.99	17
401	399.99	22
*/

-- 5.Write a query that returns all rooms with a capacity of 
-- three or more and that are reserved on any date in April 2023.

select 
	room.roomnumber
from reservations
	left join roomReservations on reservations.reservationId = roomReservations.reservationId
	left join room on roomReservations.roomId = room.roomID
    left join roomtype on room.typeRoom = roomtype.typeRoom
where
	(Month(reservations.startDate) = 4 and roomtype.maxOccupancy >= 3 
    and Month(reservations.endDate) = 4);
/*
returned
roomnumber 
301
*/

-- 7. Write a query that displays the name, address, and phone number 
-- of a guest based on their phone number. (Choose a phone number from 
-- the existing data.)

select 
	guests.guestFirstName,
    guests.guestLastName,
    guests.address,
    guests.phonenumber
from guests
where guests.phonenumber = '(214) 356-5623';

-- results
/*
Austin	Stooks	42 Wallaby Way	(214) 356-5623
*/








-- 6. Write a query that returns a list of all guest names and the number 
-- of reservations per guest, sorted starting with the guest with the 
-- most reservations and then by the guest's last name.

select 
	guests.guestFirstName,
    guests.guestLastName,
    count(guestreservations.guestId) as numReserve
from reservations
	left join guestreservations on reservations.reservationId  = guestreservations.reservationId
	left join guests on guestreservations.guestId = guests.guestID
	left join roomReservations on reservations.reservationId = roomReservations.reservationId
	left join room on roomReservations.roomId = room.roomID
group by guests.guestid
order by 
	numreserve desc,
    guests.guestLastName asc;
	

/*
its wrong

Mack	Simmer	4
Bettyann	Seery	3
Duane	Cullison	2
Walter	Holaway	2
Aurore	Lipton	2
Austin	Stooks	2
Maritza	Tilton	2
Joleen	Tison	2
Wilfred	Vise	2
Karie	Yang	2
Zachery	Luechtefeld	1

*/    







/*drop table vehicle;
drop table usertab;
drop table vehicle_owner;
drop table payment;
drop table booking;
drop table parking_slot;*/

CREATE TABLE usertab
(user_id number(11) NOT NULL,
username varchar(30) NOT NULL,
password varchar(30) NOT NULL,
fullname varchar(50) NOT NULL,
contact varchar(15) NOT NULL,
email varchar(30) NOT NULL,
CONSTRAINT usertab_user_id_PK PRIMARY KEY (user_id)
);



CREATE TABLE vehicle (
  vehicle_id number(11) NOT NULL,
  vehicle_plate_number varchar(15) NOT NULL,
  vehicle_description varchar(100) NOT NULL,
  vehicle_owner_id number(11),
  CONSTRAINT vehicle_vehicle_id_PK PRIMARY KEY (vehicle_id) 
);




CREATE TABLE vehicle_owner (
  vehicle_owner_id number(11) NOT NULL,
  vehicle_owner_name varchar(30) NOT NULL,
  vehicle_owner_contact varchar(15) NOT NULL,
  vehicle_owner_email varchar(30) NOT NULL,
  CONSTRAINT vehicle_owner_vehicle_owner_id_PK PRIMARY KEY (vehicle_owner_id)
);




CREATE TABLE parking_slot(
  parking_slot_id number(11) NOT NULL,
  parking_slot_number number(11) NOT NULL,
  parking_slot_status number(1) NOT NULL,
  vehicle_owner_id number(11),
  CONSTRAINT parking_slot_parking_slot_id_PK PRIMARY KEY (parking_slot_id) 
);


CREATE TABLE payment (
  payment_id number(11) NOT NULL,
  amount_due number,
  amount_paid number NOT NULL,
  remarks varchar(100),
  paid_by varchar(30) NOT NULL,
  vehicle_owner_id number(11),
  CONSTRAINT payment_payment_id_PK PRIMARY KEY (payment_id)
);


CREATE TABLE booking (
  booking_id number(11) NOT NULL,
  remarks varchar(100),
  booking_status number(1),
  vehicle_owner_id number(11),
  vehicle_id number(11),
  parking_slot_id number(11),
  payment_id number(11),
  user_id number(11),
  CONSTRAINT booking_booking_id_PK PRIMARY KEY (booking_id) 
);


/*Adding foreign key constraints*/


ALTER TABLE vehicle
ADD CONSTRAINT vehicle_vehicle_owner_id_FK FOREIGN KEY (vehicle_owner_id) REFERENCES vehicle_owner (vehicle_owner_id);


ALTER TABLE payment
ADD CONSTRAINT payment_vehicle_owner_id_FK FOREIGN KEY (vehicle_owner_id) REFERENCES vehicle_owner (vehicle_owner_id);


ALTER TABLE parking_slot
ADD CONSTRAINT parking_slot_vehicle_owner_id_FK FOREIGN KEY (vehicle_owner_id) REFERENCES vehicle_owner (vehicle_owner_id);

ALTER TABLE booking
ADD CONSTRAINT booking_vehicle_id_FK FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
ADD CONSTRAINT booking_payment_id_FK FOREIGN KEY (payment_id) REFERENCES payment (payment_id)
ADD CONSTRAINT booking_vehicle_owner_id_FK FOREIGN KEY (vehicle_owner_id) REFERENCES vehicle_owner (vehicle_owner_id)
ADD CONSTRAINT booking_slot_id_FK FOREIGN KEY (parking_slot_id) REFERENCES parking_slot (parking_slot_id)
ADD CONSTRAINT booking_user_id_FK FOREIGN KEY (user_id) REFERENCES usertab (user_id);



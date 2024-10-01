BEGIN;
CREATE TABLE IF NOT EXISTS "Roles" (
	id SERIAL PRIMARY KEY, 
	title VARCHAR
);
INSERT INTO "Roles" VALUES(1,'patient');
INSERT INTO "Roles" VALUES(2,'doctor');
INSERT INTO "Roles" VALUES(3,'manager');

CREATE TABLE IF NOT EXISTS "Categories" (
	id SERIAL PRIMARY KEY, 
	title VARCHAR
);
INSERT INTO "Categories" VALUES(1,'urologist');
INSERT INTO "Categories" VALUES(2,'radiologist');
INSERT INTO "Categories" VALUES(3,'cardiologist');
INSERT INTO "Categories" VALUES(4,'urologist');
INSERT INTO "Categories" VALUES(5,'gynecologist');
INSERT INTO "Categories" VALUES(6,'dermatologist');
INSERT INTO "Categories" VALUES(7,'therapist');
INSERT INTO "Categories" VALUES(8,'oncologist');
INSERT INTO "Categories" VALUES(9,'cardiologist');
INSERT INTO "Categories" VALUES(10,'radiologist');
INSERT INTO "Categories" VALUES(11,'cardiologist');
INSERT INTO "Categories" VALUES(12,'dentist');
INSERT INTO "Categories" VALUES(13,'dentist');
INSERT INTO "Categories" VALUES(14,'pediatrician');
INSERT INTO "Categories" VALUES(15,'dentist');
CREATE TABLE IF NOT EXISTS "Offices" (
	id SERIAL PRIMARY KEY, 
	address VARCHAR, 
	contact VARCHAR
);
INSERT INTO "Offices" VALUES(1,'Astana, Nurzhol boulevard, 456','77022345678');
INSERT INTO "Offices" VALUES(2,'Astana, Pushkin street, 789','77085678901');
INSERT INTO "Offices" VALUES(3,'Almaty, Abay street, 123','77074567890');
INSERT INTO "Offices" VALUES(4,'Almaty, Lenin avenue, 1011','77085678901');
INSERT INTO "Offices" VALUES(5,'Almaty, Gogol street, 1213','77011234567');
CREATE TABLE IF NOT EXISTS "Patients" (
	id SERIAL PRIMARY KEY, 
	IIN VARCHAR, 
	name VARCHAR, 
	surname VARCHAR, 
	email VARCHAR, 
	phone VARCHAR, 
	date_of_birth VARCHAR, 
	address VARCHAR, 
	role_id INTEGER, gender TEXT, password TEXT,  
	FOREIGN KEY(role_id) REFERENCES "Roles" (id)
);
INSERT INTO "Patients" VALUES(1,'936026424715','Aisha','Sakenov','iellingham0@archive.org','777782844869',NULL,NULL,1,'M',NULL);
INSERT INTO "Patients" VALUES(2,'094538382619','Aisha','Kazbekov','aandrejs1@independent.co.uk','777794677343',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(3,'506406117639','Erbol','Tulegenov','hvant2@army.mil','777714330417',NULL,NULL,1,'M',NULL);
INSERT INTO "Patients" VALUES(4,'474049997431','Miras','Kenzhetayev','pbroadberrie3@google.co.uk','777742906919',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(5,'719335992223','Ruslan','Ospanov','tensley4@dropbox.com','777757299060',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(6,'713050388585','Saniya','Kenzhetayev','hcaldwall5@prlog.org','777708532572',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(7,'172471680655','Ruslan','Zhumabayev','npeck6@yale.edu','777728017955',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(8,'595262875709','Erbol','Kenzhebayev','aherreros7@xrea.com','777790996034',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(9,'954248635883','Erbol','Nurlybayev','flurner8@reuters.com','777737972502',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(10,'270272785643','Erbol','Kenzhetayev','gmcmurdo9@godaddy.com','777713010402',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(11,'465485420300','Aisha','Nurmagambetov','ghewkina@twitter.com','777791521241',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(12,'571392627733','Gulnaz','Zhumagaliyev','agosnollb@harvard.edu','777755056398',NULL,NULL,1,'M',NULL);
INSERT INTO "Patients" VALUES(13,'577138144991','Erbol','Aidynov','gamphlettc@domainmarket.com','777741772023',NULL,NULL,1,'F',NULL);
INSERT INTO "Patients" VALUES(14,'567024153532','Zarina','Akhmetov','sbrindedd@free.fr','777795370092',NULL,NULL,1,'M',NULL);
INSERT INTO "Patients" VALUES(15,'269365397668','Erbol','Bolatov','tbachee@reddit.com','777729103583',NULL,NULL,1,'M',NULL);
INSERT INTO "Patients" VALUES(19,'0','Albina','Yermek','yermekalbina@gmail.com','77770874638','25.12.2004',NULL,NULL,NULL,'$2b$12$t3irBpcJ.x1LNCnVw7SQgezm.aPJIF/6WazFYd.NFkuBcWPbXqj/W');
CREATE TABLE IF NOT EXISTS "Doctors" (
	id SERIAL PRIMARY KEY, 
	name VARCHAR, 
	surname VARCHAR, 
	email VARCHAR, 
	phone VARCHAR, 
	experience VARCHAR, 
	date_of_birth VARCHAR, 
	office_id INTEGER, 
	category_id INTEGER, 
	lunch_starts VARCHAR, 
	lunch_ends VARCHAR, 
	FOREIGN KEY(office_id) REFERENCES "Offices" (id), 
	FOREIGN KEY(category_id) REFERENCES "Categories" (id)
);
INSERT INTO "Doctors" VALUES(1,'Nargiza','Yun','apearmain0@ucoz.com','777737366768','20',NULL,3,5,'12:00','13:00');
INSERT INTO "Doctors" VALUES(2,'Svetlana','Kwon','abland1@dion.ne.jp','777777023415','19',NULL,2,11,'13:00','14:00');
INSERT INTO "Doctors" VALUES(3,'Dilshod','Yang','cdykas2@alexa.com','777783305089','14',NULL,4,14,'13:00','14:00');
INSERT INTO "Doctors" VALUES(4,'Ruslan','Rakhmanov','rcastanyer3@sfgate.com','777706094544','23',NULL,5,13,'13:00','14:00');
INSERT INTO "Doctors" VALUES(5,'Farkhad','Park','ispileman4@printfriendly.com','777708546557','23',NULL,4,1,'12:00','13:00');
INSERT INTO "Doctors" VALUES(6,'Rustam','Jung','hneild5@yelp.com','777775379856','10',NULL,5,12,'12:00','13:00');
INSERT INTO "Doctors" VALUES(7,'Viktor','Kazakhmetov','cmclarens6@uol.com.br','777741473571','11',NULL,1,13,'13:00','14:00');
INSERT INTO "Doctors" VALUES(8,'Nigora','Koreanov','hlambie7@twitter.com','777735376199','29',NULL,3,9,'12:00','13:00');
INSERT INTO "Doctors" VALUES(9,'Yuliya','Uzbekov','dgubbins8@zdnet.com','777740425113','25',NULL,1,8,'12:00','13:00');
INSERT INTO "Doctors" VALUES(10,'Dmitriy','Kim','toluwatoyin9@google.com.hk','777715092209','29',NULL,4,4,'13:00','14:00');
INSERT INTO "Doctors" VALUES(11,'Yuliya','Kazakhmetov','cbearsmorea@miitbeian.gov.cn','777744114291','19',NULL,1,15,'13:00','14:00');
INSERT INTO "Doctors" VALUES(12,'Kamila','Koreanov','fbraithwaitb@springer.com','777707040858','19',NULL,2,14,'13:00','14:00');
INSERT INTO "Doctors" VALUES(13,'Farrukh','Tursunov','eapplegatec@theguardian.com','777700210368','20',NULL,5,6,'12:00','13:00');
INSERT INTO "Doctors" VALUES(14,'Viktor','Yun','garonovitzd@sciencedirect.com','777745254255','11',NULL,1,11,'13:00','14:00');
INSERT INTO "Doctors" VALUES(15,'Farrukh','Uzbekov','fpepperille@tumblr.com','777794515583','30',NULL,1,6,'13:00','14:00');
INSERT INTO "Doctors" VALUES(16,'Yuliya','Uzbekov','hohrtmannf@gov.uk','777782143170','14',NULL,1,5,'12:00','13:00');
INSERT INTO "Doctors" VALUES(17,'Dinara','Sultanov','dgummg@51.la','777725337926','13',NULL,5,14,'13:00','14:00');
INSERT INTO "Doctors" VALUES(18,'Tatyana','Koreanov','bshimonh@newsvine.com','777711796156','26',NULL,2,8,'13:00','14:00');
INSERT INTO "Doctors" VALUES(19,'Kamila','Kwon','gubanksi@163.com','777765310884','21',NULL,3,1,'12:00','13:00');
INSERT INTO "Doctors" VALUES(20,'Farrukh','Kazakhov','sdignallj@cpanel.net','777709941203','30',NULL,5,3,'13:00','14:00');
CREATE TABLE IF NOT EXISTS "Slots" (
	id SERIAL PRIMARY KEY, 
	doctor_id INTEGER, 
	office_id INTEGER, 
	type VARCHAR, 
	date VARCHAR, 
	starts_at VARCHAR, 
	ends_at VARCHAR, 
	precalculated_cost VARCHAR, 
	final_cost VARCHAR, 
	FOREIGN KEY(doctor_id) REFERENCES "Doctors" (id), 
	FOREIGN KEY(office_id) REFERENCES "Offices" (id)
);
CREATE TABLE IF NOT EXISTS "Tests" (
	id SERIAL PRIMARY KEY, 
	patient_id INTEGER, 
	title VARCHAR, 
	result VARCHAR, 
	FOREIGN KEY(patient_id) REFERENCES "Patients" (id)
);
CREATE TABLE IF NOT EXISTS "Permissions" (
	id SERIAL PRIMARY KEY, 
	patient_id INTEGER, 
	doctor_id INTEGER, 
	exp_date VARCHAR, 
	FOREIGN KEY(patient_id) REFERENCES "Patients" (id), 
	FOREIGN KEY(doctor_id) REFERENCES "Doctors" (id)
);
CREATE TABLE IF NOT EXISTS "Appointments" (
	id SERIAL PRIMARY KEY, 
	patient_id INTEGER, 
	doctor_id INTEGER, 
	office_id INTEGER, 
	slot_id INTEGER, 
	status VARCHAR, 
	cost INTEGER, 

	FOREIGN KEY(patient_id) REFERENCES "Patients" (id), 
	FOREIGN KEY(doctor_id) REFERENCES "Doctors" (id), 
	FOREIGN KEY(office_id) REFERENCES "Offices" (id), 
	FOREIGN KEY(slot_id) REFERENCES "Slots" (id)
);
CREATE TABLE IF NOT EXISTS "Medical_History" (
	id SERIAL PRIMARY KEY, 
	patient_id INTEGER, 
	test_id INTEGER, 
	date VARCHAR, 
	anamnesis VARCHAR, 
	conclusion VARCHAR, 
	prescription VARCHAR, 
	recipe VARCHAR, 

	FOREIGN KEY(patient_id) REFERENCES "Patients" (id), 
	FOREIGN KEY(test_id) REFERENCES "Tests" (id)
);
COMMIT;

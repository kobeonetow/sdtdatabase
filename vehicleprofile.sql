DROP TABLE IF EXISTS vehicleprofile;
CREATE TABLE vehicleprofile(
id SERIAL PRIMARY KEY,
vid VARCHAR(16) NOT NULL,
selfid VARCHAR(8),
company VARCHAR(64),
companyaddr VARCHAR(128),
datejoin DATE,
datepurchase DATE,
dateuse DATE,
ptaxnumber VARCHAR(16),
transportid VARCHAR(18),
source VARCHAR(8),
servicetype VARCHAR(8),
vehicleprice VARCHAR(10),
subprice VARCHAR(8),
dateproduction DATE,
productionaddr VARCHAR(128),
productioncode VARCHAR(64),
madein VARCHAR(8),
vtype VARCHAR(8),
vlevel VARCHAR(8),
enginenum VARCHAR(24),
framenum VARCHAR(24),
model VARCHAR(24),
basednum VARCHAR(24),
enginemodel VARCHAR(24),
bodysize VARCHAR(32),
color VARCHAR(8),
sits VARCHAR(8),
tyrenum VARCHAR(8),
tyremodel VARCHAR(8),
fueltype VARCHAR(8),
vpower VARCHAR(10),
vspeed VARCHAR(8),
fueltankcapacity VARCHAR(8),
wheelbase INT,
frontwheel INT,
backwheel INT,
turnbase VARCHAR(8),
totalweight INT,
subweight INT,
drivemode VARCHAR(8),
subsides VARCHAR(32),
rimmodel VARCHAR(24),
turntype VARCHAR(8),
turnmethod VARCHAR(8),
movebreak VARCHAR(16),
stopbreak VARCHAR(16),
hangmodel VARCHAR(48),
aircond VARCHAR(24),
ecotype VARCHAR(8),
status VARCHAR(1),
throwdate DATE,
dateinvalidate DATE
);

DROP TABLE IF EXISTS vehiclemiles;
CREATE TABLE vehiclemiles(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
vyear INT,
jan FLOAT,
feb FLOAT,
mar FLOAT,
apr FLOAT,
may FLOAT,
jun FLOAT,
jul FLOAT,
aug FLOAT,
sep FLOAT,
octo FLOAT,
nov FLOAT,
dece FLOAT,
yeartotal FLOAT,
historytotal FLOAT,
FOREIGN KEY (vid) REFERENCES vehicleprofile(id)
);


DROP TABLE IF EXISTS vehiclefiles;
CREATE TABLE vehiclefiles(
id SERIAL PRIMARY KEY,
filename VARCHAR(128),
ipath VARCHAR(256),
udate DATE,
creator INT,
FOREIGN KEY (creator) REFERENCES account(id)
);

DROP TABLE IF EXISTS vehiclecheck;
CREATE TABLE vehiclecheck(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
ctype VARCHAR(10) NOT NULL,
miles FLOAT,
cdate DATE,
fid INT,
remark VARCHAR(64),
creator INT,
FOREIGN KEY (vid) REFERENCES vehicleprofile(id),
FOREIGN KEY (fid) REFERENCES vehiclefiles(id),
FOREIGN KEY (creator) REFERENCES account(id)
);

DROP TABLE IF EXISTS vehicleteam;
CREATE TABLE vehicleteam(
id SERIAL PRIMARY KEY,
name VARCHAR(16),
description VARCHAR(256)
);

DROP TABLE IF EXISTS vehiclelane;
CREATE TABLE vehiclelane(
id SERIAL PRIMARY KEY,
num VARCHAR(8),
detail VARCHAR(256)
);

DROP TABLE IF EXISTS vehicleteamleader;
CREATE TABLE vehicleteamleader(
id SERIAL PRIMARY KEY,
teamid INT NOT NULL,
employeeid INT NOT NULL,
FOREIGN KEY (teamid) REFERENCES vehicleteam(id),
FOREIGN KEY (employeeid) REFERENCES employee(id)
);

DROP TABLE IF EXISTS vehicleteammember;
CREATE TABLE vehicleteammember(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
teamid INT NOT NULL,
FOREIGN KEY (vid) REFERENCES vehicleprofile(id),
FOREIGN KEY (teamid) REFERENCES vehicleteam(id)
);


DROP TABLE IF EXISTS vehiclelanemapper;
CREATE TABLE vehiclelanemapper(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
laneid INT NOT NULL,
FOREIGN KEY (vid) REFERENCES vehicleprofile(id),
FOREIGN KEY (laneid) REFERENCES vehiclelane(id)
);

DROP TABLE IF EXISTS vehicledriver;
CREATE TABLE vehicledriver(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
laneid INT NOT NULL,
driver1 INT NOT NULL,
driver2 INT NOT NULL,
remark VARCHAR(256),
ddate DATE,
FOREIGN KEY (vid) REFERENCES vehicleprofile(id),
FOREIGN KEY (laneid) REFERENCES vehiclelane(id),
FOREIGN KEY (driver1) REFERENCES employee(id),
FOREIGN KEY (driver2) REFERENCES employee(id)
);
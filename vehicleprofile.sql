DROP TABLE IF EXISTS vehicleprofile;
CREATE TABLE vehicleprofile(
id SERIAL PRIMARY KEY,
vid VARCHAR(16) NOT NULL,
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

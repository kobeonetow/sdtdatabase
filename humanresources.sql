\c sdbms

DROP TABLE IF EXISTS department;
CREATE TABLE department(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) UNIQUE NOT NULL,
remark VARCHAR(128)
);

DROP TABLE IF EXISTS position;
CREATE TABLE position(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) UNIQUE NOT NULL,
remark VARCHAR(128)
);

DROP TABLE IF EXISTS workertype;
CREATE TABLE workertype(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS qualification;
CREATE TABLE qualification(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS ethnic;
CREATE TABLE ethnic(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS fixoptions;
CREATE TABLE fixoptions(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128),
content text
);

DROP TABLE IF EXISTS hrimage;
CREATE TABLE hrimage(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(128) NOT NULL,
image bytea,
ipath VARCHAR(256)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
id serial PRIMARY KEY NOT NULL,
documentkey VARCHAR(8),
workerid VARCHAR(8) UNIQUE NOT NULL,
fullname VARCHAR(16) ,
sex VARCHAR(1) ,
dob DATE ,
identitycode VARCHAR(18) ,
ethnic VARCHAR(8) ,
politicalstatus VARCHAR(8) ,
pob VARCHAR(8) ,
timeofjoinprc DATE,
homenumber VARCHAR(64),
mobilenumber VARCHAR(64),
email VARCHAR(128),
othercontact VARCHAR(128),
homeaddress VARCHAR(256),
postcode VARCHAR(8),
marriage VARCHAR(8),
qualification VARCHAR(16),
firstworktime DATE,
transfertime DATE,
workertype VARCHAR(64),
joblevel VARCHAR(8),
placebelong VARCHAR(16),
domiciletype VARCHAR(16),
army VARCHAR(64),
colleage VARCHAR(128),
major VARCHAR(128),
departmentid SMALLINT ,
positionid SMALLINT ,
teamid INT,
imageid INT,
remark text,
status VARCHAR(1),
creator INT NOT NULL,
createtime TIMESTAMP WITH TIME ZONE default CURRENT_TIMESTAMP NOT NULL,
FOREIGN KEY (departmentid) REFERENCES department(id),
FOREIGN KEY (positionid) REFERENCES position(id),
FOREIGN KEY (teamid) REFERENCES vehicleteam(id),
FOREIGN KEY (imageid) REFERENCES hrimage(id),
FOREIGN KEY (creator) REFERENCES account(id)
);

DROP TABLE IF EXISTS contract;
CREATE TABLE contract(
id serial PRIMARY KEY NOT NULL,
employeeid INT NOT NULL,
type VARCHAR(16) ,
startdate DATE ,
enddate DATE ,
probation SMALLINT,
probationsalary INT,
salary INT,
remark VARCHAR(256),
activedate DATE,
status VARCHAR(1) NOT NULL,
createdate DATE NOT NULL,
FOREIGN KEY (employeeid) REFERENCES employee(id)
);

DROP TABLE IF EXISTS idmanagement;
CREATE TABLE idmanagement(
id serial PRIMARY KEY NOT NULL,
employeeid INT NOT NULL,
type VARCHAR(64),
number VARCHAR(64),
validfrom DATE ,
expiredate DATE ,
imageid INT,
remark VARCHAR(128),
FOREIGN KEY (employeeid) REFERENCES employee(id),
FOREIGN KEY (imageid) REFERENCES hrimage(id)
);

DROP TABLE IF EXISTS promoandtransfer;
CREATE TABLE promoandtransfer(
id serial PRIMARY KEY NOT NULL,
employeeid INT NOT NULL,
type VARCHAR(8) NOT NULL,
amount VARCHAR(16),
predepartmentid SMALLINT,
curdepartmentid SMALLINT,
movedate DATE,
activedate DATE,
prepositionid SMALLINT,
curpositionid SMALLINT,
createdate DATE,
creator INT,
remark VARCHAR(128),
FOREIGN KEY (employeeid) REFERENCES employee(id),
FOREIGN KEY (predepartmentid) REFERENCES department(id),
FOREIGN KEY (curdepartmentid) REFERENCES department(id),
FOREIGN KEY (prepositionid) REFERENCES position(id),
FOREIGN KEY (curpositionid) REFERENCES position(id),
FOREIGN KEY (creator) REFERENCES account(id)
);

DROP TABLE IF EXISTS bankaccount;
CREATE TABLE bankaccount(
id serial PRIMARY KEY NOT NULL,
employeeid INT NOT NULL,
account VARCHAR(64) NOT NULL,
bankname VARCHAR(32) NOT NULL,
FOREIGN KEY (employeeid) REFERENCES employee(id) 
);

DROP TABLE IF EXISTS socialrelation;
CREATE TABLE socialrelation(
id serial PRIMARY KEY NOT NULL,
employeeid INT NOT NULL,
name VARCHAR(16) NOT NULL,
relation VARCHAR(10) NOT NULL,
politicalstatus VARCHAR(8) NOT NULL,
dob DATE,
company VARCHAR(32),
position VARCHAR(16),
email VARCHAR(128),
number VARCHAR(32),
FOREIGN KEY (employeeid) REFERENCES employee(id)
);
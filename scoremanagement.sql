\c sdbms

DROP TABLE IF EXISTS scoretype;
CREATE TABLE scoretype(
id serial PRIMARY KEY NOT NULL,
reference VARCHAR(32) NOT NULL,
type SMALLINT NOT NULL,
description text NOT NULL,
score FLOAT(24) NOT NULL,
period VARCHAR(8),
examine VARCHAR(32),
scoreobject VARCHAR(16),
remark VARCHAR(128),
creator INT NOT NULL,
createdate DATE,
FOREIGN KEY (creator) REFERENCES account(id)
);


DROP TABLE IF EXISTS scoremember;
CREATE TABLE scoremember(
id serial PRIMARY KEY NOT NULL,
workerid VARCHAR(8) UNIQUE NOT NULL,
monthlytotal FLOAT(24),
monthlyremain FLOAT(24),
historytotal FLOAT(24),
monthlyscore FLOAT(24),
voucherscore INT DEFAULT 0,
FOREIGN KEY (workerid) REFERENCES employee(workerid)
);


DROP TABLE IF EXISTS scorerecord;
CREATE TABLE scorerecord(
id serial PRIMARY KEY NOT NULL,
receiverid VARCHAR(8) NOT NULL,
senderid VARCHAR(8) NOT NULL,
scoretypeid INT NOT NULL,
creator INT NOT NULL,
scoredate DATE,
score FLOAT(24) NOT NULL,
createdate DATE,
status SMALLINT NOT NULL,
Foreign KEY (receiverid) REFERENCES scoremember(workerid),
Foreign KEY (senderid) REFERENCES scoremember(workerid),
Foreign KEY (scoretypeid) REFERENCES scoretype(id),
FOREIGN KEY (creator) REFERENCES account(id)
);

DROP TABLE IF EXISTS scoresummary;
CREATE TABLE scoresummary(
id serial PRIMARY KEY NOT NULL,
workerid VARCHAR(8) NOT NULL,
date DATE NOT NULL,
score FLOAT(24) NOT NULL DEFAULT 0,
fixscore FLOAT(24) NOT NULL DEFAULT 0,
performancescore FLOAT(24) NOT NULL DEFAULT 0,
projectscore FLOAT(24) NOT NULL DEFAULT 0,
FOREIGN KEY (workerid) REFERENCES employee(workerid)
);

DROP TABLE IF EXISTS scoresheets;
CREATE TABLE scoresheets(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(256),
remark text
);

DROP TABLE IF EXISTS scoresheetmapper;
CREATE TABLE scoresheetmapper(
id serial PRIMARY KEY NOT NULL,
sheetid INT NOT NULL,
scoretypeid INT NOT NULL,
FOREIGN KEY (sheetid) REFERENCES scoresheets(id),
FOREIGN KEY (scoretypeid) REFERENCES scoretype(id)
);

DROP TABLE IF EXISTS scorelog;
CREATE TABLE scorelog(
id serial PRIMARY KEY NOT NULL,
action INT NOT NULL,
who INT NOT NULL,
createtime TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
remark VARCHAR(256),
recordid VARCHAR(10)
);

DROP TABLE IF EXISTS scoregroup;
CREATE TABLE scoregroup(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(64),
remark VARCHAR(256)
);

DROP TABLE IF EXISTS positiongroup;
CREATE TABLE positiongroup(
id serial PRIMARY KEY NOT NULL,
scoregroupid INT NOT NULL,
positionid INT NOT NULL,
FOREIGN KEY (scoregroupid) REFERENCES scoregroup(id),
FOREIGN KEY (positionid) REFERENCES position(id)
);

DROP TABLE IF EXISTS voucherlist;
CREATE TABLE voucherlist(
id serial PRIMARY KEY NOT NULL,
workerid VARCHAR(8) NOT NULL,
quantity INT NOT NULL,
score INT NOT NULL,
date DATE,
FOREIGN KEY (workerid) REFERENCES employee(workerid)
);

DROP TABLE IF EXISTS scoreapprover;
CREATE TABLE scoreapprover(
id serial PRIMARY KEY NOT NULL,
approver INT NOT NULL,
departmentid INT,
vehicleteamid INT,
isapprover VARCHAR(1) NOT NULL,
FOREIGN KEY (approver) REFERENCES employee(id),
FOREIGN KEY (departmentid) REFERENCES department(id),
FOREIGN KEY (vehicleteamid) REFERENCES vehicleteam(id)
);

DROP TABLE IF EXISTS departmentscores;
CREATE TABLE departmentscores(
id serial PRIMARY KEY NOT NULL,
departmentid INT,
vehicleteamid INT,
basescore FLOAT,
available FLOAT,
FOREIGN KEY (departmentid) REFERENCES department(id),
FOREIGN KEY (vehicleteamid) REFERENCES vehicleteam(id)
);

DROP TABLE IF EXISTS scoreexceptionlist;
CREATE TABLE scoreexceptionlist(
id serial PRIMARY KEY NOT NULL,
positionid INT,
status INT,
FOREIGN KEY (positionid) REFERENCES position(id)
);
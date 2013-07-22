\c sdbms

DROP TABLE IF EXISTS scoretype;
CREATE TABLE scoretype(
id serial PRIMARY KEY NOT NULL,
reference VARCHAR(32) NOT NULL,
type SMALLINT NOT NULL,
description text NOT NULL,
score INT NOT NULL,
creator INT NOT NULL,
createdate DATE,
FOREIGN KEY (creator) REFERENCES account(id)
);


DROP TABLE IF EXISTS scoremember;
CREATE TABLE scoremember(
id serial PRIMARY KEY NOT NULL,
workerid VARCHAR(8) UNIQUE NOT NULL,
monthlytotal INT,
monthlyremain INT,
historytotal INT,
monthlyscore INT,
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
score INT NOT NULL,
createdate DATE,
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
score INT NOT NULL DEFAULT 0,
fixscore INT NOT NULL DEFAULT 0,
performancescore INT NOT NULL DEFAULT 0,
projectscore INT NOT NULL DEFAULT 0,
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
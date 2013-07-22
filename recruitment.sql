DROP TABLE IF EXISTS hr_application;
CREATE TABLE hr_application(
id serial PRIMARY KEY,
applydate DATE NOT NULL,
department SMALLINT,
position SMALLINT,
name VARCHAR(8) NOT NULL,
mobile VARCHAR(16),
email VARCHAR(64),
domicile VARCHAR(8),
residence VARCHAR(8),
pol VARCHAR(8),
dorm SMALLINT,
driver SMALLINT,
dob DATE,
bodychecknoti SMALLINT,
bodycheckpass SMALLINT,
submitdetail SMALLINT,
interviewnoti DATE,
interviewresult SMALLINT,
interviewremark VARCHAR(64),
driverexamresult SMALLINT,
approvedate DATE,
approveresult SMALLINT,
joindate DATE,
remark VARCHAR(128),
creator SMALLINT,
FOREIGN KEY (department) REFERENCES department(id),
FOREIGN KEY (position) REFERENCES position(id),
FOREIGN KEY (creator) REFERENCES account(id)
);


DROP TABLE IF EXISTS application_idcards;
CREATE TABLE application_idcards(
id serial PRIMARY KEY,
name VARCHAR(64)
);

DROP TABLE IF EXISTS applicant_idcard_mapper;
CREATE TABLE applicant_idcard_mapper(
id serial PRIMARY KEY,
applicationid INT NOT NULL,
idcardid INT NOT NULL,
FOREIGN KEY (applicationid) REFERENCES hr_application(id),
FOREIGN KEY (idcardid) REFERENCES application_idcards(id)
);

DROP TABLE IF EXISTS driving_exam;
CREATE TABLE driving_exam(
id serial PRIMARY KEY,
applicationid INT NOT NULL,
examdate DATE,
examtimes SMALLINT,
exampass SMALLINT,
zhuangdate DATE,
zhuangpass SMALLINT,
roaddate DATE,
roadpass SMALLINT,
remark VARCHAR(128),
inspector VARCHAR(8),
FOREIGN KEY (applicationid) REFERENCES hr_application(id)
);

DROP TABLE IF EXISTS training;
CREATE TABLE training(
id serial PRIMARY KEY,
applicationid INT NOT NULL,
jointraining SMALLINT,
jointrainingdate DATE,
tctraining SMALLINT,
tctrainingdate DATE,
FOREIGN KEY (applicationid) REFERENCES hr_application(id)
);

DROP TABLE IF EXISTS work_arrangement;
CREATE TABLE work_arrangement(
id serial PRIMARY KEY,
applicationid INT,
workerid VARCHAR(8),
department SMALLINT,
position SMALLINT,
place VARCHAR(8),
FOREIGN KEY (applicationid) REFERENCES hr_application(id),
FOREIGN KEY (department) REFERENCES department(id),
FOREIGN KEY (position) REFERENCES position(id),
FOREIGN KEY (workerid) REFERENCES employee(workerid)
);

DROP TABLE IF EXISTS employee_request;
CREATE TABLE employee_request(
id serial PRIMARY KEY,
department SMALLINT,
position SMALLINT,
requirenum INT,
commitnum INT,
receiveform DATE,
sendapprove DATE,
approveddate DATE,
approveresult SMALLINT,
remark VARCHAR(64),
FOREIGN KEY (department) REFERENCES department(id),
FOREIGN KEY (position) REFERENCES position(id)
);

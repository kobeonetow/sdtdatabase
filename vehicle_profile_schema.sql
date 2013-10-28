DROP TABLE IF EXISTS vehicle_profile;
CREATE TABLE vehicle_profile(
id SERIAL PRIMARY KEY,
vid VARCHAR(10) NOT NULL,
selfid VARCHAR(10),
vcolor VARCHAR(10),
subcompany VARCHAR(8),
joindate DATE,
registerdate DATE,
throwdate DATE,
forcethrowdate DATE,
purchasedate DATE,
purchasecode VARCHAR(64),
imageid INT,
creator INT,
status VARCHAR(1),
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (imageid) REFERENCES hrimage(id)
);

DROP TABLE IF EXISTS vehicle_basic_info;
CREATE TABLE vehicle_basic_info(
id SERIAL PRIMARY KEY,
vid INT,
oldid INT,
master VARCHAR(64),
operatenumber VARCHAR(20),
companytype VARCHAR(20),
operatemode VARCHAR(20),
operatelevel VARCHAR(8),
operaterange VARCHAR(10),
transportnumber VARCHAR(20),
registernumber VARCHAR(10),
operateroute VARCHAR(64),
source VARCHAR(8),
maintenancemile VARCHAR(16),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id),
FOREIGN KEY (oldid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_technical_detail;
CREATE TABLE vehicle_technical_detail(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
vtype VARCHAR(8),
factorycode VARCHAR(20),
factorydate DATE,
madein VARCHAR(8),
vincode VARCHAR(32),
basecode VARCHAR(32),
vlevel VARCHAR(8),
vlength VARCHAR(8),
vwidth VARCHAR(8),
vheight VARCHAR(8),
weight VARCHAR(8),
sitarrange VARCHAR(32),
sits VARCHAR(32),
dragweight VARCHAR(8),
vaxis VARCHAR(8),
enginemodel VARCHAR(32),
enginecode VARCHAR(32),
fueltype VARCHAR(8),
enginepower VARCHAR(16),
enginehorse VARCHAR(16),
releasestandard VARCHAR(8),
drivermode VARCHAR(8),
tyre VARCHAR(16),
frontlight VARCHAR(16),
variatormode VARCHAR(8),
retarder VARCHAR(4),
turner VARCHAR(8),
breakmode VARCHAR(8),
frontbreak VARCHAR(16),
backbreak VARCHAR(32),
hangmodefront VARCHAR(32),
hangmodeback VARCHAR(32),
other VARCHAR(32),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_repair_record;
CREATE TABLE vehicle_repair_record(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
rdate DATE,
rtype VARCHAR(8),
description VARCHAR(128),
rcompany VARCHAR(64),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_parts_repair;
CREATE TABLE vehicle_parts_repair(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
changedate DATE,
description VARCHAR(128),
company VARCHAR(64),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_level;
CREATE TABLE vehicle_level(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
date DATE,
distance VARCHAR(16),
description VARCHAR(128),
techlevel VARCHAR(8),
carlevel VARCHAR(8),
company VARCHAR(64),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_change;
CREATE TABLE vehicle_change(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
date DATE,
reason VARCHAR(64),
description VARCHAR(128),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_use_record;
CREATE TABLE vehicle_use_record(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
date DATE,
mileage FLOAT(24),
intervalmileage FLOAT(24),
fuel FLOAT(24),
setprice FLOAT(24),
remine FLOAT(24),
exceed FLOAT(24),
company VARCHAR(64),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_accident;
CREATE TABLE vehicle_accident(
id SERIAL PRIMARY KEY,
vid INT NOT NULL,
date DATE,
place VARCHAR(64),
atype VARCHAR(8),
responsibility VARCHAR(8),
description VARCHAR(128),
cost FLOAT(24),
registrant VARCHAR(8),
creator INT,
FOREIGN KEY (creator) REFERENCES account(id),
FOREIGN KEY (vid) REFERENCES vehicle_profile(id)
);

DROP TABLE IF EXISTS vehicle_log;
CREATE TABLE vehicle_log(
id SERIAL PRIMARY KEY,
who INT,
action SMALLINT,
createtime DATE,
remark VARCHAR(128),
recordid VARCHAR(8),
FOREIGN KEY (who) REFERENCES account(id)
);
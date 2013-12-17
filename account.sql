\c sdbms

DROP TABLE IF EXISTS account;
CREATE TABLE account(
id serial PRIMARY KEY NOT NULL,
username VARCHAR(64) UNIQUE NOT NULL,
password VARCHAR(32) NOT NULL,
registerDate DATE default CURRENT_DATE,
status VARCHAR(1),
employee VARCHAR(10),
email VARCHAR(128)
);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(32) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS action;
CREATE TABLE action(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS accountgroup;
CREATE TABLE accountgroup(
id serial PRIMARY KEY NOT NULL,
accountid INT NOT NULL,
groupid INT NOT NULL,
FOREIGN KEY (accountid) REFERENCES account(id),
FOREIGN KEY (groupid) REFERENCES groups(id)
);

DROP TABLE IF EXISTS actiongroup;
CREATE TABLE actiongroup(
id serial PRIMARY KEY NOT NULL,
action VARCHAR(32) NOT NULL,
groupid INT NOT NULL,
FOREIGN KEY (groupid) REFERENCES groups(id),
FOREIGN KEY (action) REFERENCES action(name) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS accountlog;
CREATE TABLE accountlog(
id serial PRIMARY KEY NOT NULL,
action INT NOT NULL,
who INT NOT NULL,
createtime TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
tablename VARCHAR(128),
recordid VARCHAR(10)
);
DROP TABLE IF EXISTS contract_img;
CREATE TABLE contract_img(
id SERIAL PRIMARY KEY,
cid INT NOT NULL,
name VARCHAR(64),
ipath VARCHAR(256),
uploaddate DATE,
FOREIGN KEY (cid) REFERENCES contract(id)
);


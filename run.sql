SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


SET default_tablespace = '';

SET default_with_oids = false;

DROP DATABASE IF EXISTS sdbms;
CREATE DATABASE sdbms WITH ENCODING 'UTF8';

\c sdbms
\i account.sql 
\i humanresources.sql
\i scoremanagement.sql
\i defaultdata.sql

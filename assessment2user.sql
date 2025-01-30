-- create database 
create database house_management;
-- create user and his/her password
create user 'assessment2'@'127.0.0.1'IDENTIFIED BY '2401000638';
/* grant the permission to the user on the crated database */
Grant all privileges on house_management.* To 'assessment2'@'127.0.0.1';
flush privileges;
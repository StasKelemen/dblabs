Place into:
C:\ProgramData\MySQL\MySQL Server 8.0\Uploads

And change '\' to '/'.

Command:

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Category.tbl' INTO TABLE Category LINES TERMINATED BY '\r\n';
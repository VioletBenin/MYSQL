-- 用SQL语句实现如下题目：
-- 1．创建上述3个表。

CREATE TABLE marchane(
Mid char(3),
Mname char(20),
price float(5),
supply char(20)
);

CREATE TABLE guset(
Gno char(10),
Gname char(10),
Gadd char(20)
);

CREATE TABLE buy(
Gno char(10),
Mid char(3),
Bnum int
);

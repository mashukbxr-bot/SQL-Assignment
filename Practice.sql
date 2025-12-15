


mysql> USE swiggy_db;

mysql> CREATE TABLE Swiggy (
    -> Name VARCHAR(50),
    -> Rating VARCHAR(10),
    -> Price INT
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO Swiggy
    -> VALUES ('Panner', 5, 180),
    -> ('Idli', 3, 120),
    -> ('Dosa', 4, 130);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Swiggy;
+--------+--------+-------+
| Name   | Rating | Price |
+--------+--------+-------+
| Panner | 5      |   180 |
| Idli   | 3      |   120 |
| Dosa   | 4      |   130 |
+--------+--------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Swiggy
    -> WHERE Name = 'Panner';
+--------+--------+-------+
| Name   | Rating | Price |
+--------+--------+-------+
| Panner | 5      |   180 |
+--------+--------+-------+
1 row in set (0.01 sec)

 INSERT INTO Swiggy
('Curd'' at line 2
mysql> SELECT * FROM Swiggy
    -> SELECT * FROM Swiggy;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM Swiggy' at line 2
mysql> INSERT INTO Swiggy
    -> VALUES ('Curd', 4, 80),
    -> ('Dal', 4, 120);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Swiggy;
+--------+--------+-------+
| Name   | Rating | Price |
+--------+--------+-------+
| Panner | 5      |   180 |
| Idli   | 3      |   120 |
| Dosa   | 4      |   130 |
| Curd   | 4      |    80 |
| Dal    | 4      |   120 |
+--------+--------+-------+
5 rows in set (0.00 sec)

mysql> UPDATE Swiggy
    -> SET Name = 'Dal Tadka'
    -> WHERE Name = 'Dal';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Swiggy;
+-----------+--------+-------+
| Name      | Rating | Price |
+-----------+--------+-------+
| Panner    | 5      |   180 |
| Idli      | 3      |   120 |
| Dosa      | 4      |   130 |
| Curd      | 4      |    80 |
| Dal Tadka | 4      |   120 |
+-----------+--------+-------+
5 rows in set (0.00 sec)

mysql> INSERT INTO Swiggy
    -> ('Fried Rice', 4, 160),
    -> ('Chicken Tikka', 5, 220);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Fried Rice', 4, 160),
('Chicken Tikka', 5, 220)' at line 2
mysql> INSERT INTO Swiggy
    -> VALUES  ('Fried Rice', 4, 160),
    ->  ('Chicken Tikka', 5, 220);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+
| Name          | Rating | Price |
+---------------+--------+-------+
| Panner        | 5      |   180 |
| Idli          | 3      |   120 |
| Dosa          | 4      |   130 |
| Curd          | 4      |    80 |
| Dal Tadka     | 4      |   120 |
| Fried Rice    | 4      |   160 |
| Chicken Tikka | 5      |   220 |
+---------------+--------+-------+
7 rows in set (0.00 sec)

mysql> DELETE FROM Swiggy
    -> WHERE Name = Idli;
ERROR 1054 (42S22): Unknown column 'Idli' in 'where clause'
mysql> DELETE FROM Swiggy
    -> WHERE Name = 'Idli';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+
| Name          | Rating | Price |
+---------------+--------+-------+
| Panner        | 5      |   180 |
| Dosa          | 4      |   130 |
| Curd          | 4      |    80 |
| Dal Tadka     | 4      |   120 |
| Fried Rice    | 4      |   160 |
| Chicken Tikka | 5      |   220 |
+---------------+--------+-------+
6 rows in set (0.00 sec)

mysql> UPDATE Swiggy
    -> SET Rating = 3
    -> WHERE Name = 'Curd';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+
| Name          | Rating | Price |
+---------------+--------+-------+
| Panner        | 5      |   180 |
| Dosa          | 4      |   130 |
| Curd          | 3      |    80 |
| Dal Tadka     | 4      |   120 |
| Fried Rice    | 4      |   160 |
| Chicken Tikka | 5      |   220 |
+---------------+--------+-------+
6 rows in set (0.00 sec)

mysql> INSERT INTO Swiggy
    -> VALUES ('Soda', 3, 120),
    -> ('Papdi Chhatt', 4, 90),
    -> ('Mojito', 5, 130);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+
| Name          | Rating | Price |
+---------------+--------+-------+
| Panner        | 5      |   180 |
| Dosa          | 4      |   130 |
| Curd          | 3      |    80 |
| Dal Tadka     | 4      |   120 |
| Fried Rice    | 4      |   160 |
| Chicken Tikka | 5      |   220 |
| Soda          | 3      |   120 |
| Papdi Chhatt  | 4      |    90 |
| Mojito        | 5      |   130 |
+---------------+--------+-------+
9 rows in set (0.00 sec)

mysql> UPDATE Swiggy
    -> SET Price = 220
    -> WHERE Name = 'Panner';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+
| Name          | Rating | Price |
+---------------+--------+-------+
| Panner        | 5      |   220 |
| Dosa          | 4      |   130 |
| Curd          | 3      |    80 |
| Dal Tadka     | 4      |   120 |
| Fried Rice    | 4      |   160 |
| Chicken Tikka | 5      |   220 |
| Soda          | 3      |   120 |
| Papdi Chhatt  | 4      |    90 |
| Mojito        | 5      |   130 |
+---------------+--------+-------+
9 rows in set (0.00 sec)

mysql> ALTER TABLE Swiggy
    -> ADD half_price INT,
    -> ADD delivery_time VARCHAR(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Swiggy;
+---------------+--------+-------+------------+---------------+
| Name          | Rating | Price | half_price | delivery_time |
+---------------+--------+-------+------------+---------------+
| Panner        | 5      |   220 |       NULL | NULL          |
| Dosa          | 4      |   130 |       NULL | NULL          |
| Curd          | 3      |    80 |       NULL | NULL          |
| Dal Tadka     | 4      |   120 |       NULL | NULL          |
| Fried Rice    | 4      |   160 |       NULL | NULL          |
| Chicken Tikka | 5      |   220 |       NULL | NULL          |
| Soda          | 3      |   120 |       NULL | NULL          |
| Papdi Chhatt  | 4      |    90 |       NULL | NULL          |
| Mojito        | 5      |   130 |       NULL | NULL          |
+---------------+--------+-------+------------+---------------+
9 rows in set (0.00 sec)


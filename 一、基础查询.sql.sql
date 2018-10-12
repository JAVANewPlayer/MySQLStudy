# 基础查询
#进阶1：基础查询
/*
语法：
select 查询列表 from 表名;

特点：
/*
1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/
USE myemployees; 
#1.查询表中的单个字段
SELECT last_name FROM employees; 
#2.查询表中的多个字段
SELECT last_name,salary,email FROM employees; 
#3.查询表中的所有字段
#方式一：
SELECT `employee_id`,`first_name`,`last_name`,`phone_number`,`last_name`,`job_id`,`phone_number`,`job_id`,`salary`,`commission_pct`,`manager_id`,`department_id`,`hiredate` FROM employees; #方式二：
SELECT*FROM employees; 
#4.查询常量值
SELECT 100; 
SELECT 'john'; 
#5.查询表达式
SELECT 100 % 98;
#6 查询函数
SELECT VERSION();
#7 起别名
/*
* 便于理解，提高可读性
* 如果查询的字段有重名的情况，使用别名可以区分开来
*/
#方式一
SELECT 100%98 AS 结果;
SELECT last_name AS 姓,first_name AS 名 FROM employees;
#方式二
SELECT last_name 姓, first_name 名 FROM employees;
# 案列 查询salary，显示结果为out put
SELECT salary AS "OUT PUT" FROM employees;
#8 去重
#案列 查询员工表中的部门编号
SELECT DISTINCT department_id FROM employees;
#9 +号的作用,在sql仅仅是一个运算符
SELECT NULL+10;
SELECT "hehe"+90;
SELECT 90+90;
SELECT CONCAT('a','b','c');
#案列：查询员工名字和姓连接成一个字段，并显示为姓名
SELECT CONCAT(last_name,first_name) AS 姓名 FROM employees;
#10显示表的结构
DESC departments;
#11字段为空处理
SELECT IFNULL(commission_pct,0) AS 奖金率, commission_pct FROM employees;













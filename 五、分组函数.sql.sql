# 分组函数
/*
功能：用作统计使用，又称为聚合函数或者统计函数或者组函数

分类：
sum 求和、 avg 平均值、 max 最大值、 min 最小值、 count 计算个数
* sum,agv一般用于处理数值型，max,min,count可以处理任何类型
* 以上分组函数都忽略null值
* 可以和distinct搭配实现去重的运算
* 一般使用count(*)统计行数
* 和分组函数一同查询的字段要求是group by后的字段
*/

#1、 简单的使用
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT SUM(salary) AS 和, ROUND(AVG(salary),2) AS 平均, MAX(salary) AS 最高, MIN(salary) AS 最低, COUNT(salary) AS 个数 FROM employees;

#2、参数支持哪些类型
SELECT SUM(hiredate), AVG(hiredate) FROM employees;
SELECT COUNT(commission_pct) FROM employees;

#3、 是否忽略null
SELECT MAX(commission_pct), MIN(commission_pct) FROM employees;

#4 和distinct搭配
SELECT SUM(DISTINCT salary), SUM(salary) FROM employees;
SELECT COUNT(DISTINCT salary),COUNT(salary) FROM employees;

#5 count函数的详细介绍
SELECT COUNT(salary),COUNT(*) FROM employees;

#6 查询员工表中最大入职时间和最小入职时间的相差天数
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) AS 相差天数 FROM employees;

# ===================================分组查询=======================
/*
语法：
SELECT 分组函数、列(要求出现在group by后面)
FROM 表
WHERE 筛选条件
GROUP BY 分组的列表
ORDER BY 子句

注意：
   查询列表必须特殊、要求是分组函数和group by后出现的字段
*/

# 案列一; 查询每个工种的最高工资
SELECT MAX(salary),job_id FROM employees GROUP BY job_id;

# 案列二：查询每个位置上的部门个数
SELECT COUNT(*),location_id FROM departments GROUP BY location_id;


# 案列三: 查询邮箱中包含a字符的每个部门的平均工资
SELECT AVG(salary),department_id FROM employees WHERE email LIKE '%a%' GROUP BY department_id;

# 案列三: 查询有奖金的每个领导手下员工的最高工资
SELECT MAX(salary),manager_id FROM employees WHERE commission_pct IS NOT NULL GROUP BY manager_id;

# 案列四：查询那个部门的员工个数大于2
 #查询每个部门的员工个数
 SELECT COUNT(*),department_id FROM employees GROUP BY department_id;
 #根据上面的结果进行筛选，查询那个部门的员工个数>2
 SELECT COUNT(*),department_id FROM employees GROUP BY department_id HAVING COUNT(*)>2;
 



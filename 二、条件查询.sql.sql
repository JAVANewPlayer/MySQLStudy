#条件查询
/*
* 语法 SELECT 查询列表 FROM 表名 WHERE 筛选条件;
分类：
   一 按条件表达式筛选 > < = != <. >= <=
	 二 按照逻辑表达式筛选 && || ! and or not
	 三 模糊查询 like ,between and, in ,is null
*/
#一 条件表达式筛选
#1 案列一 查询工资>12000的员工
SELECT * FROM employees WHERE salary>12000;
#2 案列二 查询部门编号不等于90号的员工名和部门编号
SELECT last_name,department_id FROM employees WHERE department_id<>90;

#二 按逻辑表达式筛选
#1 案列一 查询工资在10000到20000之间的员工名、工资、奖金
SELECT last_name, salary, commission_pct FROM employees WHERE salary>=10000 AND salary<=20000;
#2 案列二 查询部门编号不是在90到110之间或者工资高于15000的员工信息
SELECT * FROM employees WHERE department_id<90 OR department_id>110 OR salary>15000;

#三 模糊查询
/*
* LIKE 一般和通配符搭配使用
	* % 任意多个字符，包含零个字符
	* _ 任意单个字符
* BETWEEN AND
	* 可以提高简洁度
	* 包含临界值
	* 两个临界值不能调换顺序
* IN
	* 判断某字段的值是否属于in列表中的某一项
	* 提高字段的简洁度
	* IN列表的值类型必须统一或者兼容
* IS NULL |IS NOT NULL
	* = 或者 <>不能用于判断null值
	* is null 或者 is not null 用于null判断
* 安全等于 <=>
	* 可以用于null判断
	* IS NULL 只可以判断null值，可读性较高
	* <=> 既可以判断null值，又可以判断普通的数值，可读性较低。
*/
# 1 LIKE
#1 案列一 查询员工名中包含字符a的员工信息
SELECT * FROM employees WHERE last_name LIKE '%a%';
#2 案列二 查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT last_name,salary FROM employees WHERE last_name LIKE '__n_l_%';
#3 案列三 查询员工名中第二个字符为_的员工
SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';
#2 BETWEEN AND
#案列1: 查询员工编号在100到120之间的员工信息
SELECT * FROM employees WHERE employee_id>=100 AND employee_id<=120;
SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;
#3 IN关键字
#1 案列一 查询员工的工种编号是IT_PROG,AD_VP,AD_PRES中的一个员工名和工种编号
SELECT last_name,job_id FROM employees WHERE job_id='IT_PROT' OR job_id='AD_VP' OR job_id='AD_PRES';
SELECT last_name,job_id FROM employees WHERE job_id IN('IT_PROT','AD_VP','AD_PRES');
#4 is null
#1 案列一：查询没有奖金的员工名和奖金率
SELECT last_name,commission_pct FROM employees WHERE commission_pct is NULL;
#1 案列一：查询有奖金的员工名和奖金率
SELECT last_name,commission_pct FROM employees WHERE commission_pct is NOT NULL;
#5 安全等于
#1 案列一：查询没有奖金的员工名和奖金率
SELECT last_name,commission_pct FROM employees WHERE commission_pct <=> NULL;
#2 案列二： 查询工资为12000的员工信息
SELECT last_name,salary FROM employees WHERE salary <=> 12000;


















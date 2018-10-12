# 常见函数

/*
* 功能：将一组逻辑封装在方法体中，对外暴露方法名
* 好处: 隐藏了实现细节、提高代码的重用性
* 调用: SELECT 函数名(实参列表) FROM 表;
* 分类：
	* 单行函数，concat,length,ifnull等
		* 字符函数
		* 数学函数
		* 日期函数
		* 流程控制函数
	* 分组函数：
		* 功能: 做统计使用
		*
*/
//============================================================
# 一、 字符函数

# 一 length
SELECT LENGTH("张三");
SELECT LENGTH("张三娃dheee");

SHOW VARIABLES LIKE '%char%'; //系统字符集

# 二 concat 拼接字符串
SELECT CONCAT(last_name,'_',first_name) AS 姓名 FROM employees;

# 三 upper,lower
SELECT UPPER('john');
# 案列 将姓变大写、名变小写、然后拼接
SELECT CONCAT(UPPER(last_name),LOWER(first_name)) AS 姓名 FROM employees;

# 四 substr,substring截取字符串
#注意 索引从1开始
# 截取从指定索引处后面所有的字符
SELECT SUBSTR("李莫愁爱上了陆展元",7) out_put;
# 索取从指定索引处指定字符长度的字符
SELECT SUBSTR('李莫愁爱上了陆展元',1,3) out_put;
#案列: 姓名中首字符大写、其他字符小写然后用_拼接,显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),'_',LOWER(SUBSTR(last_name,2))) out_put;

# 五 instr 返回子字符串在大字符串中第一次出现的起始索引，如果找不到，则返回0
SELECT INSTR('杨不悔殷六侠爱上了殷六侠','殷六侠') AS out_put FROM employees;

# 六 trim 截取字符串的两边
SELECT LENGTH(TRIM('     张翠山     ')) AS out_put;
SELECT TRIM('a' FROM 'aaaaa张aaaaaaaa翠山aaaaaaaaaaaaaaaaaaaaaa') AS out_put;

# 七 lpad  用指定的字符实现左填充指定长度
SELECT LPAD('殷素素',10,'*') AS out_put;

# 八 rpad  用指定的字符实现右填充指定长度
SELECT RPAD('殷素素',10,'ab') AS out_put;

# 九 replace 替换
SELECT REPLACE('周芷若周芷若张翠山爱上了周芷若','周芷若','赵敏');

//============================================================
# 二、 数学函数

# 一 round 四舍五入
SELECT ROUND(-1.55) AS out_put;
SELECT ROUND(1.567,2) AS out_put;

# 二 ceil 向上取整,返回大于等于该参数的最小整数
SELECT CEIL(1.002);
SELECT CEIL(1.00);

# 三 floor 向下取整，返回小于等于该参数的最大整数
SELECT FLOOR(-9.99);

# 四 truncate 截断
SELECT TRUNCATE(1.699999,1);

# 五 取余 MOD(a/b)= a - a/b * b; 相当于符号只和被除数有关
SELECT MOD(10,-3); //结果为1

//============================================================
# 三、 日期函数

# now 返回当前系统日期+时间
SELECT now();

# curdate 返回当前系统日期、不包含时间
SELECT CURDATE()

# curtime 返回当前时间、不包含日期
SELECT CURTIME();

# 可以获取指定的部分、年、月、日、时、分、秒
SELECT YEAR(NOW()) AS 年;
SELECT YEAR('1998-1-1') AS 年;
SELECT YEAR(hiredate) AS 年 FROM employees;
SELECT MONTH(NOW()) AS 月;
SELECT MONTHNAME(NOW()) AS 月;

# str_to_date: 把日期格式的字符串转换成指定格式的日期 
SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') AS out_put;
# 查询入职日期为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');

# date_format 将日期转换成字符
SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') AS out_put;

# 查询有奖金的员工名和入职日期(xx月/xx日 xx年)
SELECT last_name,DATE_FORMAT(hiredate,'%m月/%d日 %y年') AS 入职日期 FROM employees WHERE commission_pct IS NOT NULL;

//============================================================
# 四、 其他函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER()

//============================================================
# 五、 流程控制函数

# if函数： if else 效果
SELECT IF(10>5,'大','小') AS 结果;
SELECT last_name, commission_pct,IF(commission_pct IS NULL,'没奖金、呵呵','有奖金、嘻嘻') AS 备注 FROM employees;

# case函数
/*
case 变量或者表达式 
when 常量一 then 要显示的值一或者语句一;
when 常量二 then 要显示的值二或者语句二;
...
else 要显示的值n或者语句n;
end
*/

# 案列 查询员工的工资, 要求
-- 部门号=30,显示的工资为1.1倍
-- 部门号=40,显示的工资为1.2倍
-- 部门号=50,显示的工资为1.3倍
-- 部门号=30,显示的工资为1.1倍
-- 第50集04分
SELECT salary AS 原始工资, department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END AS 新工资
FROM employees;

# 案列: 查询员工的工资情况
如果工资>20000,显示为A级别
如果工资>15000,显示为B级别
如果工资>10000,显示为C级别
否则,显示D级别

SELECT salary,
CASE 
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;









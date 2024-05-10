# save as query.sql
USE compbiol
SELECT a.function, e.expr_value 
FROM annotation AS a LEFT JOIN expression AS e ON a.gene = e.gene 
WHERE e.expr_value < 5000;

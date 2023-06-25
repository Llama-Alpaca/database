    -- 4) 	查找相似的理财产品

--   请用一条SQL语句实现该查询：
SELECT D.pro_pif_id as pro_pif_id,count(*) as cc,dense_rank() over(order by count(E.pro_c_id)  DESC) as prank
FROM ( 
    SELECT B.pro_pif_id as pro_pif_id
    FROM property as B
    WHERE EXISTS(
        SELECT *
        FROM (    
            SELECT pro_c_id,dense_rank() over(order by sum(pro_quantity) DESC) as rk 
            FROM property
            WHERE pro_type = 1 and pro_pif_id = 14
            GROUP BY pro_c_id
        ) as  A
        WHERE A.rk <= 3 and A.pro_c_id = B.pro_c_id
    ) and B.pro_type = 1 and B.pro_pif_id != 14
) as D
JOIN (
    SELECT *
    FROM property
    WHERE pro_type = 1 and pro_pif_id != 14
) as E 
USING (pro_pif_id)
GROUP BY D.pro_pif_id
ORDER BY D.pro_pif_id;
/*  end  of  your code  */
 -- 6) 查找相似的理财客户
--   请用一条SQL语句实现该查询：
SELECT * FROM(
    SELECT * ,rank() over(partition by pac order by common desc,pbc ) as crank
    from(
        SELECT DISTINCT A.pro_c_id as pac,C.pro_c_id as pbc,count(C.pro_c_id) as common
        FROM property as A 
        JOIN (
            SELECT DISTINCT B.pro_c_id as pro_c_id, B.pro_pif_id as pro_pif_id
            FROM property as B 
            WHERE  B.pro_type=1
        )  as C on A.pro_c_id != C.pro_c_id and A.pro_pif_id = C.pro_pif_id
        where A.pro_type = 1 
        group by A.pro_c_id , C.pro_c_id
    ) as tmp1
) as tmp2
where crank<3;
/*  end  of  your code  */
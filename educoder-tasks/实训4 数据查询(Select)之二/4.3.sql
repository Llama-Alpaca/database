   -- 3) 查询购买了所有畅销理财产品的客户
--   请用一条SQL语句实现该查询：
select distinct a.pro_c_id  as pro_c_id
from property a
where not exists (
    select *
    from (
        select pro_pif_id
        from property 
        where pro_type = 1
        group by pro_pif_id 
        having count(pro_c_id) > 2
    ) as b 
    where not exists (
        select *
        from property c
        where a.pro_c_id = c.pro_c_id and b.pro_pif_id = c.pro_pif_id and c.pro_type = 1
    )
)
order by a.pro_c_id;
/*  end  of  your code  */
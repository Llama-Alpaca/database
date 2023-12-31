-- 10) 查询当前总的可用资产收益(被冻结的资产除外)前三名的客户的名称、身份证号及其总收益，按收益降序输出，总收益命名为total_income。不考虑并列排名情形。
--    请用一条SQL语句实现该查询：
select c_name, c_id_card, sum(pro.pro_income) as total_income
from client, (
    select pro_c_id, pro_income
    from property
    where pro_status = '可用'
) as pro
where c_id = pro.pro_c_id
group by pro.pro_c_id
order by total_income desc
limit 3
/*  end  of  your code  */ 
insert into zzg_cwsj_sbsl
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'改造' AS 'model',
	t.`name` as 'shoptype',
	'饮水机' AS 'machinetype',
	'dateday' rq,
	count( * ) sbs 
FROM
	t_machine m
	LEFT JOIN t_machine_type type ON m.parenttypeid = type.machinetypeid
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	LEFT JOIN t_operator p ON s.operatorid = p.id 
WHERE
	m.machinestate <> 9 
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) <= 'dateday' 
	AND t.NAME IN ( '流动人口社区', '工厂', '学校', '公寓' ) 
	AND type.machinetypename = '饮水机' 
	AND p.username NOT IN ( '17306893701', '企鹅科技' ) 
GROUP BY
	t.`name` UNION ALL
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'改造' AS 'model',
	'其他' as `shoptype`,
	'饮水机' AS 'machinetype',
	'dateday' rq,
	count( * ) sbs 
FROM
	t_machine m
	LEFT JOIN t_machine_type type ON m.parenttypeid = type.machinetypeid
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	LEFT JOIN t_operator p ON s.operatorid = p.id 
WHERE
	m.machinestate <> 9 
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) <= 'dateday' 
	AND t.NAME NOT IN ( '流动人口社区', '工厂', '学校', '公寓' ) 
	AND type.machinetypename = '饮水机' 
	AND p.username NOT IN ( '17306893701', '企鹅科技' );
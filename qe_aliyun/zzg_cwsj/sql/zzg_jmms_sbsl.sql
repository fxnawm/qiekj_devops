insert into zzg_jmms_sbsl
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'dateday' rq,
	'其他' AS 'name',
	count(*) zssb
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	left join t_operator p on s.operatorid=p.id
	left join t_machine m1 on m.machineid=m1.machineid
WHERE
	m.machinestate <> 9
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) <= 'dateday'
	AND t.NAME NOT IN ( '学校', '流动人口社区', '工厂', '公寓' )
	and p.username='17306893701'
	and m1.parenttypeid in ('c9892cb4-bd78-40f6-83c2-ba73383b090a','4a245cde-538b-47d8-aa35-dd4a28c0e901','4eeb1b0a-d006-49cc-bf17-73c20599057b')

UNION ALL

SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'dateday' rq,
	t.NAME,
	count(*) zssb
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	left join t_operator p on s.operatorid=p.id
	left join t_machine m1 on m.machineid=m1.machineid
WHERE
	m.machinestate <> 9
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) <= 'dateday'
	AND t.NAME IN ( '学校', '流动人口社区', '工厂', '公寓' )
	and p.username='17306893701'
	and m1.parenttypeid in ('c9892cb4-bd78-40f6-83c2-ba73383b090a','4a245cde-538b-47d8-aa35-dd4a28c0e901','4eeb1b0a-d006-49cc-bf17-73c20599057b')
GROUP BY
	t.NAME;
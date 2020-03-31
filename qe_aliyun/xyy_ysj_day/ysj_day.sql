SELECT
	a.sj,
	a.shopname,
	ifnull(b.zdds,0) zdds,
	ifnull(round( b.zdds / b.yddysjsbs, 4 ),0) tjcs,
	a.ysjsbs,
	ifnull(b.yddysjsbs,0) yddysjsbs
FROM
	(
SELECT
	s.shopname,
	date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) sj,
	count( * ) ysjsbs 
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.shopid = s.shopid 
WHERE
	m.machinestate <> 9 
	AND s.shopname IN ( '南开大学八里台校区', '天津农学院', '新东方烹饪学校1', '红春藤技工学校沙坪坝校区', '台州学院椒江校区开水机', '黑河学院' ) 
	AND s.shopstate <> 4 
	AND m.parenttypeid = '4eeb1b0a-d006-49cc-bf17-73c20599057e' 
	and DATE_FORMAT( m.createtime, '%Y-%m-%d' ) <= date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) 
GROUP BY
	s.shopname,
	sj 
	) a
	LEFT JOIN (
SELECT
	s.shopname,
	count( * ) zdds,
	count( DISTINCT o.userid ) zyhs,
	count( DISTINCT o.machineid ) yddysjsbs 
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
	LEFT JOIN t_machine m ON o.machineid = m.machineid 
WHERE
	o.orderstatus = 2 
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) 
	AND s.shopname IN ( '南开大学八里台校区', '天津农学院', '新东方烹饪学校1', '红春藤技工学校沙坪坝校区', '台州学院椒江校区开水机', '黑河学院' ) 
	AND s.shopstate <> 4 
	AND m.parenttypeid = '4eeb1b0a-d006-49cc-bf17-73c20599057e' 
GROUP BY
	s.shopname 
	) b ON a.shopname = b.shopname order by a.shopname
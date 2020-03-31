SELECT
	b.sj,
	b.shopname,
	b.zdds,
	b.zyhs,
	b.xyyds,
	round( b.xyyds / b.zdds, 4 ) bl
FROM
	(
SELECT
	s.shopname,
	date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) sj,
	count( * ) zdds,
	(
SELECT
	count( * )
FROM
	t_order d
WHERE
	d.shopid = o.shopid
	AND d.orderstatus = 2
	AND DATE_FORMAT( d.createtime, '%Y-%m-%d' ) = date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' )
	AND d.addprice IS NOT NULL
	) xyyds,
	count( DISTINCT o.userid ) zyhs
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
	LEFT JOIN t_machine m ON o.machineid = m.machineid
WHERE
	o.orderstatus = 2
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' )
	AND s.shopname IN ( '杭州益乐新村北四区35号企鹅共享', '洗50-南理工南区' )
	and m.is_open_detergent=1
GROUP BY
	s.shopname,
	sj,
	xyyds
	) b order by b.shopname
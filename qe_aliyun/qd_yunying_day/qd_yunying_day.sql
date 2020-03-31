insert into qd_yunying_day (`id`,`rq`,`areaname`,`shopname`,`total_sbs`,`total_xyjsbs`,`total_hgjsbs`,`total_amysbs`,`day_yhs`,`day_dds`,`day_je`,`day_xyjdds`,`day_hgjdds`,`day_amydds`,`day_xyjje`,`day_hgjje`,`day_amyje`,`sstday_yhs`,`lstday_yhs`,`sstday_vipyhs`,`vip_yhs`,`day_vip_dds`,`day_vip_je`,`day_vip_xyjdds`,`day_vip_hgjdds`,`day_vip_amydds`,`day_vip_xyjje`,`day_vip_hgjje`,`day_vip_amyje`,`xkyh`,`total_yhs`,`total_dds`,`total_je`,`new_yhs`,`new_dds`,`new_je`,`day_sell_vipsl`,`day_return_vipsl`,`day_sell_vipje`,`total_vip_yhs`) SELECT
CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
'dateday' rq,
a.areaname,
a.shopname,
ifnull( a.total_sbs, 0 ) total_sbs,
ifnull( a.total_xyjsbs, 0 ) total_xyjsbs,
ifnull( a.total_hgjsbs, 0 ) total_hgjsbs,
ifnull( a.total_amysbs, 0 ) total_amysbs,
ifnull( b.day_yhs, 0 ) day_yhs,
ifnull( b.day_dds, 0 ) day_dds,
ifnull( b.day_je, 0 ) day_je,
ifnull( b.day_xyjdds, 0 ) day_xyjdds,
ifnull( b.day_hgjdds, 0 ) day_hgjdds,
ifnull( b.day_amydds, 0 ) day_amydds,
ifnull( b.day_xyjje, 0 ) day_xyjje,
ifnull( b.day_hgjje, 0 ) day_hgjje,
ifnull( b.day_amyje, 0 ) day_amyje,
ifnull( c.sstday_yhs, 0 ) sstday_yhs,
ifnull( d.lstday_yhs, 0 ) lstday_yhs,
ifnull( d1.sstday_vipyhs, 0 ) sstday_vipyhs,
ifnull( e.vip_yhs, 0 ) vip_yhs,
ifnull( f.day_vip_dds, 0 ) day_vip_dds,
ifnull( f.day_vip_je, 0 ) day_vip_je,
ifnull( f.day_vip_xyjdds, 0 ) day_vip_xyjdds,
ifnull( f.day_vip_hgjdds, 0 ) day_vip_hgjdds,
ifnull( f.day_vip_amydds, 0 ) day_vip_amydds,
ifnull( f.day_vip_xyjje, 0 ) day_vip_xyjje,
ifnull( f.day_vip_hgjje, 0 ) day_vip_hgjje,
ifnull( f.day_vip_amyje, 0 ) day_vip_amyje,
ifnull( g.xkyh, 0 ) xkyh,
ifnull( h.total_yhs, 0 ) total_yhs,
ifnull( h.total_dds, 0 ) total_dds,
ifnull( h.total_je, 0 ) total_je,
ifnull( i.new_yhs, 0 ) new_yhs,
ifnull( i.new_dds, 0 ) new_dds,
ifnull( i.new_je, 0 ) new_je,
ifnull( j.day_sell_vipsl, 0 ) day_sell_vipsl,
ifnull( j.day_return_vipsl, 0 ) day_return_vipsl,
ifnull( j.day_sell_vipje, 0 ) day_sell_vipje,
ifnull( k.total_vip_yhs, 0 ) total_vip_yhs
FROM
	(
SELECT
	t.areaname,
	s.shopid,
	s.shopname,
	count( * ) total_sbs,
	sum( CASE m.parenttypeid WHEN 'c9892cb4-bd78-40f6-83c2-ba73383b090a' THEN 1 ELSE 0 END ) total_xyjsbs,
	sum( CASE m.parenttypeid WHEN '4a245cde-538b-47d8-aa35-dd4a28c0e901' THEN 1 ELSE 0 END ) total_hgjsbs,
	sum( CASE m.parenttypeid WHEN '430009623810933477' THEN 1 ELSE 0 END ) total_amysbs
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_area t ON s.cityid = t.areaid
WHERE
	m.machinestate <> 9
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( m.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	t.areaname,
	s.shopid,
	s.shopname
	) a
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) day_yhs,
	count( * ) day_dds,
	ROUND( sum( o.payprice ), 2 ) day_je,
	sum( CASE m.parenttypeid WHEN 'c9892cb4-bd78-40f6-83c2-ba73383b090a' THEN 1 ELSE 0 END ) day_xyjdds,
	sum( CASE m.parenttypeid WHEN '4a245cde-538b-47d8-aa35-dd4a28c0e901' THEN 1 ELSE 0 END ) day_hgjdds,
	sum( CASE m.parenttypeid WHEN '430009623810933477' THEN 1 ELSE 0 END ) day_amydds,
	round( sum( CASE m.parenttypeid WHEN 'c9892cb4-bd78-40f6-83c2-ba73383b090a' THEN o.payprice ELSE 0 END ), 2 ) day_xyjje,
	round( sum( CASE m.parenttypeid WHEN '4a245cde-538b-47d8-aa35-dd4a28c0e901' THEN o.payprice ELSE 0 END ), 2 ) day_hgjje,
	round( sum( CASE m.parenttypeid WHEN '430009623810933477' THEN o.payprice ELSE 0 END ), 2 ) day_amyje
FROM
	t_order o
	LEFT JOIN t_machine m ON o.machineid = m.machineid
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
GROUP BY
	s.shopid
	) b ON a.shopid = b.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) sstday_yhs
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) >= DATE_SUB( 'dateday', INTERVAL 29 DAY )
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) c ON a.shopid = c.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) lstday_yhs
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) >= DATE_SUB( 'dateday', INTERVAL 59 DAY )
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) d ON a.shopid = d.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) sstday_vipyhs
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.discounttype = 1
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) >= DATE_SUB( 'dateday', INTERVAL 29 DAY )
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) d1 ON a.shopid = d1.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT m.memberid ) vip_yhs
FROM
	t_membervipcard m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
WHERE
	s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND m.ishidden = 0
	AND m.is_buy_shop = 1
	AND DATE_FORMAT( m.availabletime, '%Y-%m-%d' ) >= 'dateday'
	AND DATE_FORMAT( m.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) e ON a.shopid = e.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( * ) day_vip_dds,
	ROUND( sum( o.payprice ), 2 ) day_vip_je,
	sum( CASE m.parenttypeid WHEN 'c9892cb4-bd78-40f6-83c2-ba73383b090a' THEN 1 ELSE 0 END ) day_vip_xyjdds,
	sum( CASE m.parenttypeid WHEN '4a245cde-538b-47d8-aa35-dd4a28c0e901' THEN 1 ELSE 0 END ) day_vip_hgjdds,
	sum( CASE m.parenttypeid WHEN '430009623810933477' THEN 1 ELSE 0 END ) day_vip_amydds,
	round( sum( CASE m.parenttypeid WHEN 'c9892cb4-bd78-40f6-83c2-ba73383b090a' THEN o.payprice ELSE 0 END ), 2 ) day_vip_xyjje,
	round( sum( CASE m.parenttypeid WHEN '4a245cde-538b-47d8-aa35-dd4a28c0e901' THEN o.payprice ELSE 0 END ), 2 ) day_vip_hgjje,
	round( sum( CASE m.parenttypeid WHEN '430009623810933477' THEN o.payprice ELSE 0 END ), 2 ) day_vip_amyje
FROM
	t_order o
	LEFT JOIN t_machine m ON o.machineid = m.machineid
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND o.discounttype = 1
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
GROUP BY
	s.shopid
	) f ON a.shopid = f.shopid
	LEFT JOIN (
SELECT
	g1.shopid,
	count( DISTINCT g1.memberid ) xkyh
FROM
	(
SELECT
	s.shopid,
	m.memberid,
	count( * ) vipyhs
FROM
	t_membervipcard m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
WHERE
	s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND m.ishidden = 0
	AND m.is_buy_shop = 1
GROUP BY
	s.shopid,
	m.memberid
HAVING
	vipyhs > 1
	) g1
GROUP BY
	g1.shopid
	) g ON a.shopid = g.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) total_yhs,
	count( * ) total_dds,
	ROUND( sum( o.payprice ), 2 ) total_je
FROM
	t_order o
	LEFT JOIN t_member m ON o.userid = m.id
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) h ON a.shopid = h.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) new_yhs,
	count( * ) new_dds,
	ROUND( sum( o.payprice ), 2 ) new_je
FROM
	t_order o
	LEFT JOIN t_member m ON o.userid = m.id
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
	AND DATE_FORMAT( m.registertime, '%Y-%m-%d' ) = 'dateday'
GROUP BY
	s.shopid
	) i ON a.shopid = i.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	sum( CASE o.order_status WHEN 2 THEN 1 ELSE 0 END ) day_sell_vipsl,
	sum( CASE o.order_status WHEN 5 THEN 1 ELSE 0 END ) day_return_vipsl,
	round( sum( CASE o.order_status WHEN 2 THEN o.pay_price ELSE 0 END ), 2 ) day_sell_vipje
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND DATE_FORMAT( o.create_time, '%Y-%m-%d' ) = 'dateday'
GROUP BY
	s.shopid
	) j ON a.shopid = j.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) total_vip_yhs
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.order_status IN ( 2, 5 )
	AND DATE_FORMAT( o.create_time, '%Y-%m-%d' ) <= 'dateday'
GROUP BY
	s.shopid
	) k ON a.shopid = k.shopid;
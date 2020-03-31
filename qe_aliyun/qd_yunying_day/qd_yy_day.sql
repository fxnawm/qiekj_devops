insert into qd_yy_day
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'dateday' rq,
  a.shopid,
  a.shopname,
	b.total_sbs,
	a.day_dds,
	a.day_je,
	a1.day_xyjdds,
	a2.day_hgjdds,
	a3.day_amydds,
	a1.day_xyjje,
	a2.day_hgjje,
	a3.day_amyje,
	c.vip_yhs,
	e.new_yhs,
	d.total_yhs,
	f.day_sell_vipsl,
	f.day_sell_vipje,
	a4.back_day_dds,
	a4.back_day_je
FROM
  (
SELECT
  s.shopid,
  s.shopname,
  count( * ) day_dds,
  round(sum(payprice),2) day_je
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus = 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
  s.shopid,
  s.shopname
  ) a
  LEFT JOIN (
SELECT
  s.shopid,
  s.shopname,
  count( * ) total_sbs
FROM
  t_machine m
  LEFT JOIN t_shop s ON m.shopid = s.shopid
WHERE
  m.machinestate <> 9
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
  s.shopid,
  s.shopname
  ) b ON a.shopid = b.shopid
  LEFT JOIN (
SELECT
  s.shopid,
  s.shopname,
  count( DISTINCT m.memberid ) vip_yhs
FROM
  t_membervipcard m
  LEFT JOIN t_shop s ON m.shopid = s.shopid
WHERE
  s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
  AND m.ishidden = 0
  AND m.is_buy_shop = 1
  AND date_format(m.availabletime,'%Y-%m-%d') >= 'dateday'
	AND date_format(m.createtime,'%Y-%m-%d') <= 'dateday'
GROUP BY
  s.shopid,
  s.shopname
  ) c ON a.shopid = c.shopid
  LEFT JOIN (
SELECT
  s.shopid,
  s.shopname,
  count( DISTINCT o.userid ) total_yhs
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
  o.orderstatus >= 2 AND DATE_FORMAT(o.createtime,'%Y-%m-%d') <= 'dateday'
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
  s.shopid,
  s.shopname
  ) d ON a.shopid = d.shopid
  LEFT JOIN (
SELECT
  s.shopid,
  s.shopname,
  count( DISTINCT userid ) new_yhs
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus >= 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
  AND o.userid IN ( SELECT id FROM t_member WHERE DATE_FORMAT( registertime, '%Y-%m-%d' ) = 'dateday' )
GROUP BY
  s.shopid,
  s.shopname
  ) e ON a.shopid = e.shopid
  LEFT JOIN (
SELECT
  s.shopid,
  s.shopname,
  count( o.user_id ) day_sell_vipsl,
  sum(o.pay_price) day_sell_vipje
FROM
  vip_order o
  LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
  DATE_FORMAT( o.create_time, '%Y-%m-%d' ) = 'dateday'
  AND o.order_status = 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
  s.shopid,
  s.shopname
  ) f ON a.shopid = f.shopid
  left join (SELECT
  s.shopid,
  s.shopname,
  count( * ) day_xyjdds,
  sum(payprice) day_xyjje
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
  left join t_machine m on o.machineid=m.machineid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus = 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
  and m.parenttypeid='c9892cb4-bd78-40f6-83c2-ba73383b090a'
GROUP BY
  s.shopid,
  s.shopname
  ) a1 on a.shopid=a1.shopid
  left join (SELECT
  s.shopid,
  s.shopname,
  count( * ) day_hgjdds,
  sum(payprice) day_hgjje
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
  left join t_machine m on o.machineid=m.machineid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus = 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
  and m.parenttypeid='4a245cde-538b-47d8-aa35-dd4a28c0e901'
GROUP BY
  s.shopid,
  s.shopname
  ) a2 on a.shopid=a2.shopid
    left join (SELECT
  s.shopid,
  s.shopname,
  count( * ) day_amydds,
  sum(payprice) day_amyje
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
  left join t_machine m on o.machineid=m.machineid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus = 2
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
  and m.parenttypeid='430009623810933477'
GROUP BY
  s.shopid,
  s.shopname
  ) a3 on a.shopid=a3.shopid
	left join  (
SELECT
  s.shopid,
  s.shopname,
  count( * ) back_day_dds,
  sum(payprice ) back_day_je
FROM
  t_order o
  LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
  DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
  AND o.orderstatus = 5
  AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
  s.shopid,
  s.shopname
  ) a4 on a.shopid=a4.shopid
insert into qd_vip_day
SELECT
CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
'dateday' rq,
a.shopid,
a.shopname,
b.xzvip,
c.xzyh,
d.lvip,
e.novip,
f.xzvipall,
g.novipall
FROM
	( SELECT shopid, shopname FROM t_shop WHERE shopstate<>4 and operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4' ) a
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) xzvip
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	DATE_FORMAT( o.create_time, '%Y-%m-%d' ) = 'dateday'
	AND o.order_status = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.user_id IN ( SELECT id FROM t_member WHERE DATE_FORMAT( registertime, '%Y-%m-%d' ) = 'dateday' )
GROUP BY
	s.shopid
	) b ON a.shopid = b.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT userid ) xzyh
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
	AND o.orderstatus >= 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.userid IN ( SELECT id FROM t_member WHERE DATE_FORMAT( registertime, '%Y-%m-%d' ) = 'dateday' )
GROUP BY
	s.shopid
	) c ON a.shopid = c.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) lvip
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	DATE_FORMAT( o.create_time, '%Y-%m-%d' ) = 'dateday'
	AND o.order_status = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.user_id NOT IN ( SELECT id FROM t_member WHERE DATE_FORMAT( registertime, '%Y-%m-%d' ) = 'dateday' )
GROUP BY
	s.shopid
	) d ON a.shopid = d.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) novip
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	o.orderstatus >= 2 and DATE_FORMAT(o.createtime,'%Y-%m-%d') <= 'dateday'
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.userid NOT IN ( SELECT id FROM t_member WHERE DATE_FORMAT( registertime, '%Y-%m-%d' ) = 'dateday' )
	AND o.userid NOT IN ( SELECT memberid FROM t_membervipcard WHERE is_buy_shop = 1 AND operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4' AND ishidden = 0 AND DATE_FORMAT(availabletime,'%Y-%m-%d') >= 'dateday' and DATE_FORMAT(createtime,'%Y-%m-%d') <= 'dateday' )
GROUP BY
	s.shopid
	) e ON a.shopid = e.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) xzvipall
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	DATE_FORMAT( o.create_time, '%Y-%m-%d' ) = 'dateday'
	AND o.order_status = 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
	s.shopid
	) f ON a.shopid = f.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) novipall
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	DATE_FORMAT( o.createtime, '%Y-%m-%d' ) <= 'dateday'
	AND o.orderstatus >= 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.userid NOT IN ( SELECT memberid FROM t_membervipcard WHERE is_buy_shop = 1 AND operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4' AND ishidden = 0 AND DATE_FORMAT(availabletime,'%Y-%m-%d') >= 'dateday' and DATE_FORMAT(createtime,'%Y-%m-%d') <= 'dateday' )
GROUP BY
	s.shopid
	) g ON a.shopid = g.shopid
where b.xzvip is not null or c.xzyh is not null or d.lvip is not null or e.novip is not null or  f.xzvipall is not null or g.novipall is not null;
insert into qd_vip_newday
SELECT
CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
'dateday' rq,
a.shopid,
a.shopname,
h.day_novip,
i.total_vip,
j.yx_vip,
b.newyh_vip,
c.newyh,
d.oldyh_vip,
e.novip_oldyh,
f.new_vip,
g.total_novip
FROM
	( SELECT shopid, shopname FROM t_shop WHERE shopstate<>4 and operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4' ) a
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) newyh_vip
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
	count( DISTINCT userid ) newyh
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
	count( DISTINCT o.user_id ) oldyh_vip
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
	count( DISTINCT o.userid ) novip_oldyh
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
	count( DISTINCT o.user_id ) new_vip
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
	count( DISTINCT o.userid ) total_novip
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
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.userid ) day_novip
FROM
	t_order o
	LEFT JOIN t_shop s ON o.shopid = s.shopid
WHERE
	DATE_FORMAT( o.createtime, '%Y-%m-%d' ) = 'dateday'
	AND o.orderstatus >= 2
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND o.userid NOT IN ( SELECT memberid FROM t_membervipcard WHERE is_buy_shop = 1 AND operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4' AND ishidden = 0 AND DATE_FORMAT(availabletime,'%Y-%m-%d') >= 'dateday' and DATE_FORMAT(createtime,'%Y-%m-%d') <= 'dateday' )
GROUP BY
	s.shopid
	) h ON a.shopid = h.shopid
	LEFT JOIN (
SELECT
	s.shopid,
	count( DISTINCT o.user_id ) total_vip
FROM
	vip_order o
	LEFT JOIN t_shop s ON o.shop_id = s.shopid
WHERE
	DATE_FORMAT( o.create_time, '%Y-%m-%d' ) <= 'dateday'
	AND o.order_status in (2,5)
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
GROUP BY
	s.shopid
	) i ON a.shopid = i.shopid
	LEFT JOIN (
	SELECT s.shopid,count(distinct m.memberid) yx_vip FROM
	t_membervipcard m
	left join t_shop s on m.shopid=s.shopid
	WHERE
	m.is_buy_shop = 1
	AND s.operatorid = 'cdca0be3-bd6e-4e41-9fb9-325da86c69f4'
	AND m.ishidden = 0
	AND DATE_FORMAT( m.availabletime, '%Y-%m-%d' ) >= 'dateday'
	AND DATE_FORMAT( m.createtime, '%Y-%m-%d' ) <= 'dateday'
	group by s.shopid
	) j ON a.shopid = j.shopid
where b.newyh_vip is not null or c.newyh is not null or d.oldyh_vip is not null or e.novip_oldyh is not null or  f.new_vip is not null or g.total_novip is not null or h.day_novip is not null or i.total_vip is not null  or j.yx_vip is not null
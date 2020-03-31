SELECT
	date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) sj,
	pro.AREANAME sheng,
	count( * ) sl 
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.ShopId = s.SHOPID
	LEFT JOIN t_area pro ON s.PROVINCEID = pro.AREAID 
WHERE
	m.MACHINESTATE <> 9 
	AND DATE_FORMAT( m.createtime, '%Y-%m-%d' ) = date_format( DATE_SUB( now( ), INTERVAL 1 DAY ), '%Y-%m-%d' ) 
	and m.imei not in (select imei from dkh_imei)
GROUP BY
	sj,
	pro.areaname
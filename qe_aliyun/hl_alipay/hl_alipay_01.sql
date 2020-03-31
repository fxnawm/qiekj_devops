insert into temp_alipay_01 (ddrq,machineid,typename,machinename,sbrq,zfbdds)
SELECT
	DATE_FORMAT( o.createtime, '%Y-%m' ) ddrq,
	m.machineid,
	t.machinetypename,
	m.machinename,
	DATE_FORMAT( m.createtime, '%Y-%m-%d' ) sbrq,
	count( * ) zfbdds
FROM
	t_order o
	LEFT JOIN t_machine m ON o.machineid = m.machineid
	LEFT JOIN t_machine_type t ON m.parenttypeid = t.machinetypeid
WHERE
	o.createtime > m.createtime
	AND o.createtime < '2020-03-01' AND o.orderstatus = 2
	AND o.paytype LIKE '1%'
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) = 'datestart'
GROUP BY
	ddrq,
	m.machineid,
	t.machinetypename,
	m.machinename,
	sbrq
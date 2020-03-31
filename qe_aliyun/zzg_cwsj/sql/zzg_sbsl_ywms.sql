insert into zzg_sbsl_ywms
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'dateday' rq,
	sum( a.sbs ) zsbs,
	max( CASE a.username WHEN '企鹅科技' THEN a.sbs ELSE 0 END ) lyd_sbs,
	max( CASE a.username WHEN '17306893701' THEN a.sbs ELSE 0 END ) jmd_sbs
FROM
	(
SELECT
	p.username,
	count( * ) sbs
FROM
	t_machine m
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_operator p ON s.operatorid = p.id
WHERE
	m.machinestate <> 9
	AND m.parenttypeid in ('c9892cb4-bd78-40f6-83c2-ba73383b090a','4a245cde-538b-47d8-aa35-dd4a28c0e901','4eeb1b0a-d006-49cc-bf17-73c20599057b')
	AND DATE_FORMAT( m.createtime, '%Y-%m' ) <= 'dateday'
GROUP BY
	p.username
	) a
GROUP BY
	rq;
UPDATE t_machine_work
SET STATUS = 1
WHERE
	id IN (SELECT	id FROM	(SELECT	a.id FROM
	t_machine_work AS a
	LEFT JOIN t_machine AS b ON a.MachineId = b.MACHINEID
WHERE
	a.`status` = 0
	AND (
CASE
	b.SUBTYPEID
	WHEN '393045714776621844' THEN
	TIMESTAMPDIFF( SECOND, a.StartTime, now( ) )
	WHEN '363364141383024643' THEN
	TIMESTAMPDIFF( SECOND, a.StartTime, now( ) ) ELSE TIMESTAMPDIFF( MINUTE, a.StartTime, now( ) )
END
	) >= a.DurationMinutes 	) c );
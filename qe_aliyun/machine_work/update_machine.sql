update 	t_machine m  set m.MACHINESTATE=1
WHERE
	m.machinestate = 2
	AND NOT EXISTS ( SELECT 1 FROM t_machine_work w WHERE w.STATUS = 0 AND m.machineid = w.machineid ) ;
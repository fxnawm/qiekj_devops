SELECT
	rq,
	total_operator,
	new_operator,
	ROUND(new_operator/(total_operator - new_operator),4) operator_zzl,
	total_shop,
	new_shop,
	ROUND(new_shop/(total_shop - new_shop),4) shop_zzl,
	total_machine,
	school_xyj_machine,
	school_xyj_zdxs,
	ROUND(school_xyj_zdxs/school_xyj_machine,4) school_xyj_zdxl,
	school_xyj_bzdds,
	school_xyj_bzxzdds,
	ROUND(school_xyj_bzxzdds/(school_xyj_bzdds - school_xyj_bzxzdds),4) school_xyj_ddzzl,
	ROUND(school_xyj_bzdds/7) school_xyj_bzrjdds,
	truncate(ROUND(school_xyj_bzxzdds/7),0) school_xyj_bzrjxzdds,
	ROUND((ROUND(school_xyj_bzxzdds/7))/(ROUND(school_xyj_bzdds/7) - ROUND(school_xyj_bzxzdds/7)),4) school_xyj_bzrjddzzl,
	school_hgj_machine,
	school_hgj_zdxs,
	ROUND(school_hgj_zdxs/school_hgj_machine,4) school_hgj_zdxl,
	school_hgj_bzdds,
	school_hgj_bzxzdds,
	ROUND(school_hgj_bzxzdds/(school_hgj_bzdds - school_hgj_bzxzdds),4) school_hgj_ddzzl,
	ROUND(school_hgj_bzdds/7) school_hgj_bzrjdds,
	ROUND(school_hgj_bzxzdds/7) school_hgj_bzrjxzdds,
	ROUND((ROUND(school_hgj_bzxzdds/7))/(ROUND(school_hgj_bzdds/7) - ROUND(school_hgj_bzxzdds/7)),4) school_hgj_bzrjddzzl,
	school_cfj_machine,
  school_cfj_zdxs,
  ROUND(school_cfj_zdxs/school_cfj_machine,4) school_cfj_zdxl,
  school_cfj_bzdds,
  school_cfj_bzxzdds,
  ROUND(school_cfj_bzxzdds/(school_cfj_bzdds - school_cfj_bzxzdds),4) school_cfj_ddzzl,
  ROUND(school_cfj_bzdds/7) school_cfj_bzrjdds,
  ROUND(school_cfj_bzxzdds/7) school_cfj_bzrjxzdds,
  ROUND((ROUND(school_cfj_bzxzdds/7))/(ROUND(school_cfj_bzdds/7) - ROUND(school_cfj_bzxzdds/7)),4) school_cfj_bzrjddzzl,
	school_xxj_machine,
	school_xxj_zdxs,
	ROUND(school_xxj_zdxs/school_xxj_machine,4) school_xxj_zdxl,
	school_xxj_bzdds,
	school_xxj_bzxzdds,
	ROUND(school_xxj_bzxzdds/(school_xxj_bzdds - school_xxj_bzxzdds),4) school_xxj_ddzzl,
	ROUND(school_xxj_bzdds/7) school_xxj_bzrjdds,
	ROUND(school_xxj_bzxzdds/7) school_xxj_bzrjxzdds,
	ROUND((ROUND(school_xxj_bzxzdds/7))/(ROUND(school_xxj_bzdds/7) - ROUND(school_xxj_bzxzdds/7)),4) school_xxj_bzrjddzzl, 
	school_ysj_machine,
	school_ysj_zdxs,
	ROUND(school_ysj_zdxs/school_ysj_machine,4) school_ysj_zdxl,
	school_ysj_bzdds,
	school_ysj_bzxzdds,
	ROUND(school_ysj_bzxzdds/(school_ysj_bzdds - school_ysj_bzxzdds),4) school_ysj_ddzzl,
	ROUND(school_ysj_bzdds/7) school_ysj_bzrjdds,
	ROUND(school_ysj_bzxzdds/7) school_ysj_bzrjxzdds,
	ROUND((ROUND(school_ysj_bzxzdds/7))/(ROUND(school_ysj_bzdds/7) - ROUND(school_ysj_bzxzdds/7)),4) school_ysj_bzrjddzzl,
	shequ_xyj_machine,
	shequ_xyj_zdxs,
	ROUND(shequ_xyj_zdxs/shequ_xyj_machine,4) shequ_xyj_zdxl,
	shequ_xyj_bzdds,
	shequ_xyj_bzxzdds,
	ROUND(shequ_xyj_bzxzdds/(shequ_xyj_bzdds - shequ_xyj_bzxzdds),4) shequ_xyj_ddzzl,
	ROUND(shequ_xyj_bzdds/7) shequ_xyj_bzrjdds,
	ROUND(shequ_xyj_bzxzdds/7) shequ_xyj_bzrjxzdds,
	ROUND((ROUND(shequ_xyj_bzxzdds/7))/(ROUND(shequ_xyj_bzdds/7) - ROUND(shequ_xyj_bzxzdds/7)),4) shequ_xyj_bzrjddzzl,
	shequ_hgj_machine,
	shequ_hgj_zdxs,
	ROUND(shequ_hgj_zdxs/shequ_hgj_machine,4) shequ_hgj_zdxl,
	shequ_hgj_bzdds,
	shequ_hgj_bzxzdds,
	ROUND(shequ_hgj_bzxzdds/(shequ_hgj_bzdds - shequ_hgj_bzxzdds),4) shequ_hgj_ddzzl,
	ROUND(shequ_hgj_bzdds/7) shequ_hgj_bzrjdds,
	ROUND(shequ_hgj_bzxzdds/7) shequ_hgj_bzrjxzdds,
	ROUND((ROUND(shequ_hgj_bzxzdds/7))/(ROUND(shequ_hgj_bzdds/7) - ROUND(shequ_hgj_bzxzdds/7)),4) shequ_hgj_bzrjddzzl,
	shequ_cfj_machine,
	shequ_cfj_zdxs,
	ROUND(shequ_cfj_zdxs/shequ_cfj_machine,4) shequ_cfj_zdxl,
	shequ_cfj_bzdds,
	shequ_cfj_bzxzdds,
	ROUND(shequ_cfj_bzxzdds/(shequ_cfj_bzdds - shequ_cfj_bzxzdds),4) shequ_cfj_ddzzl,
	ROUND(shequ_cfj_bzdds/7) shequ_cfj_bzrjdds,
	ROUND(shequ_cfj_bzxzdds/7) shequ_cfj_bzrjxzdds,
	ROUND((ROUND(shequ_cfj_bzxzdds/7))/(ROUND(shequ_cfj_bzdds/7) - ROUND(shequ_cfj_bzxzdds/7)),4) shequ_cfj_bzrjddzzl,
	shequ_xxj_machine,
	shequ_xxj_zdxs,
	ROUND(shequ_xxj_zdxs/shequ_xxj_machine,4) shequ_xxj_zdxl,
	shequ_xxj_bzdds,
	shequ_xxj_bzxzdds,
	ROUND(shequ_xxj_bzxzdds/(shequ_xxj_bzdds - shequ_xxj_bzxzdds),4) shequ_xxj_ddzzl,
	ROUND(shequ_xxj_bzdds/7) shequ_xxj_bzrjdds,
	ROUND(shequ_xxj_bzxzdds/7) shequ_xxj_bzrjxzdds,
	ROUND((ROUND(shequ_xxj_bzxzdds/7))/(ROUND(shequ_xxj_bzdds/7) - ROUND(shequ_xxj_bzxzdds/7)),4) shequ_xxj_bzrjddzzl, 
	shequ_ysj_machine,
	shequ_ysj_zdxs,
	ROUND(shequ_ysj_zdxs/shequ_ysj_machine,4) shequ_ysj_zdxl,
	shequ_ysj_bzdds,
	shequ_ysj_bzxzdds,
	ROUND(shequ_ysj_bzxzdds/(shequ_ysj_bzdds - shequ_ysj_bzxzdds),4) shequ_ysj_ddzzl,
	ROUND(shequ_ysj_bzdds/7,2) shequ_ysj_bzrjdds,
	ROUND(shequ_ysj_bzxzdds/7,2) shequ_ysj_bzrjxzdds,
	ROUND((ROUND(shequ_ysj_bzxzdds/7,2))/(ROUND(shequ_ysj_bzdds/7,2) - ROUND(shequ_ysj_bzxzdds/7,2)),4) shequ_ysj_bzrjddzzl,
	gongyu_xyj_machine,
	gongyu_xyj_zdxs,
	ROUND(gongyu_xyj_zdxs/gongyu_xyj_machine,4) gongyu_xyj_zdxl,
	gongyu_xyj_bzdds,
	gongyu_xyj_bzxzdds,
	ROUND(gongyu_xyj_bzxzdds/(gongyu_xyj_bzdds - gongyu_xyj_bzxzdds),4) gongyu_xyj_ddzzl,
	ROUND(gongyu_xyj_bzdds/7) gongyu_xyj_bzrjdds,
	ROUND(gongyu_xyj_bzxzdds/7) gongyu_xyj_bzrjxzdds,
	ROUND((ROUND(gongyu_xyj_bzxzdds/7))/(ROUND(gongyu_xyj_bzdds/7) - ROUND(gongyu_xyj_bzxzdds/7)),4) gongyu_xyj_bzrjddzzl,
	gongyu_hgj_machine,
	gongyu_hgj_zdxs,
	ROUND(gongyu_hgj_zdxs/gongyu_hgj_machine,4) gongyu_hgj_zdxl,
	gongyu_hgj_bzdds,
	gongyu_hgj_bzxzdds,
	ROUND(gongyu_hgj_bzxzdds/(gongyu_hgj_bzdds - gongyu_hgj_bzxzdds),4) gongyu_hgj_ddzzl,
	ROUND(gongyu_hgj_bzdds/7) gongyu_hgj_bzrjdds,
	ROUND(gongyu_hgj_bzxzdds/7) gongyu_hgj_bzrjxzdds,
	ROUND((ROUND(gongyu_hgj_bzxzdds/7))/(ROUND(gongyu_hgj_bzdds/7) - ROUND(gongyu_hgj_bzxzdds/7)),4) gongyu_hgj_bzrjddzzl,
	gongyu_cfj_machine,
	gongyu_cfj_zdxs,
	ROUND(gongyu_cfj_zdxs/gongyu_cfj_machine,4) gongyu_cfj_zdxl,
	gongyu_cfj_bzdds,
	gongyu_cfj_bzxzdds,
	ROUND(gongyu_cfj_bzxzdds/(gongyu_cfj_bzdds - gongyu_cfj_bzxzdds),4) gongyu_cfj_ddzzl,
	ROUND(gongyu_cfj_bzdds/7) gongyu_cfj_bzrjdds,
	ROUND(gongyu_cfj_bzxzdds/7) gongyu_cfj_bzrjxzdds,
	ROUND((ROUND(gongyu_cfj_bzxzdds/7))/(ROUND(gongyu_cfj_bzdds/7) - ROUND(gongyu_cfj_bzxzdds/7)),4) gongyu_cfj_bzrjddzzl,
	gongyu_xxj_machine,
	gongyu_xxj_zdxs,
	ROUND(gongyu_xxj_zdxs/gongyu_xxj_machine,4) gongyu_xxj_zdxl,
	gongyu_xxj_bzdds,
	gongyu_xxj_bzxzdds,
	ROUND(gongyu_xxj_bzxzdds/(gongyu_xxj_bzdds - gongyu_xxj_bzxzdds),4) gongyu_xxj_ddzzl,
	ROUND(gongyu_xxj_bzdds/7) gongyu_xxj_bzrjdds,
	ROUND(gongyu_xxj_bzxzdds/7) gongyu_xxj_bzrjxzdds,
	ROUND((ROUND(gongyu_xxj_bzxzdds/7))/(ROUND(gongyu_xxj_bzdds/7) - ROUND(gongyu_xxj_bzxzdds/7)),4) gongyu_xxj_bzrjddzzl,
	gongyu_ysj_machine,
	gongyu_ysj_zdxs,
	ROUND(gongyu_ysj_zdxs/gongyu_ysj_machine,4) gongyu_ysj_zdxl,
	gongyu_ysj_bzdds,
	gongyu_ysj_bzxzdds,
	ROUND(gongyu_ysj_bzxzdds/(gongyu_ysj_bzdds - gongyu_ysj_bzxzdds),4) gongyu_ysj_ddzzl,
	ROUND(gongyu_ysj_bzdds/7) gongyu_ysj_bzrjdds,
	ROUND(gongyu_ysj_bzxzdds/7) gongyu_ysj_bzrjxzdds,
	ROUND((ROUND(gongyu_ysj_bzxzdds/7))/(ROUND(gongyu_ysj_bzdds/7) - ROUND(gongyu_ysj_bzxzdds/7)),4) gongyu_ysj_bzrjddzzl,
	gongchang_xyj_machine,
	gongchang_xyj_zdxs,
	ROUND(gongchang_xyj_zdxs/gongchang_xyj_machine,4) gongchang_xyj_zdxl,
	gongchang_xyj_bzdds,
	gongchang_xyj_bzxzdds,
	ROUND(gongchang_xyj_bzxzdds/(gongchang_xyj_bzdds - gongchang_xyj_bzxzdds),4) gongchang_xyj_ddzzl,
	ROUND(gongchang_xyj_bzdds/7) gongchang_xyj_bzrjdds,
	ROUND(gongchang_xyj_bzxzdds/7) gongchang_xyj_bzrjxzdds,
	ROUND((ROUND(gongchang_xyj_bzxzdds/7))/(ROUND(gongchang_xyj_bzdds/7) - ROUND(gongchang_xyj_bzxzdds/7)),4) gongchang_xyj_bzrjddzzl,
	gongchang_hgj_machine,
	gongchang_hgj_zdxs,
	ROUND(gongchang_hgj_zdxs/gongchang_hgj_machine,4) gongchang_hgj_zdxl,
	gongchang_hgj_bzdds,
	gongchang_hgj_bzxzdds,
	ROUND(gongchang_hgj_bzxzdds/(gongchang_hgj_bzdds - gongchang_hgj_bzxzdds),4) gongchang_hgj_ddzzl,
	ROUND(gongchang_hgj_bzdds/7) gongchang_hgj_bzrjdds,
	ROUND(gongchang_hgj_bzxzdds/7) gongchang_hgj_bzrjxzdds,
	ROUND((ROUND(gongchang_hgj_bzxzdds/7))/(ROUND(gongchang_hgj_bzdds/7) - ROUND(gongchang_hgj_bzxzdds/7)),4) gongchang_hgj_bzrjddzzl,
	gongchang_cfj_machine,
	gongchang_cfj_zdxs,
	ROUND(gongchang_cfj_zdxs/gongchang_cfj_machine,4) gongchang_cfj_zdxl,
	gongchang_cfj_bzdds,
	gongchang_cfj_bzxzdds,
	ROUND(gongchang_cfj_bzxzdds/(gongchang_cfj_bzdds - gongchang_cfj_bzxzdds),4) gongchang_cfj_ddzzl,
	ROUND(gongchang_cfj_bzdds/7) gongchang_cfj_bzrjdds,
	ROUND(gongchang_cfj_bzxzdds/7) gongchang_cfj_bzrjxzdds,
	ROUND((ROUND(gongchang_cfj_bzxzdds/7))/(ROUND(gongchang_cfj_bzdds/7) - ROUND(gongchang_cfj_bzxzdds/7)),4) gongchang_cfj_bzrjddzzl,
	gongchang_xxj_machine,
	gongchang_xxj_zdxs,
	ROUND(gongchang_xxj_zdxs/gongchang_xxj_machine,4) gongchang_xxj_zdxl,
	gongchang_xxj_bzdds,
	gongchang_xxj_bzxzdds,
	ROUND(gongchang_xxj_bzxzdds/(gongchang_xxj_bzdds - gongchang_xxj_bzxzdds),4) gongchang_xxj_ddzzl,
	ROUND(gongchang_xxj_bzdds/7) gongchang_xxj_bzrjdds,
	ROUND(gongchang_xxj_bzxzdds/7) gongchang_xxj_bzrjxzdds,
	ROUND((ROUND(gongchang_xxj_bzxzdds/7))/(ROUND(gongchang_xxj_bzdds/7) - ROUND(gongchang_xxj_bzxzdds/7)),4) gongchang_xxj_bzrjddzzl,
	gongchang_ysj_machine,
	gongchang_ysj_zdxs,
	ROUND(gongchang_ysj_zdxs/gongchang_ysj_machine,4) gongchang_ysj_zdxl,
	gongchang_ysj_bzdds,
	gongchang_ysj_bzxzdds,
	ROUND(gongchang_ysj_bzxzdds/(gongchang_ysj_bzdds - gongchang_ysj_bzxzdds),4) gongchang_ysj_ddzzl,
	ROUND(gongchang_ysj_bzdds/7) gongchang_ysj_bzrjdds,
	ROUND(gongchang_ysj_bzxzdds/7) gongchang_ysj_bzrjxzdds,
	ROUND((ROUND(gongchang_ysj_bzxzdds/7))/(ROUND(gongchang_ysj_bzdds/7) - ROUND(gongchang_ysj_bzxzdds/7)),4) gongchang_ysj_bzrjddzzl
	FROM merchant_yunying_weekday_new WHERE id = (select max(id) from merchant_yunying_weekday_new);

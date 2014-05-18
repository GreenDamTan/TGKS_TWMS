package com.moemao.tgks.wms.express.service;

import java.util.List;

import com.moemao.tgks.wms.express.entity.ExpressEvt;
import com.moemao.tgks.wms.express.entity.ExpressReq;

public interface ExpressService
{
	public List<ExpressEvt> queryExpress(ExpressReq expressReq);
	
	public ExpressEvt queryExpressById(String id);
	
	public int addExpress(ExpressEvt expressEvt);
	
	public int updateExpress(ExpressEvt expressEvt);
	
	public int deleteExpress(List<String> ids);

}
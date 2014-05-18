package com.moemao.tgks.wms.expresscompany.service;

import java.util.List;

import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyEvt;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyReq;

public interface ExpressCompanyService
{
	public List<ExpressCompanyEvt> queryExpressCompany(ExpressCompanyReq expressCompanyReq);
	
	public ExpressCompanyEvt queryExpressCompanyById(String id);
	
	public int addExpressCompany(ExpressCompanyEvt expressCompanyEvt);
	
	public int updateExpressCompany(ExpressCompanyEvt expressCompanyEvt);
	
	public int deleteExpressCompany(List<String> ids);

}
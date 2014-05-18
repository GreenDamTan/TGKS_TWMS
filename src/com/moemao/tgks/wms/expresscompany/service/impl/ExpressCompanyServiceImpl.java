package com.moemao.tgks.wms.expresscompany.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.expresscompany.dao.ExpressCompanyDao;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyEvt;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyReq;
import com.moemao.tgks.wms.expresscompany.service.ExpressCompanyService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class ExpressCompanyServiceImpl implements ExpressCompanyService
{
	/**
	 * ﻿ExpressCompanyDao
	 */
	private ExpressCompanyDao wms_expressCompanyDao;
	
	public List<ExpressCompanyEvt> queryExpressCompany(
	        ExpressCompanyReq expressCompanyReq)
	{
		if (CommonUtil.isEmpty(expressCompanyReq.getSortSql()))
		{
			expressCompanyReq.setSortSql(" t.ID DESC");
		}
		return wms_expressCompanyDao.wms_queryExpressCompany(expressCompanyReq);
	}
	
	public ExpressCompanyEvt queryExpressCompanyById(String id)
	{
		ExpressCompanyReq expressCompanyReq = new ExpressCompanyReq();
		expressCompanyReq.setId(id);
		ExpressCompanyEvt expressCompanyEvt = null;
		List<ExpressCompanyEvt> expressCompanyList = wms_expressCompanyDao
		        .wms_queryExpressCompany(expressCompanyReq);
		if (!CommonUtil.isEmpty(expressCompanyList))
		{
			expressCompanyEvt = expressCompanyList.get(0);
		}
		return expressCompanyEvt;
	}
	
	public int addExpressCompany(ExpressCompanyEvt expressCompanyEvt)
	{
		expressCompanyEvt.setId(WmsUtil.createUniqueID());
		return wms_expressCompanyDao.wms_addExpressCompany(expressCompanyEvt);
	}
	
	public int updateExpressCompany(ExpressCompanyEvt expressCompanyEvt)
	{
		return wms_expressCompanyDao
		        .wms_updateExpressCompany(expressCompanyEvt);
	}
	
	public int deleteExpressCompany(List<String> ids)
	{
		return wms_expressCompanyDao.wms_deleteExpressCompany(ids);
	}
	
	/**
	 * @return 返回 wms_expressCompanyDao
	 */
	public ExpressCompanyDao getWms_expressCompanyDao()
	{
		return wms_expressCompanyDao;
	}
	
	/**
	 * @param 对wms_expressCompanyDao进行赋值
	 */
	public void setWms_expressCompanyDao(ExpressCompanyDao wms_expressCompanyDao)
	{
		this.wms_expressCompanyDao = wms_expressCompanyDao;
	}
	
}
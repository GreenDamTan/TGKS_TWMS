package com.moemao.tgks.wms.expressprice.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.expressprice.dao.ExpressPriceDao;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceReq;
import com.moemao.tgks.wms.expressprice.service.ExpressPriceService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class ExpressPriceServiceImpl implements ExpressPriceService
{
	/**
	 * ﻿ExpressPriceDao
	 */
	private ExpressPriceDao wms_expressPriceDao;
	
	public List<ExpressPriceEvt> queryExpressPrice(
	        ExpressPriceReq expressPriceReq)
	{
		if (CommonUtil.isEmpty(expressPriceReq.getSortSql()))
		{
			expressPriceReq.setSortSql(" t.ID DESC");
		}
		return wms_expressPriceDao.wms_queryExpressPrice(expressPriceReq);
	}
	
	public ExpressPriceEvt queryExpressPriceById(String id)
	{
		ExpressPriceReq expressPriceReq = new ExpressPriceReq();
		expressPriceReq.setId(id);
		ExpressPriceEvt expressPriceEvt = null;
		List<ExpressPriceEvt> expressPriceList = wms_expressPriceDao
		        .wms_queryExpressPrice(expressPriceReq);
		if (!CommonUtil.isEmpty(expressPriceList))
		{
			expressPriceEvt = expressPriceList.get(0);
		}
		return expressPriceEvt;
	}
	
	public int addExpressPrice(ExpressPriceEvt expressPriceEvt)
	{
		expressPriceEvt.setId(WmsUtil.createUniqueID());
		return wms_expressPriceDao.wms_addExpressPrice(expressPriceEvt);
	}
	
	public int updateExpressPrice(ExpressPriceEvt expressPriceEvt)
	{
		return wms_expressPriceDao.wms_updateExpressPrice(expressPriceEvt);
	}
	
	public int deleteExpressPrice(List<String> ids)
	{
		return wms_expressPriceDao.wms_deleteExpressPrice(ids);
	}
	
	/**
	 * @return 返回 wms_expressPriceDao
	 */
	public ExpressPriceDao getWms_expressPriceDao()
	{
		return wms_expressPriceDao;
	}
	
	/**
	 * @param 对wms_expressPriceDao进行赋值
	 */
	public void setWms_expressPriceDao(ExpressPriceDao wms_expressPriceDao)
	{
		this.wms_expressPriceDao = wms_expressPriceDao;
	}
	
}
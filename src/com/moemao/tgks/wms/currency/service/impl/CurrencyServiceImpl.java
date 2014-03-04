package com.moemao.tgks.wms.currency.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.currency.dao.CurrencyDao;
import com.moemao.tgks.wms.currency.entity.CurrencyEvt;
import com.moemao.tgks.wms.currency.entity.CurrencyReq;
import com.moemao.tgks.wms.currency.service.CurrencyService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class CurrencyServiceImpl implements CurrencyService
{
	/**
	 * ﻿CurrencyDao
	 */
	private CurrencyDao wms_currencyDao;
	
	public List<CurrencyEvt> queryCurrency(CurrencyReq currencyReq)
	{
		if (CommonUtil.isEmpty(currencyReq.getSortSql()))
		{
			currencyReq.setSortSql(" t.ID DESC");
		}
		return wms_currencyDao.wms_queryCurrency(currencyReq);
	}
	
	public CurrencyEvt queryCurrencyById(String id)
	{
		CurrencyReq currencyReq = new CurrencyReq();
		currencyReq.setId(id);
		CurrencyEvt currencyEvt = null;
		List<CurrencyEvt> currencyList = wms_currencyDao
		        .wms_queryCurrency(currencyReq);
		if (!CommonUtil.isEmpty(currencyList))
		{
			currencyEvt = currencyList.get(0);
		}
		return currencyEvt;
	}
	
	public int addCurrency(CurrencyEvt currencyEvt)
	{
		currencyEvt.setId(WmsUtil.createUniqueID());
		return wms_currencyDao.wms_addCurrency(currencyEvt);
	}
	
	public int updateCurrency(CurrencyEvt currencyEvt)
	{
		return wms_currencyDao.wms_updateCurrency(currencyEvt);
	}
	
	public int deleteCurrency(List<String> ids)
	{
		return wms_currencyDao.wms_deleteCurrency(ids);
	}
	
	/**
	 * @return 返回 wms_currencyDao
	 */
	public CurrencyDao getWms_currencyDao()
	{
		return wms_currencyDao;
	}
	
	/**
	 * @param 对wms_currencyDao进行赋值
	 */
	public void setWms_currencyDao(CurrencyDao wms_currencyDao)
	{
		this.wms_currencyDao = wms_currencyDao;
	}
	
}
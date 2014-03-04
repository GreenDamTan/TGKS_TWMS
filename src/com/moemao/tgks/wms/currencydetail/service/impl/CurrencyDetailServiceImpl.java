package com.moemao.tgks.wms.currencydetail.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.currencydetail.dao.CurrencyDetailDao;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailEvt;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailReq;
import com.moemao.tgks.wms.currencydetail.service.CurrencyDetailService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class CurrencyDetailServiceImpl implements CurrencyDetailService
{
	/**
	 * ﻿CurrencyDetailDao
	 */
	private CurrencyDetailDao wms_currencyDetailDao;
	
	public List<CurrencyDetailEvt> queryCurrencyDetail(
	        CurrencyDetailReq currencyDetailReq)
	{
		if (CommonUtil.isEmpty(currencyDetailReq.getSortSql()))
		{
			currencyDetailReq.setSortSql(" t.ID DESC");
		}
		return wms_currencyDetailDao.wms_queryCurrencyDetail(currencyDetailReq);
	}
	
	public CurrencyDetailEvt queryCurrencyDetailById(String id)
	{
		CurrencyDetailReq currencyDetailReq = new CurrencyDetailReq();
		currencyDetailReq.setId(id);
		CurrencyDetailEvt currencyDetailEvt = null;
		List<CurrencyDetailEvt> currencyDetailList = wms_currencyDetailDao
		        .wms_queryCurrencyDetail(currencyDetailReq);
		if (!CommonUtil.isEmpty(currencyDetailList))
		{
			currencyDetailEvt = currencyDetailList.get(0);
		}
		return currencyDetailEvt;
	}
	
	public int addCurrencyDetail(CurrencyDetailEvt currencyDetailEvt)
	{
		currencyDetailEvt.setId(WmsUtil.createUniqueID());
		return wms_currencyDetailDao.wms_addCurrencyDetail(currencyDetailEvt);
	}
	
	public int updateCurrencyDetail(CurrencyDetailEvt currencyDetailEvt)
	{
		return wms_currencyDetailDao
		        .wms_updateCurrencyDetail(currencyDetailEvt);
	}
	
	public int deleteCurrencyDetail(List<String> ids)
	{
		return wms_currencyDetailDao.wms_deleteCurrencyDetail(ids);
	}
	
	/**
	 * @return 返回 wms_currencyDetailDao
	 */
	public CurrencyDetailDao getWms_currencyDetailDao()
	{
		return wms_currencyDetailDao;
	}
	
	/**
	 * @param 对wms_currencyDetailDao进行赋值
	 */
	public void setWms_currencyDetailDao(CurrencyDetailDao wms_currencyDetailDao)
	{
		this.wms_currencyDetailDao = wms_currencyDetailDao;
	}
	
}
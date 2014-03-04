package com.moemao.tgks.wms.currencydetail.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailEvt;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailReq;

public interface CurrencyDetailDao extends TGKSDao
{
	public List<CurrencyDetailEvt> wms_queryCurrencyDetail(
	        CurrencyDetailReq currencyDetailReq) throws DataAccessException;
	
	public int wms_addCurrencyDetail(CurrencyDetailEvt currencyDetailEvt)
	        throws DataAccessException;
	
	public int wms_updateCurrencyDetail(CurrencyDetailEvt currencyDetailEvt)
	        throws DataAccessException;
	
	public int wms_deleteCurrencyDetail(List<String> list)
	        throws DataAccessException;
}
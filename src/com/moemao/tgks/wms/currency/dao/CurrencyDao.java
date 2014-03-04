package com.moemao.tgks.wms.currency.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.currency.entity.CurrencyEvt;
import com.moemao.tgks.wms.currency.entity.CurrencyReq;

public interface CurrencyDao extends TGKSDao
{
	public List<CurrencyEvt> wms_queryCurrency(CurrencyReq currencyReq)
	        throws DataAccessException;
	
	public int wms_addCurrency(CurrencyEvt currencyEvt)
	        throws DataAccessException;
	
	public int wms_updateCurrency(CurrencyEvt currencyEvt)
	        throws DataAccessException;
	
	public int wms_deleteCurrency(List<String> list) throws DataAccessException;
}
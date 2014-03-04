package com.moemao.tgks.wms.currency.service;

import java.util.List;

import com.moemao.tgks.wms.currency.entity.CurrencyEvt;
import com.moemao.tgks.wms.currency.entity.CurrencyReq;

public interface CurrencyService
{
	public List<CurrencyEvt> queryCurrency(CurrencyReq currencyReq);
	
	public CurrencyEvt queryCurrencyById(String id);
	
	public int addCurrency(CurrencyEvt currencyEvt);
	
	public int updateCurrency(CurrencyEvt currencyEvt);
	
	public int deleteCurrency(List<String> ids);
	
}
package com.moemao.tgks.wms.currencydetail.service;

import java.util.List;

import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailEvt;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailReq;

public interface CurrencyDetailService
{
	public List<CurrencyDetailEvt> queryCurrencyDetail(
	        CurrencyDetailReq currencyDetailReq);
	
	public CurrencyDetailEvt queryCurrencyDetailById(String id);
	
	public int addCurrencyDetail(CurrencyDetailEvt currencyDetailEvt);
	
	public int updateCurrencyDetail(CurrencyDetailEvt currencyDetailEvt);
	
	public int deleteCurrencyDetail(List<String> ids);
	
}
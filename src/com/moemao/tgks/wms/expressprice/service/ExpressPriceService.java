package com.moemao.tgks.wms.expressprice.service;

import java.util.List;

import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceReq;

public interface ExpressPriceService
{
	public List<ExpressPriceEvt> queryExpressPrice(ExpressPriceReq expressPriceReq);
	
	public ExpressPriceEvt queryExpressPriceById(String id);
	
	public int addExpressPrice(ExpressPriceEvt expressPriceEvt);
	
	public int updateExpressPrice(ExpressPriceEvt expressPriceEvt);
	
	public int deleteExpressPrice(List<String> ids);

}
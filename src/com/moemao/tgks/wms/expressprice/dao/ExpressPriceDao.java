package com.moemao.tgks.wms.expressprice.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceReq;

public interface ExpressPriceDao extends TGKSDao
{
	public List<ExpressPriceEvt> wms_queryExpressPrice(ExpressPriceReq expressPriceReq) throws DataAccessException;
	
	public int wms_addExpressPrice(ExpressPriceEvt expressPriceEvt) throws DataAccessException;
	
	public int wms_updateExpressPrice(ExpressPriceEvt expressPriceEvt) throws DataAccessException;
	
	public int wms_deleteExpressPrice(List<String> list) throws DataAccessException;
}
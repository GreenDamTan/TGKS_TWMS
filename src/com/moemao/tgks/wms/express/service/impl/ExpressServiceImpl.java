package com.moemao.tgks.wms.express.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.express.dao.ExpressDao;
import com.moemao.tgks.wms.express.entity.ExpressEvt;
import com.moemao.tgks.wms.express.entity.ExpressReq;
import com.moemao.tgks.wms.express.service.ExpressService;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceReq;
import com.moemao.tgks.wms.expressprice.service.ExpressPriceService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class ExpressServiceImpl implements ExpressService
{
	/**
	 * ExpressPriceService业务接口
	 */
	private ExpressPriceService wms_expressPriceService;
	
	/**
	 * ﻿ExpressDao
	 */
	private ExpressDao wms_expressDao;
	
	public List<ExpressEvt> queryExpress(ExpressReq expressReq)
	{
		if (CommonUtil.isEmpty(expressReq.getSortSql()))
		{
			expressReq.setSortSql(" t.ID DESC");
		}
		return wms_expressDao.wms_queryExpress(expressReq);
	}
	
	public ExpressEvt queryExpressById(String id)
	{
		ExpressReq expressReq = new ExpressReq();
		expressReq.setId(id);
		ExpressEvt expressEvt = null;
		List<ExpressEvt> expressList = wms_expressDao
		        .wms_queryExpress(expressReq);
		if (!CommonUtil.isEmpty(expressList))
		{
			expressEvt = expressList.get(0);
		}
		return expressEvt;
	}
	
	public int addExpress(ExpressEvt expressEvt)
	{
		expressEvt.setId(WmsUtil.createUniqueID());
		
		// 获取快递区域的计费记录
		ExpressPriceReq epReq = new ExpressPriceReq();
		epReq.setArea(expressEvt.getArea());
		epReq.setEcid(expressEvt.getEcid());
		
		ExpressPriceEvt epEvt = wms_expressPriceService.queryExpressPrice(epReq).get(0);
		if (CommonUtil.isEmpty(epEvt))
		{
			expressEvt.setPrice(0);
		}
		else
		{
			expressEvt.setPrice(this.calculatePrice(expressEvt.getWeight(), epEvt.getFirst(), epEvt.getOver()));
		}
		
		
		return wms_expressDao.wms_addExpress(expressEvt);
	}
	
	/**
	 * 
	 * @Title: calculatePrice
	 * @Description: 创建快递单自动计算快递运费
	 * @param @param weight
	 * @param @param first
	 * @param @param over
	 * @return double
	 * @throws
	 */
	private double calculatePrice(double weight, double first, double over)
	{
		double price = 0;
		
		// 如果重量小于等于1Kg
		if (0 < weight && weight <= 1)
		{
			price = first;
		}
		// 如果重量大于1Kg 多余的部分按每Kg*over计算
		else
		{
			// 如果重量为整数
			if (weight%1 == 0)
			{
				price = first + (weight - 1) * over;
			}
			else
			{
				price =first + (int)(weight / 1) * over;
			}
		}
		
		return price;
	}
	
	public int updateExpress(ExpressEvt expressEvt)
	{
		return wms_expressDao.wms_updateExpress(expressEvt);
	}
	
	public int deleteExpress(List<String> ids)
	{
		return wms_expressDao.wms_deleteExpress(ids);
	}
	
	/**
	 * @return 返回 wms_expressDao
	 */
	public ExpressDao getWms_expressDao()
	{
		return wms_expressDao;
	}
	
	/**
	 * @param 对wms_expressDao进行赋值
	 */
	public void setWms_expressDao(ExpressDao wms_expressDao)
	{
		this.wms_expressDao = wms_expressDao;
	}

	public ExpressPriceService getWms_expressPriceService()
    {
    	return wms_expressPriceService;
    }

	public void setWms_expressPriceService(
            ExpressPriceService wms_expressPriceService)
    {
    	this.wms_expressPriceService = wms_expressPriceService;
    }
	
	public static void main(String[] args)
    {
	    System.out.println(6.0 + (int)(2.5/1) * 3);
    }
}
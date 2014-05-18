package com.moemao.tgks.wms.expressprice.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyEvt;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyReq;
import com.moemao.tgks.wms.expresscompany.service.ExpressCompanyService;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceReq;
import com.moemao.tgks.wms.expressprice.service.ExpressPriceService;

public class ExpressPriceAction extends TGKSAction
{
	
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = -3131817494898840024L;

	private static Log logger = LogFactory.getLog(ExpressPriceAction.class);
	
	/**
	 * ﻿ExpressPrice业务接口
	 */
	private ExpressPriceService wms_expressPriceService;
	
	/**
	 * ExpressCompanyService业务接口
	 */
	private ExpressCompanyService wms_expressCompanyService;
	
	/**
	 * 查询结果集
	 */
	private List<ExpressPriceEvt> list;
	
	private List<ExpressCompanyEvt> ecList;
	
	/**
	 * ﻿ExpressPriceEvt对象
	 */
	private ExpressPriceEvt expressPriceEvt;
	
	/**
	 * ﻿ExpressPrice查询条件封装对象
	 */
	private ExpressPriceReq expressPriceReq = new ExpressPriceReq();
	
	public String expressPriceManager()
	{
		ecList = wms_expressCompanyService.queryExpressCompany(new ExpressCompanyReq());
		return SUCCESS;
	}
	
	/**
	 * 
	 * @Title: queryExpressPriceDataByEcid
	 * @Description: 查询快递公司价格的DATALIST
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String queryExpressPriceDataByEcid()
	{
		String ecid = this.getRequest().getParameter("ecid");
		expressPriceReq = new ExpressPriceReq();
		expressPriceReq.setEcid(ecid);
		expressPriceReq.setSortSql(" t.area ASC");
		list = wms_expressPriceService.queryExpressPrice(expressPriceReq);
		
		return SUCCESS;
	}
	
	public String queryExpressPrice()
	{
		list = wms_expressPriceService.queryExpressPrice(expressPriceReq);
		return SUCCESS;
	}
	
	public String editExpressPricePage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			expressPriceEvt = wms_expressPriceService.queryExpressPriceById(id);
		}
		
		// 价格页面的快递公司列表
		ecList = wms_expressCompanyService.queryExpressCompany(new ExpressCompanyReq());
		
		return SUCCESS;
	}
	
	public String editExpressPrice()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "ExpressPriceAction.updateExpressPrice");
		int result = 0;
		if (CommonUtil.isEmpty(expressPriceEvt.getId()))
		{
			result = wms_expressPriceService.addExpressPrice(expressPriceEvt);
		}
		else
		{
			result = wms_expressPriceService
			        .updateExpressPrice(expressPriceEvt);
		}
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "ExpressPriceAction.updateExpressPrice");
		return SUCCESS;
	}
	
	public String deleteExpressPrice()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "ExpressPriceAction.deleteExpressPrice");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_expressPriceService.deleteExpressPrice(CommonUtil
		        .stringToList(ids));
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "ExpressPriceAction.deleteExpressPrice");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_expressPriceService
	 */
	public ExpressPriceService getWms_expressPriceService()
	{
		return wms_expressPriceService;
	}
	
	/**
	 * @param 对wms_expressPriceService进行赋值
	 */
	public void setWms_expressPriceService(
	        ExpressPriceService wms_expressPriceService)
	{
		this.wms_expressPriceService = wms_expressPriceService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<ExpressPriceEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<ExpressPriceEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 expressPriceEvt
	 */
	public ExpressPriceEvt getExpressPriceEvt()
	{
		return expressPriceEvt;
	}
	
	/**
	 * @param 对expressPriceEvt进行赋值
	 */
	public void setExpressPriceEvt(ExpressPriceEvt expressPriceEvt)
	{
		this.expressPriceEvt = expressPriceEvt;
	}
	
	/**
	 * @return 返回 expressPriceReq
	 */
	public ExpressPriceReq getExpressPriceReq()
	{
		return expressPriceReq;
	}
	
	/**
	 * @param 对expressPriceReq进行赋值
	 */
	public void setExpressPriceReq(ExpressPriceReq expressPriceReq)
	{
		this.expressPriceReq = expressPriceReq;
	}

	public ExpressCompanyService getWms_expressCompanyService()
    {
    	return wms_expressCompanyService;
    }

	public void setWms_expressCompanyService(
            ExpressCompanyService wms_expressCompanyService)
    {
    	this.wms_expressCompanyService = wms_expressCompanyService;
    }

	public List<ExpressCompanyEvt> getEcList()
    {
    	return ecList;
    }

	public void setEcList(List<ExpressCompanyEvt> ecList)
    {
    	this.ecList = ecList;
    }
	
}
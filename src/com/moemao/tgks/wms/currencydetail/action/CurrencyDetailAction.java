package com.moemao.tgks.wms.currencydetail.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailEvt;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailReq;
import com.moemao.tgks.wms.currencydetail.service.CurrencyDetailService;

public class CurrencyDetailAction extends TGKSAction
{
	
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = -8434524807863917944L;

	private static Log logger = LogFactory.getLog(CurrencyDetailAction.class);
	
	/**
	 * ﻿CurrencyDetail业务接口
	 */
	private CurrencyDetailService wms_currencyDetailService;
	
	/**
	 * 查询结果集
	 */
	private List<CurrencyDetailEvt> list;
	
	/**
	 * ﻿CurrencyDetailEvt对象
	 */
	private CurrencyDetailEvt currencyDetailEvt;
	
	/**
	 * ﻿CurrencyDetail查询条件封装对象
	 */
	private CurrencyDetailReq currencyDetailReq = new CurrencyDetailReq();;
	
	public String currencyDetailManager()
	{
		return SUCCESS;
	}
	
	public String queryCurrencyDetail()
	{
		list = wms_currencyDetailService.queryCurrencyDetail(currencyDetailReq);
		return SUCCESS;
	}
	
	public String editCurrencyDetailPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			currencyDetailEvt = wms_currencyDetailService
			        .queryCurrencyDetailById(id);
		}
		return SUCCESS;
	}
	
	public String editCurrencyDetail()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "CurrencyDetailAction.updateCurrencyDetail");
		int result = 0;
		if (CommonUtil.isEmpty(currencyDetailEvt.getId()))
		{
			result = wms_currencyDetailService
			        .addCurrencyDetail(currencyDetailEvt);
		}
		else
		{
			result = wms_currencyDetailService
			        .updateCurrencyDetail(currencyDetailEvt);
		}
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "CurrencyDetailAction.updateCurrencyDetail");
		return SUCCESS;
	}
	
	public String deleteCurrencyDetail()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "CurrencyDetailAction.deleteCurrencyDetail");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_currencyDetailService.deleteCurrencyDetail(CommonUtil
		        .stringToList(ids));
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "CurrencyDetailAction.deleteCurrencyDetail");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_currencyDetailService
	 */
	public CurrencyDetailService getWms_currencyDetailService()
	{
		return wms_currencyDetailService;
	}
	
	/**
	 * @param 对wms_currencyDetailService进行赋值
	 */
	public void setWms_currencyDetailService(
	        CurrencyDetailService wms_currencyDetailService)
	{
		this.wms_currencyDetailService = wms_currencyDetailService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<CurrencyDetailEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<CurrencyDetailEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 currencyDetailEvt
	 */
	public CurrencyDetailEvt getCurrencyDetailEvt()
	{
		return currencyDetailEvt;
	}
	
	/**
	 * @param 对currencyDetailEvt进行赋值
	 */
	public void setCurrencyDetailEvt(CurrencyDetailEvt currencyDetailEvt)
	{
		this.currencyDetailEvt = currencyDetailEvt;
	}
	
	/**
	 * @return 返回 currencyDetailReq
	 */
	public CurrencyDetailReq getCurrencyDetailReq()
	{
		return currencyDetailReq;
	}
	
	/**
	 * @param 对currencyDetailReq进行赋值
	 */
	public void setCurrencyDetailReq(CurrencyDetailReq currencyDetailReq)
	{
		this.currencyDetailReq = currencyDetailReq;
	}
	
}
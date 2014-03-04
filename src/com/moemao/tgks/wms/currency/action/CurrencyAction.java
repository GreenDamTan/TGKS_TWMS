package com.moemao.tgks.wms.currency.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.currency.entity.CurrencyEvt;
import com.moemao.tgks.wms.currency.entity.CurrencyReq;
import com.moemao.tgks.wms.currency.service.CurrencyService;

public class CurrencyAction extends TGKSAction
{
	
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 5573795241877862877L;
	
	private static Log logger = LogFactory.getLog(CurrencyAction.class);
	
	/**
	 * ﻿Currency业务接口
	 */
	private CurrencyService wms_currencyService;
	
	/**
	 * 查询结果集
	 */
	private List<CurrencyEvt> list;
	
	/**
	 * ﻿CurrencyEvt对象
	 */
	private CurrencyEvt currencyEvt;
	
	/**
	 * ﻿Currency查询条件封装对象
	 */
	private CurrencyReq currencyReq;
	
	public String currencyManager()
	{
		return SUCCESS;
	}
	
	public String queryCurrency()
	{
		list = wms_currencyService.queryCurrency(currencyReq);
		return SUCCESS;
	}
	
	public String editCurrencyPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			currencyEvt = wms_currencyService.queryCurrencyById(id);
		}
		return SUCCESS;
	}
	
	public String editCurrency()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "CurrencyAction.updateCurrency");
		int result = 0;
		if (CommonUtil.isEmpty(currencyEvt.getId()))
		{
			result = wms_currencyService.addCurrency(currencyEvt);
		}
		else
		{
			result = wms_currencyService.updateCurrency(currencyEvt);
		}
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "CurrencyAction.updateCurrency");
		return SUCCESS;
	}
	
	public String deleteCurrency()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "CurrencyAction.deleteCurrency");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_currencyService.deleteCurrency(CommonUtil
		        .stringToList(ids));
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "CurrencyAction.deleteCurrency");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_currencyService
	 */
	public CurrencyService getWms_currencyService()
	{
		return wms_currencyService;
	}
	
	/**
	 * @param 对wms_currencyService进行赋值
	 */
	public void setWms_currencyService(CurrencyService wms_currencyService)
	{
		this.wms_currencyService = wms_currencyService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<CurrencyEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<CurrencyEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 currencyEvt
	 */
	public CurrencyEvt getCurrencyEvt()
	{
		return currencyEvt;
	}
	
	/**
	 * @param 对currencyEvt进行赋值
	 */
	public void setCurrencyEvt(CurrencyEvt currencyEvt)
	{
		this.currencyEvt = currencyEvt;
	}
	
	/**
	 * @return 返回 currencyReq
	 */
	public CurrencyReq getCurrencyReq()
	{
		return currencyReq;
	}
	
	/**
	 * @param 对currencyReq进行赋值
	 */
	public void setCurrencyReq(CurrencyReq currencyReq)
	{
		this.currencyReq = currencyReq;
	}
	
}
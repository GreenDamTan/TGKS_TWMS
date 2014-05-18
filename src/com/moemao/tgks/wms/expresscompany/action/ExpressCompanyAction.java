package com.moemao.tgks.wms.expresscompany.action;

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

public class ExpressCompanyAction extends TGKSAction
{
	
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = -6115250134818714620L;

	private static Log logger = LogFactory.getLog(ExpressCompanyAction.class);
	
	/**
	 * ﻿ExpressCompany业务接口
	 */
	private ExpressCompanyService wms_expressCompanyService;
	
	/**
	 * 查询结果集
	 */
	private List<ExpressCompanyEvt> list;
	
	/**
	 * ﻿ExpressCompanyEvt对象
	 */
	private ExpressCompanyEvt expressCompanyEvt;
	
	/**
	 * ﻿ExpressCompany查询条件封装对象
	 */
	private ExpressCompanyReq expressCompanyReq = new ExpressCompanyReq();
	
	public String expressCompanyManager()
	{
		return SUCCESS;
	}
	
	public String queryExpressCompany()
	{
		list = wms_expressCompanyService.queryExpressCompany(expressCompanyReq);
		return SUCCESS;
	}
	
	public String editExpressCompanyPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			expressCompanyEvt = wms_expressCompanyService
			        .queryExpressCompanyById(id);
		}
		return SUCCESS;
	}
	
	public String editExpressCompany()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "ExpressCompanyAction.updateExpressCompany");
		int result = 0;
		if (CommonUtil.isEmpty(expressCompanyEvt.getId()))
		{
			result = wms_expressCompanyService
			        .addExpressCompany(expressCompanyEvt);
		}
		else
		{
			result = wms_expressCompanyService
			        .updateExpressCompany(expressCompanyEvt);
		}
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "ExpressCompanyAction.updateExpressCompany");
		return SUCCESS;
	}
	
	public String deleteExpressCompany()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
		        "ExpressCompanyAction.deleteExpressCompany");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_expressCompanyService.deleteExpressCompany(CommonUtil
		        .stringToList(ids));
		CommonUtil.infoLog(logger,
		        CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
		        StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
		        "ExpressCompanyAction.deleteExpressCompany");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_expressCompanyService
	 */
	public ExpressCompanyService getWms_expressCompanyService()
	{
		return wms_expressCompanyService;
	}
	
	/**
	 * @param 对wms_expressCompanyService进行赋值
	 */
	public void setWms_expressCompanyService(
	        ExpressCompanyService wms_expressCompanyService)
	{
		this.wms_expressCompanyService = wms_expressCompanyService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<ExpressCompanyEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<ExpressCompanyEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 expressCompanyEvt
	 */
	public ExpressCompanyEvt getExpressCompanyEvt()
	{
		return expressCompanyEvt;
	}
	
	/**
	 * @param 对expressCompanyEvt进行赋值
	 */
	public void setExpressCompanyEvt(ExpressCompanyEvt expressCompanyEvt)
	{
		this.expressCompanyEvt = expressCompanyEvt;
	}
	
	/**
	 * @return 返回 expressCompanyReq
	 */
	public ExpressCompanyReq getExpressCompanyReq()
	{
		return expressCompanyReq;
	}
	
	/**
	 * @param 对expressCompanyReq进行赋值
	 */
	public void setExpressCompanyReq(ExpressCompanyReq expressCompanyReq)
	{
		this.expressCompanyReq = expressCompanyReq;
	}
	
}
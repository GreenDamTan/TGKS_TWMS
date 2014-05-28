package com.moemao.tgks.wms.express.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.express.entity.ExpressEvt;
import com.moemao.tgks.wms.express.entity.ExpressReq;
import com.moemao.tgks.wms.express.service.ExpressService;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyEvt;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyReq;
import com.moemao.tgks.wms.expresscompany.service.ExpressCompanyService;
import com.moemao.tgks.wms.expressprice.entity.ExpressPriceEvt;
import com.moemao.tgks.wms.expressprice.service.ExpressPriceService;

public class ExpressAction extends TGKSAction
{
	
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 2592967049988964502L;

	private static Log logger = LogFactory.getLog(ExpressAction.class);
	
	/**
	 * ﻿Express业务接口
	 */
	private ExpressService wms_expressService;
	
	/**
	 * ExpressCompanyService业务接口
	 */
	private ExpressCompanyService wms_expressCompanyService;
	
	/**
	 * ExpressPriceService业务接口
	 */
	private ExpressPriceService wms_expressPriceService;
	
	/**
	 * 查询结果集
	 */
	private List<ExpressEvt> list;
	
	/**
	 * 导出用结果集
	 */
	private List<ExpressEvt> exportList;
	
	private List<ExpressPriceEvt> epList;
	
	private List<ExpressCompanyEvt> ecList;
	
	/**
	 * ﻿ExpressEvt对象
	 */
	private ExpressEvt expressEvt;
	
	/**
	 * ﻿Express查询条件封装对象
	 */
	private ExpressReq expressReq = new ExpressReq();
	
	public String expressManager()
	{
		return SUCCESS;
	}
	
	public String queryExpress()
	{
		list = wms_expressService.queryExpress(expressReq);
		return SUCCESS;
	}
	
	public String editExpressPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			expressEvt = wms_expressService.queryExpressById(id);
		}
		
		// 价格页面的快递公司列表
		ecList = wms_expressCompanyService.queryExpressCompany(new ExpressCompanyReq());
		
		return SUCCESS;
	}
	
	public String editExpress()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "ExpressAction.updateExpress");
		int result = 0;
		if (CommonUtil.isEmpty(expressEvt.getId()))
		{
			ExpressCompanyEvt ecEvt = wms_expressCompanyService.queryExpressCompanyById(expressEvt.getEcid());
			expressEvt.setEcName(ecEvt.getName());
			expressEvt.setEcWeb(ecEvt.getWeb());
			
			result = wms_expressService.addExpress(expressEvt);
			CommonUtil.systemLog("wms/editExpress.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增快递单\n%S", expressEvt.toString()));
		}
		else
		{
			result = wms_expressService.updateExpress(expressEvt);
			CommonUtil.systemLog("wms/editExpress.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改快递单\n%S", expressEvt.toString()));
		}
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "ExpressAction.updateExpress");
		return SUCCESS;
	}
	
	public String deleteExpress()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "ExpressAction.deleteExpress");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_expressService.deleteExpress(CommonUtil .stringToList(ids));
		CommonUtil.systemLog("wms/deleteExpress.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除快递单\nID:%S", ids));
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "ExpressAction.deleteExpress");
		return SUCCESS;
	}
	
	/**
	 * 
	 * @Title: exportExpress
	 * @Description: 导出本月快递单 计算快递总费用
	 * @return
	 * @return String 返回类型
	 * @throws
	 */
	public String exportExpress()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "ExpressAction.exportExpress");
		String ids = this.getRequest().getParameter("ids");
		this.exportList = wms_expressService.queryExpressByIds(CommonUtil .stringToList(ids));
		
		if (exportList.size() > 0)
		{
			ExpressEvt lastLine = new ExpressEvt();
			
			int totalPrice = 0;
			for (ExpressEvt e : exportList)
			{
				totalPrice += e.getPrice();
			}
			
			lastLine.setPrice(totalPrice);
			lastLine.setNumber("共计");
			
			exportList.add(lastLine);
		}
		
		CommonUtil.systemLog("wms/exportExpress.action", CommonConstant.SYSTEMLOG_TYPE_0, exportList == null ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("导出快递单\nID:%S", ids));
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(exportList));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "ExpressAction.exportExpress");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_expressService
	 */
	public ExpressService getWms_expressService()
	{
		return wms_expressService;
	}
	
	/**
	 * @param 对wms_expressService进行赋值
	 */
	public void setWms_expressService(ExpressService wms_expressService)
	{
		this.wms_expressService = wms_expressService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<ExpressEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<ExpressEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 expressEvt
	 */
	public ExpressEvt getExpressEvt()
	{
		return expressEvt;
	}
	
	/**
	 * @param 对expressEvt进行赋值
	 */
	public void setExpressEvt(ExpressEvt expressEvt)
	{
		this.expressEvt = expressEvt;
	}
	
	/**
	 * @return 返回 expressReq
	 */
	public ExpressReq getExpressReq()
	{
		return expressReq;
	}
	
	/**
	 * @param 对expressReq进行赋值
	 */
	public void setExpressReq(ExpressReq expressReq)
	{
		this.expressReq = expressReq;
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

	public ExpressPriceService getWms_expressPriceService()
    {
    	return wms_expressPriceService;
    }

	public void setWms_expressPriceService(
            ExpressPriceService wms_expressPriceService)
    {
    	this.wms_expressPriceService = wms_expressPriceService;
    }

	public List<ExpressPriceEvt> getEpList()
    {
    	return epList;
    }

	public void setEpList(List<ExpressPriceEvt> epList)
    {
    	this.epList = epList;
    }

	public List<ExpressCompanyEvt> getEcList()
    {
    	return ecList;
    }

	public void setEcList(List<ExpressCompanyEvt> ecList)
    {
    	this.ecList = ecList;
    }

	public List<ExpressEvt> getExportList()
    {
    	return exportList;
    }

	public void setExportList(List<ExpressEvt> exportList)
    {
    	this.exportList = exportList;
    }
	
}
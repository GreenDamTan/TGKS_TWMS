package com.moemao.tgks.wms.customer.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.customer.entity.CustomerEvt;
import com.moemao.tgks.wms.customer.entity.CustomerReq;
import com.moemao.tgks.wms.customer.service.CustomerService;

public class CustomerAction extends TGKSAction
{
	
	/** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = -8892104999788790488L;

	private static Log logger = LogFactory.getLog(CustomerAction.class);
	
	/**
	 * ﻿Customer业务接口
	 */
	private CustomerService wms_customerService;
	
	/**
	 * 查询结果集
	 */
	private List<CustomerEvt> list;
	
	/**
	 * ﻿CustomerEvt对象
	 */
	private CustomerEvt customerEvt;
	
	/**
	 * ﻿Customer查询条件封装对象
	 */
	private CustomerReq customerReq;
	
	public String customerManager()
	{
		return SUCCESS;
	}
	
	public String queryCustomer()
	{
		list = wms_customerService.queryCustomer(customerReq);
		return SUCCESS;
	}
	
	public String editCustomerPage()
	{
		String id = this.getRequest().getParameter("id");
		if (!CommonUtil.isEmpty(id))
		{
			customerEvt = wms_customerService.queryCustomerById(id);
		}
		return SUCCESS;
	}
	
	public String editCustomer()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CustomerAction.updateCustomer");
		int result = 0;
		if (CommonUtil.isEmpty(customerEvt.getId()))
		{
			result = wms_customerService.addCustomer(customerEvt);
			CommonUtil.systemLog("wms/editCustomer.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增客户\n%S", customerEvt.toString()));
		}
		else
		{
			result = wms_customerService.updateCustomer(customerEvt);
			CommonUtil.systemLog("wms/editCustomer.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改客户信息\n%S", customerEvt.toString()));
		}
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CustomerAction.updateCustomer");
		return SUCCESS;
	}
	
	public String deleteCustomer()
	{
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CustomerAction.deleteCustomer");
		String ids = this.getRequest().getParameter("ids");
		int result = wms_customerService.deleteCustomer(CommonUtil.stringToList(ids));
		CommonUtil.systemLog("wms/deleteCustomer.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除客户\nID:%S", ids));
		CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
		CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CustomerAction.deleteCustomer");
		return SUCCESS;
	}
	
	/**
	 * @return 返回 wms_customerService
	 */
	public CustomerService getWms_customerService()
	{
		return wms_customerService;
	}
	
	/**
	 * @param 对wms_customerService进行赋值
	 */
	public void setWms_customerService(CustomerService wms_customerService)
	{
		this.wms_customerService = wms_customerService;
	}
	
	/**
	 * @return 返回 list
	 */
	public List<CustomerEvt> getList()
	{
		return list;
	}
	
	/**
	 * @param 对list进行赋值
	 */
	public void setList(List<CustomerEvt> list)
	{
		this.list = list;
	}
	
	/**
	 * @return 返回 customerEvt
	 */
	public CustomerEvt getCustomerEvt()
	{
		return customerEvt;
	}
	
	/**
	 * @param 对customerEvt进行赋值
	 */
	public void setCustomerEvt(CustomerEvt customerEvt)
	{
		this.customerEvt = customerEvt;
	}
	
	/**
	 * @return 返回 customerReq
	 */
	public CustomerReq getCustomerReq()
	{
		return customerReq;
	}
	
	/**
	 * @param 对customerReq进行赋值
	 */
	public void setCustomerReq(CustomerReq customerReq)
	{
		this.customerReq = customerReq;
	}
	
}
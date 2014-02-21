package com.moemao.tgks.wms.customer.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.customer.dao.CustomerDao;
import com.moemao.tgks.wms.customer.entity.CustomerEvt;
import com.moemao.tgks.wms.customer.entity.CustomerReq;
import com.moemao.tgks.wms.customer.service.CustomerService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class CustomerServiceImpl implements CustomerService
{
	/**
	 * ﻿CustomerDao
	 */
	private CustomerDao wms_customerDao;
	
	public List<CustomerEvt> queryCustomer(CustomerReq customerReq)
	{
		if (CommonUtil.isEmpty(customerReq.getSortSql()))
		{
			customerReq.setSortSql(" t.ID DESC");
		}
		return wms_customerDao.wms_queryCustomer(customerReq);
	}
	
	public CustomerEvt queryCustomerById(String id)
	{
		CustomerReq customerReq = new CustomerReq();
		customerReq.setId(id);
		CustomerEvt customerEvt = null;
		List<CustomerEvt> customerList = wms_customerDao
		        .wms_queryCustomer(customerReq);
		if (!CommonUtil.isEmpty(customerList))
		{
			customerEvt = customerList.get(0);
		}
		return customerEvt;
	}
	
	public int addCustomer(CustomerEvt customerEvt)
	{
		customerEvt.setId(WmsUtil.createUniqueID());
		return wms_customerDao.wms_addCustomer(customerEvt);
	}
	
	public int updateCustomer(CustomerEvt customerEvt)
	{
		return wms_customerDao.wms_updateCustomer(customerEvt);
	}
	
	public int deleteCustomer(List<String> ids)
	{
		return wms_customerDao.wms_deleteCustomer(ids);
	}
	
	/**
	 * @return 返回 wms_customerDao
	 */
	public CustomerDao getWms_customerDao()
	{
		return wms_customerDao;
	}
	
	/**
	 * @param 对wms_customerDao进行赋值
	 */
	public void setWms_customerDao(CustomerDao wms_customerDao)
	{
		this.wms_customerDao = wms_customerDao;
	}
	
}
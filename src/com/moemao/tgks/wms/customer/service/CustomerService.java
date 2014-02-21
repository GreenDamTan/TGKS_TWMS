package com.moemao.tgks.wms.customer.service;

import java.util.List;

import com.moemao.tgks.wms.customer.entity.CustomerEvt;
import com.moemao.tgks.wms.customer.entity.CustomerReq;

public interface CustomerService
{
	public List<CustomerEvt> queryCustomer(CustomerReq customerReq);
	
	public CustomerEvt queryCustomerById(String id);
	
	public int addCustomer(CustomerEvt customerEvt);
	
	public int updateCustomer(CustomerEvt customerEvt);
	
	public int deleteCustomer(List<String> ids);
	
}
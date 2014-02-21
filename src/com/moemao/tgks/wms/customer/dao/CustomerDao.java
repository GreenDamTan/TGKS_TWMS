package com.moemao.tgks.wms.customer.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.customer.entity.CustomerEvt;
import com.moemao.tgks.wms.customer.entity.CustomerReq;

public interface CustomerDao extends TGKSDao
{
	public List<CustomerEvt> wms_queryCustomer(CustomerReq customerReq)
	        throws DataAccessException;
	
	public int wms_addCustomer(CustomerEvt customerEvt)
	        throws DataAccessException;
	
	public int wms_updateCustomer(CustomerEvt customerEvt)
	        throws DataAccessException;
	
	public int wms_deleteCustomer(List<String> list) throws DataAccessException;
}
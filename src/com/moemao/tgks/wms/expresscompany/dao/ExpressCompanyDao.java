package com.moemao.tgks.wms.expresscompany.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyEvt;
import com.moemao.tgks.wms.expresscompany.entity.ExpressCompanyReq;

public interface ExpressCompanyDao extends TGKSDao
{
	public List<ExpressCompanyEvt> wms_queryExpressCompany(ExpressCompanyReq expressCompanyReq) throws DataAccessException;
	
	public int wms_addExpressCompany(ExpressCompanyEvt expressCompanyEvt) throws DataAccessException;
	
	public int wms_updateExpressCompany(ExpressCompanyEvt expressCompanyEvt) throws DataAccessException;
	
	public int wms_deleteExpressCompany(List<String> list) throws DataAccessException;
}
package com.moemao.tgks.wms.express.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.express.entity.ExpressEvt;
import com.moemao.tgks.wms.express.entity.ExpressReq;

public interface ExpressDao extends TGKSDao
{
	public List<ExpressEvt> wms_queryExpress(ExpressReq expressReq) throws DataAccessException;
	
	public int wms_addExpress(ExpressEvt expressEvt) throws DataAccessException;
	
	public int wms_updateExpress(ExpressEvt expressEvt) throws DataAccessException;
	
	public int wms_deleteExpress(List<String> list) throws DataAccessException;
}
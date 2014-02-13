package com.moemao.tgks.wms.deal.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;

public interface DealDao extends TGKSDao
{
    public List<DealEvt> wms_queryDeal(DealReq dealReq)
            throws DataAccessException;

    public int wms_addDeal(DealEvt dealEvt) throws DataAccessException;

    public int wms_updateDeal(DealEvt dealEvt) throws DataAccessException;

    public int wms_deleteDeal(List<String> list) throws DataAccessException;
}
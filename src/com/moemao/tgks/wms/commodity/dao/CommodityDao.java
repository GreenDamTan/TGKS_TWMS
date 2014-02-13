package com.moemao.tgks.wms.commodity.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.entity.CommodityReq;

public interface CommodityDao extends TGKSDao
{
    public List<CommodityEvt> wms_queryCommodity(CommodityReq commodityReq)
            throws DataAccessException;

    public int wms_addCommodity(CommodityEvt commodityEvt)
            throws DataAccessException;

    public int wms_updateCommodity(CommodityEvt commodityEvt)
            throws DataAccessException;

    public int wms_deleteCommodity(List<String> list)
            throws DataAccessException;
}
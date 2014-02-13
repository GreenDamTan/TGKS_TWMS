package com.moemao.tgks.wms.commodity.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.commodity.dao.CommodityDao;
import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.entity.CommodityReq;
import com.moemao.tgks.wms.commodity.service.CommodityService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class CommodityServiceImpl implements CommodityService
{
    /**
     * ﻿CommodityDao
     */
    private CommodityDao wms_commodityDao;

    @Override
    public List<CommodityEvt> queryCommodity(CommodityReq commodityReq)
    {
        if (CommonUtil.isEmpty(commodityReq.getSortSql()))
        {
            commodityReq.setSortSql(" t.ID DESC");
        }
        return wms_commodityDao.wms_queryCommodity(commodityReq);
    }

    @Override
    public CommodityEvt queryCommodityById(String id)
    {
        CommodityReq commodityReq = new CommodityReq();
        commodityReq.setId(id);
        CommodityEvt commodityEvt = null;
        List<CommodityEvt> commodityList = wms_commodityDao
                .wms_queryCommodity(commodityReq);
        if (!CommonUtil.isEmpty(commodityList))
        {
            commodityEvt = commodityList.get(0);
        }
        return commodityEvt;
    }

    @Override
    public int addCommodity(CommodityEvt commodityEvt)
    {
        commodityEvt.setId(WmsUtil.createUniqueID());
        return wms_commodityDao.wms_addCommodity(commodityEvt);
    }

    @Override
    public int updateCommodity(CommodityEvt commodityEvt)
    {
        return wms_commodityDao.wms_updateCommodity(commodityEvt);
    }

    @Override
    public int deleteCommodity(List<String> ids)
    {
        return wms_commodityDao.wms_deleteCommodity(ids);
    }
    
    /**
     * @return 返回 wms_commodityDao
     */
    public CommodityDao getWms_commodityDao()
    {
        return wms_commodityDao;
    }

    /**
     * @param 对wms_commodityDao进行赋值
     */
    public void setWms_commodityDao(CommodityDao wms_commodityDao)
    {
        this.wms_commodityDao = wms_commodityDao;
    }

}
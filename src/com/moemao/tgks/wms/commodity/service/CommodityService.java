package com.moemao.tgks.wms.commodity.service;

import java.util.List;

import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.entity.CommodityReq;

public interface CommodityService
{
    public List<CommodityEvt> queryCommodity(CommodityReq commodityReq);

    public CommodityEvt queryCommodityById(String id);

    public int addCommodity(CommodityEvt commodityEvt);

    public int updateCommodity(CommodityEvt commodityEvt);

    public int deleteCommodity(List<String> ids);
    
}
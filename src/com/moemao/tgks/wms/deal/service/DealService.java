package com.moemao.tgks.wms.deal.service;

import java.util.List;

import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;

public interface DealService
{
    public List<DealEvt> queryDeal(DealReq dealReq);

    public DealEvt queryDealById(String id);

    public int addDeal(DealEvt dealEvt);

    public int updateDeal(DealEvt dealEvt);

    public int deleteDeal(List<String> ids);

    /**
     * 更新商品的库存数目
     * @函数功能说明：
     * @创建者：Ken
     * @创建日期：2012-12-19 下午4:44:28
     * @参数：@param commodityId
     * @参数：@return
     * @return int
     * @throws
     */
    public int updateNumberOfCommodity(String commodityId);
}
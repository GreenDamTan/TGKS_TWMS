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
    
    public int payOrderDeal(String orderType, List<String> ids);
    
    public int storeOrderDeal(String orderType, List<String> ids);
    
    /**
     * 更新订单交易记录的状态
     * @函数功能说明：
     * @创建者：Ken
     * @创建日期：2014-2-25 下午4:56:11
     * @参数：@param id, payStatus, storeStatus
     * @参数：@return
     * @return int
     * @throws
     */
    public int updateOrderDealStatus(String id, String payStatus, String storeStatus);

    /**
     * 更新商品的库存数目
     * @函数功能说明：
     * @创建者：Ken
     * @创建日期：2012-12-19 下午4:44:28
     * @参数：@param commodityId, num
     * @参数：@return
     * @return int
     * @throws
     */
    public int updateCommodityNum(String commodityId, int num);
}
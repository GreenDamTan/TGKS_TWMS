package com.moemao.tgks.wms.deal.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.service.CommodityService;
import com.moemao.tgks.wms.deal.dao.DealDao;
import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;
import com.moemao.tgks.wms.deal.service.DealService;
import com.moemao.tgks.wms.order.service.OrderService;
import com.moemao.tgks.wms.tool.WmsConstant;
import com.moemao.tgks.wms.tool.WmsUtil;

public class DealServiceImpl implements DealService
{
    /**
     * ﻿DealDao
     */
    private DealDao wms_dealDao;
    
    private OrderService wms_orderService;
    
    private CommodityService wms_commodityService;

    @Override
    public List<DealEvt> queryDeal(DealReq dealReq)
    {
        if (CommonUtil.isEmpty(dealReq.getSortSql()))
        {
            dealReq.setSortSql(" t.ID DESC");
        }
        return wms_dealDao.wms_queryDeal(dealReq);
    }

    @Override
    public DealEvt queryDealById(String id)
    {
        DealReq dealReq = new DealReq();
        dealReq.setId(id);
        DealEvt dealEvt = null;
        List<DealEvt> dealList = wms_dealDao.wms_queryDeal(dealReq);
        if (!CommonUtil.isEmpty(dealList))
        {
            dealEvt = dealList.get(0);
        }
        return dealEvt;
    }

    @Override
    public int addDeal(DealEvt dealEvt)
    {
        dealEvt.setId(WmsUtil.createUniqueID());
        dealEvt.setPayStatus(WmsConstant.PAYSTATUS_0);
        dealEvt.setStoreStatus(WmsConstant.STORESTATUS_0);
        
        int result = wms_dealDao.wms_addDeal(dealEvt);
        
        return result;
    }

    @Override
    public int updateDeal(DealEvt dealEvt)
    {
        int result = wms_dealDao.wms_updateDeal(dealEvt);
        
        return result;
    }

    @Override
    public int deleteDeal(List<String> ids)
    {
        int result = wms_dealDao.wms_deleteDeal(ids);
                
        return result;
    }
    
    /**
     * 交易状态变更 - 过款
     */
    public int payOrderDeal(String orderType, List<String> ids)
    {
    	int result = 0;
    	
    	if (WmsConstant.DEALTYPE_0.equals(orderType))
    	{
    		// 购入单子 将状态改成已付款
    		for (String id : ids)
    		{
    			this.updateOrderDealStatus(id, WmsConstant.PAYSTATUS_1, null);
    		}
    	}
    	else if (WmsConstant.DEALTYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已收款
    		for (String id : ids)
    		{
    			this.updateOrderDealStatus(id, WmsConstant.PAYSTATUS_2, null);
    		}
    	}
    	
    	return result;
    }
    
    /**
     * 交易状态变更 - 过库
     * 过库同时处理库存管理记录中的数量
     * 入库是加入deal的数量，出库时减少
     */
    public int storeOrderDeal(String orderType, List<String> ids)
    {
    	int result = 0;
    	DealEvt dealEvt = null;
    	
    	if (WmsConstant.DEALTYPE_0.equals(orderType))
    	{
    		// 购入单子 将状态改成已入库
    		for (String id : ids)
    		{   			
    			dealEvt = this.queryDealById(id);
    	        
    	        // 处理商品库存数 增加
    	        this.updateCommodityNum(dealEvt.getCommodityId(), dealEvt.getNumber());
    	        // 更新Deal状态 已入库
    			this.updateOrderDealStatus(id, null, WmsConstant.STORESTATUS_1);
    		}
    	}
    	else if (WmsConstant.DEALTYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已出库
    		for (String id : ids)
    		{
    			dealEvt = this.queryDealById(id);
    			
    	        // 处理商品库存数 减少
    			this.updateCommodityNum(dealEvt.getCommodityId(), (0 - dealEvt.getNumber()));
    	        
    	        // 更新Deal状态 已出库
    			this.updateOrderDealStatus(id, null, WmsConstant.STORESTATUS_2);
    		}
    	}
    	
    	return result;
    }
    
    /**
     * 更新订单交易记录的状态
     * @函数功能说明：
     * @创建者：Ken
     * @创建日期：2014-2-25 下午4:56:11
     * @参数：@param id, status
     * @参数：@return
     * @return int
     * @throws
     */
    public int updateOrderDealStatus(String id, String payStatus, String storeStatus)
    {
    	DealEvt dealEvt = this.queryDealById(id);
    	
    	if (StringUtil.isNotEmpty(payStatus))
    	{
    		dealEvt.setPayStatus(payStatus);
    	}
    	
    	if (StringUtil.isNotEmpty(storeStatus))
    	{
    		dealEvt.setStoreStatus(storeStatus);
    	}
    	
    	return this.updateDeal(dealEvt);
    }
    
    /**
     * 更新商品的库存数目
     * @函数功能说明：仅当 入库、出库、耗损 操作时，对库存数量进行修改
     * @创建者：Ken
     * @创建日期：2012-12-19 下午4:44:28
     * @参数：@param commodityId 库存商品ID
     * @参数：@param num 库存商品数量 入库正数，出库负数，调用前已经判断
     * @参数：@return
     * @return int
     * @throws
     */
    @Override
    public int updateCommodityNum(String commodityId, int num)
    {
    	CommodityEvt commodityEvt = wms_commodityService.queryCommodityById(commodityId);
    	commodityEvt.setNumber(commodityEvt.getNumber() + num);
    	
    	return this.wms_commodityService.updateCommodity(commodityEvt);
    }

    /**
     * @return 返回 wms_dealDao
     */
    public DealDao getWms_dealDao()
    {
        return wms_dealDao;
    }

    /**
     * @param 对wms_dealDao进行赋值
     */
    public void setWms_dealDao(DealDao wms_dealDao)
    {
        this.wms_dealDao = wms_dealDao;
    }

	public OrderService getWms_orderService()
    {
    	return wms_orderService;
    }

	public void setWms_orderService(OrderService wms_orderService)
    {
    	this.wms_orderService = wms_orderService;
    }

	public CommodityService getWms_commodityService()
    {
    	return wms_commodityService;
    }

	public void setWms_commodityService(CommodityService wms_commodityService)
    {
    	this.wms_commodityService = wms_commodityService;
    }

}
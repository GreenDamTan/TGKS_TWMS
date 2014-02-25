package com.moemao.tgks.wms.deal.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.deal.dao.DealDao;
import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;
import com.moemao.tgks.wms.deal.service.DealService;
import com.moemao.tgks.wms.tool.WmsConstant;
import com.moemao.tgks.wms.tool.WmsUtil;

public class DealServiceImpl implements DealService
{
    /**
     * ﻿DealDao
     */
    private DealDao wms_dealDao;

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
        dealEvt.setStatus("0");
        int result = wms_dealDao.wms_addDeal(dealEvt);
        
        // 处理商品库存数
        this.updateNumberOfCommodity(dealEvt.getCommodityId());
        
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
    	}
    	else if (WmsConstant.DEALTYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已收款
    	}
    	
    	return result;
    }
    
    /**
     * 交易状态变更 - 过库
     */
    public int storeOrderDeal(String orderType, List<String> ids)
    {
    	int result = 0;
    	
    	if (WmsConstant.DEALTYPE_0.equals(orderType))
    	{
    		// 购入单子 将状态改成已入库
    	}
    	else if (WmsConstant.DEALTYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已出库
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
    public int updateOrderDealStatus(String id, String status)
    {
    	DealEvt dealEvt = this.queryDealById(id);
    	dealEvt.setStatus(status);
    	
    	return this.updateDeal(dealEvt);
    }
    
    /**
     * 更新商品的库存数目
     * @函数功能说明：仅当 入库、出库、耗损 操作时，对库存数量进行修改
     * @创建者：Ken
     * @创建日期：2012-12-19 下午4:44:28
     * @参数：@param commodityId
     * @参数：@return
     * @return int
     * @throws
     */
    @Override
    public int updateNumberOfCommodity(String commodityId)
    {
        return 0;
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

}
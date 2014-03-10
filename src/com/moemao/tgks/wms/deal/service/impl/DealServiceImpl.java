package com.moemao.tgks.wms.deal.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.service.CommodityService;
import com.moemao.tgks.wms.currency.entity.CurrencyEvt;
import com.moemao.tgks.wms.currency.service.CurrencyService;
import com.moemao.tgks.wms.currencydetail.entity.CurrencyDetailEvt;
import com.moemao.tgks.wms.currencydetail.service.CurrencyDetailService;
import com.moemao.tgks.wms.deal.dao.DealDao;
import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;
import com.moemao.tgks.wms.deal.service.DealService;
import com.moemao.tgks.wms.order.entity.OrderEvt;
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
    
    private CurrencyService wms_currencyService;
    
    private CurrencyDetailService wms_currencyDetailService;

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
        dealEvt.setPayStatus(WmsConstant.PAY_STATUS_0);
        dealEvt.setStoreStatus(WmsConstant.STORE_STATUS_0);
        
        int result = wms_dealDao.wms_addDeal(dealEvt);
        
        if (result > 0)
        {
        	// 新增成功后 修改订单状态为1 交易中
        	OrderEvt orderEvt = wms_orderService.queryOrderById(dealEvt.getOrderId());
        	orderEvt.setStatus(WmsConstant.ORDER_STATUS_1);
        	wms_orderService.updateOrder(orderEvt);
        }
        
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
    	
    	if (WmsConstant.DEAL_TYPE_0.equals(orderType))
    	{
    		// 购入单子 将状态改成已付款
    		for (String id : ids)
    		{
    			this.updateOrderDealStatus(id, WmsConstant.PAY_STATUS_1, null);
    			
    			// 添加资金流出记录
    			this.addCurrencyDetail(id);
    		}
    	}
    	else if (WmsConstant.DEAL_TYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已收款
    		for (String id : ids)
    		{
    			this.updateOrderDealStatus(id, WmsConstant.PAY_STATUS_2, null);
    			
    			// 添加资金流出记录
    			this.addCurrencyDetail(id);
    		}
    	}
    	
    	return result;
    }
    
    /**
     * 
     * @Title: addCurrencyDetail
     * @Description: 增加资金流动记录
     * @param id 交易记录ID
     * @return
     * @return int 返回类型
     * @throws
     */
    public int addCurrencyDetail(String id)
    {
    	// 交易信息
    	DealEvt dealEvt = this.queryDealById(id);
    	
    	// 交易的订单信息
    	OrderEvt orderEvt = wms_orderService.queryOrderById(dealEvt.getOrderId());
    	
    	// 资金记录
    	CurrencyEvt currencyEvt = new CurrencyEvt();
    	
    	if (WmsConstant.ORDER_ACCOUNT_TYPE_0.equals(orderEvt.getAccountType()))
    	{
    		// 订单交易类型为私款 则添加私款的交易记录
    		currencyEvt = wms_currencyService.queryCurrencyById(WmsConstant.CURRENCY_TYPE_0);
    	}
    	else if (WmsConstant.ORDER_ACCOUNT_TYPE_1.equals(orderEvt.getAccountType()))
    	{
    		// 订单交易类型为公款 则添加公款的交易记录
    		currencyEvt = wms_currencyService.queryCurrencyById(WmsConstant.CURRENCY_TYPE_1);
    	}
    	
    	// 新增本次资金流动
    	CurrencyDetailEvt currencyDetailEvt = new CurrencyDetailEvt();
		
    	// 整合资金流动信息
		currencyDetailEvt.setCode(currencyEvt.getCode());
		currencyDetailEvt.setCurrencyId(currencyEvt.getId());
		currencyDetailEvt.setName(currencyEvt.getName());
		currencyDetailEvt.setType(currencyEvt.getType());
		currencyDetailEvt.setUnit(currencyEvt.getUnit());
		
		if (WmsConstant.ORDER_TYPE_0.equals(orderEvt.getType()))
		{
			// 购入的订单
			// 资金流向为流出
			currencyDetailEvt.setDirection(WmsConstant.CURRENCY_DETAIL_DIRECTION_1);
			
			// 流出的自己记录为负数
			currencyDetailEvt.setNum(0 - dealEvt.getPrice() * dealEvt.getNumber());
		}
		else if (WmsConstant.ORDER_TYPE_1.equals(orderEvt.getType()))
		{
			// 售出的订单
			// 资金流向为流入
			currencyDetailEvt.setDirection(WmsConstant.CURRENCY_DETAIL_DIRECTION_0);
			
			// 流入的自己记录为正数
			currencyDetailEvt.setNum(dealEvt.getPrice() * dealEvt.getNumber());
		}
		
		currencyDetailEvt.setOrderId(dealEvt.getOrderId());
		currencyDetailEvt.setDealId(dealEvt.getId());
		currencyDetailEvt.setOrderCode(orderEvt.getCode());
		currencyDetailEvt.setRemark(String.format("名称：%S\n数量：%S\n单价：%S", dealEvt.getCommodityName(), dealEvt.getNumber(), dealEvt.getPrice()));
		
		int result = wms_currencyDetailService.addCurrencyDetail(currencyDetailEvt);
		
		if (result > 0)
		{
			// 添加资金流动明细记录成功后 修改资金数量
			currencyEvt.setNum(currencyEvt.getNum() + currencyDetailEvt.getNum());
			wms_currencyService.updateCurrency(currencyEvt);
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
    	
    	if (WmsConstant.DEAL_TYPE_0.equals(orderType))
    	{
    		// 购入单子 将状态改成已入库
    		for (String id : ids)
    		{   			
    			dealEvt = this.queryDealById(id);
    	        
    	        // 处理商品库存数 增加
    	        this.updateCommodityNum(dealEvt.getCommodityId(), dealEvt.getNumber());
    	        // 更新Deal状态 已入库
    			this.updateOrderDealStatus(id, null, WmsConstant.STORE_STATUS_1);
    			
    			// 进货入库更新当前进货价格
    			this.updateCommodityPrice(dealEvt.getCommodityId(), dealEvt.getPrice());
    		}
    	}
    	else if (WmsConstant.DEAL_TYPE_1.equals(orderType))
    	{
    		// 售出单子 将状态改成已出库
    		for (String id : ids)
    		{
    			dealEvt = this.queryDealById(id);
    			
    	        // 处理商品库存数 减少
    			this.updateCommodityNum(dealEvt.getCommodityId(), (0 - dealEvt.getNumber()));
    	        
    	        // 更新Deal状态 已出库
    			this.updateOrderDealStatus(id, null, WmsConstant.STORE_STATUS_2);
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
     * 更新商品的进货价格
     * @函数功能说明：仅当 入库 操作时，对库存进货价格进行修改
     * @创建者：Ken
     * @创建日期：2012-12-19 下午4:44:28
     * @参数：@param commodityId 库存商品ID
     * @参数：@param price 库存商品进货价
     * @参数：@return
     * @return int
     * @throws
     */
    @Override
    public int updateCommodityPrice(String commodityId, double price)
    {
    	CommodityEvt commodityEvt = wms_commodityService.queryCommodityById(commodityId);
    	commodityEvt.setPrice(price);
    	
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

	public CurrencyService getWms_currencyService()
    {
    	return wms_currencyService;
    }

	public void setWms_currencyService(CurrencyService wms_currencyService)
    {
    	this.wms_currencyService = wms_currencyService;
    }

	public CurrencyDetailService getWms_currencyDetailService()
    {
    	return wms_currencyDetailService;
    }

	public void setWms_currencyDetailService(CurrencyDetailService wms_currencyDetailService)
    {
    	this.wms_currencyDetailService = wms_currencyDetailService;
    }

}
package com.moemao.tgks.wms.deal.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.deal.entity.DealEvt;
import com.moemao.tgks.wms.deal.entity.DealReq;
import com.moemao.tgks.wms.deal.service.DealService;

public class DealAction extends TGKSAction
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -7164932594095222190L;

    private static Log logger = LogFactory.getLog(DealAction.class);

    /**
     * ﻿Deal业务接口
     */
    private DealService wms_dealService;

    /**
     * 查询结果集
     */
    private List<DealEvt> list;

    /**
     * ﻿DealEvt对象
     */
    private DealEvt dealEvt;

    /**
     * ﻿Deal查询条件封装对象
     */
    private DealReq dealReq = new DealReq();
    
    /**
     * ﻿Deal查询条件封装对象
     */
    private DealReq orderDealReq = new DealReq();
    
    private String orderDealOrderId;
    
    private String orderDealOrderCode;
    
    private String orderDealOrderType;

    public String dealManager()
    {
        return SUCCESS;
    }
    
    /**
     * 
     * @函数功能说明：订单页面的订单交易管理，传入一个订单号，然后对其下的交易记录进行管理
     * @创建者：Ken
     * @创建日期：2012-12-14 下午3:16:38
     * @修改者：
     * @修改日期：
     * @修改内容：
     * @参数：@return
     * @return String
     * @throws
     */
    public String orderDealManager()
    {
    	// 参数最后一位表示订单交易类型
        String params = this.getRequest().getParameter("params").trim();
        String[] strs = params.split("-");
        orderDealOrderId = strs[0].trim();
        orderDealOrderCode = strs[1].trim();
        orderDealOrderType = strs[2].trim();
        return SUCCESS;
    }

    public String queryDeal()
    {
        list = wms_dealService.queryDeal(dealReq);
        return SUCCESS;
    }
    
    public String queryOrderDeal()
    {
        list = wms_dealService.queryDeal(orderDealReq);
        return SUCCESS;
    }

    public String editDealPage()
    {
        dealEvt = new DealEvt();
        dealEvt.setOrderId(this.getRequest().getParameter("orderId"));
        dealEvt.setOrderCode(this.getRequest().getParameter("orderCode"));
        dealEvt.setType(this.getRequest().getParameter("orderType"));
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            dealEvt = wms_dealService.queryDealById(id);
        }
        return SUCCESS;
    }

    public String editDeal()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "DealAction.updateDeal");
        int result = 0;
        
        if (CommonUtil.isEmpty(dealEvt.getId()))
        {
            result = wms_dealService.addDeal(dealEvt);
        }
        else
        {
            result = wms_dealService.updateDeal(dealEvt);
        }
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "DealAction.updateDeal");
        return SUCCESS;
    }

    public String deleteDeal()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "DealAction.deleteDeal");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_dealService.deleteDeal(CommonUtil.stringToList(ids));
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "DealAction.deleteDeal");
        return SUCCESS;
    }
    
    public String payOrderDeal()
    {
    	CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "DealAction.payOrderDeal");
    	
    	String orderType = this.getRequest().getParameter("orderDealOrderType");
    	String ids = this.getRequest().getParameter("ids");
        int result = wms_dealService.payOrderDeal(orderType, CommonUtil.stringToList(ids));
        
    	CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "DealAction.payOrderDeal");
    	return SUCCESS;
    }
    
    public String storeOrderDeal()
    {
    	CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "DealAction.storeOrderDeal");
    	
    	String orderType = this.getRequest().getParameter("orderDealOrderType");
    	String ids = this.getRequest().getParameter("ids");
        int result = wms_dealService.storeOrderDeal(orderType, CommonUtil.stringToList(ids));
        
    	CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "DealAction.storeOrderDeal");
    	return SUCCESS;
    }
    
    /**
     * @return 返回 wms_dealService
     */
    public DealService getWms_dealService()
    {
        return wms_dealService;
    }

    /**
     * @param 对wms_dealService进行赋值
     */
    public void setWms_dealService(DealService wms_dealService)
    {
        this.wms_dealService = wms_dealService;
    }

    /**
     * @return 返回 list
     */
    public List<DealEvt> getList()
    {
        return list;
    }

    /**
     * @param 对list进行赋值
     */
    public void setList(List<DealEvt> list)
    {
        this.list = list;
    }

    /**
     * @return 返回 dealEvt
     */
    public DealEvt getDealEvt()
    {
        return dealEvt;
    }

    /**
     * @param 对dealEvt进行赋值
     */
    public void setDealEvt(DealEvt dealEvt)
    {
        this.dealEvt = dealEvt;
    }

    /**
     * @return 返回 dealReq
     */
    public DealReq getDealReq()
    {
        return dealReq;
    }

    /**
     * @param 对dealReq进行赋值
     */
    public void setDealReq(DealReq dealReq)
    {
        this.dealReq = dealReq;
    }

    public String getOrderDealOrderId()
    {
        return this.orderDealOrderId;
    }

    public void setOrderDealOrderId(String orderDealOrderId)
    {
        this.orderDealOrderId = orderDealOrderId;
    }

    public String getOrderDealOrderCode()
    {
    	return orderDealOrderCode;
    }

	public void setOrderDealOrderCode(String orderDealOrderCode)
    {
    	this.orderDealOrderCode = orderDealOrderCode;
    }

	public String getOrderDealOrderType()
    {
        return this.orderDealOrderType;
    }

    public void setOrderDealOrderType(String orderDealOrderType)
    {
        this.orderDealOrderType = orderDealOrderType;
    }

	public DealReq getOrderDealReq()
    {
    	return orderDealReq;
    }

	public void setOrderDealReq(DealReq orderDealReq)
    {
    	this.orderDealReq = orderDealReq;
    }

}
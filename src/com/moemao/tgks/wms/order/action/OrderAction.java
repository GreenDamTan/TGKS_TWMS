package com.moemao.tgks.wms.order.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.order.entity.OrderEvt;
import com.moemao.tgks.wms.order.entity.OrderReq;
import com.moemao.tgks.wms.order.service.OrderService;

public class OrderAction extends TGKSAction
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 4665600776642197710L;

    private static Log logger = LogFactory.getLog(OrderAction.class);

    /**
     * ﻿Order业务接口
     */
    private OrderService wms_orderService;

    /**
     * 查询结果集
     */
    private List<OrderEvt> list;

    /**
     * ﻿OrderEvt对象
     */
    private OrderEvt orderEvt;

    /**
     * ﻿Order查询条件封装对象
     */
    private OrderReq orderReq = new OrderReq();

    public String orderManager()
    {
        return SUCCESS;
    }

    public String queryOrder()
    {
        list = wms_orderService.queryOrder(orderReq);
        return SUCCESS;
    }

    public String editOrderPage()
    {
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            orderEvt = wms_orderService.queryOrderById(id);
        }
        return SUCCESS;
    }

    public String editOrder()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "OrderAction.updateOrder");
        
        int result = 0;
        
        if (CommonUtil.isEmpty(orderEvt.getId()))
        {
            result = wms_orderService.addOrder(orderEvt);
            CommonUtil.systemLog("wms/editOrder.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增订单\n%S", orderEvt.toString()));
        }
        else
        {
            result = wms_orderService.updateOrder(orderEvt);
            CommonUtil.systemLog("wms/editOrder.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改订单\n%S", orderEvt.toString()));
        }
        
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "OrderAction.updateOrder");
        return SUCCESS;
    }

    public String deleteOrder()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "OrderAction.deleteOrder");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_orderService.deleteOrder(CommonUtil.stringToList(ids));
        CommonUtil.systemLog("wms/deleteOrder.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除订单\nID:%S", ids));
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "OrderAction.deleteOrder");
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: completeOrder
     * @Description: 交易中→已完成
     * @return
     * @return String 返回类型
     * @throws
     */
    public String completeOrder()
    {
    	CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "OrderAction.completeOrder");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_orderService.completeOrder(CommonUtil.stringToList(ids));
        CommonUtil.systemLog("wms/completeOrder.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("标记订单已完成\nID:%S", ids));
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "OrderAction.completeOrder");
        return SUCCESS;
    }

    /**
     * @return 返回 wms_orderService
     */
    public OrderService getWms_orderService()
    {
        return wms_orderService;
    }

    /**
     * @param 对wms_orderService进行赋值
     */
    public void setWms_orderService(OrderService wms_orderService)
    {
        this.wms_orderService = wms_orderService;
    }

    /**
     * @return 返回 list
     */
    public List<OrderEvt> getList()
    {
        return list;
    }

    /**
     * @param 对list进行赋值
     */
    public void setList(List<OrderEvt> list)
    {
        this.list = list;
    }

    /**
     * @return 返回 orderEvt
     */
    public OrderEvt getOrderEvt()
    {
        return orderEvt;
    }

    /**
     * @param 对orderEvt进行赋值
     */
    public void setOrderEvt(OrderEvt orderEvt)
    {
        this.orderEvt = orderEvt;
    }

    /**
     * @return 返回 orderReq
     */
    public OrderReq getOrderReq()
    {
        return orderReq;
    }

    /**
     * @param 对orderReq进行赋值
     */
    public void setOrderReq(OrderReq orderReq)
    {
        this.orderReq = orderReq;
    }

}
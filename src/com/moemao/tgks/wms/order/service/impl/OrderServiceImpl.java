package com.moemao.tgks.wms.order.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.order.dao.OrderDao;
import com.moemao.tgks.wms.order.entity.OrderEvt;
import com.moemao.tgks.wms.order.entity.OrderReq;
import com.moemao.tgks.wms.order.service.OrderService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class OrderServiceImpl implements OrderService
{
    /**
     * ﻿OrderDao
     */
    private OrderDao wms_orderDao;

    @Override
    public List<OrderEvt> queryOrder(OrderReq orderReq)
    {
        if (CommonUtil.isEmpty(orderReq.getSortSql()))
        {
            orderReq.setSortSql(" t.ID DESC");
        }
        return wms_orderDao.wms_queryOrder(orderReq);
    }

    @Override
    public OrderEvt queryOrderById(String id)
    {
        OrderReq orderReq = new OrderReq();
        orderReq.setId(id);
        OrderEvt orderEvt = null;
        List<OrderEvt> orderList = wms_orderDao.wms_queryOrder(orderReq);
        if (!CommonUtil.isEmpty(orderList))
        {
            orderEvt = orderList.get(0);
        }
        return orderEvt;
    }

    @Override
    public int addOrder(OrderEvt orderEvt)
    {
        orderEvt.setId(WmsUtil.createUniqueID());
        // 订单状态初始化
        orderEvt.setStatus("0");
        return wms_orderDao.wms_addOrder(orderEvt);
    }

    @Override
    public int updateOrder(OrderEvt orderEvt)
    {
        return wms_orderDao.wms_updateOrder(orderEvt);
    }

    @Override
    public int deleteOrder(List<String> ids)
    {
        return wms_orderDao.wms_deleteOrder(ids);
    }

    /**
     * @return 返回 wms_orderDao
     */
    public OrderDao getWms_orderDao()
    {
        return wms_orderDao;
    }

    /**
     * @param 对wms_orderDao进行赋值
     */
    public void setWms_orderDao(OrderDao wms_orderDao)
    {
        this.wms_orderDao = wms_orderDao;
    }

}
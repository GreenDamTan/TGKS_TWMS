package com.moemao.tgks.wms.order.service;

import java.util.List;

import com.moemao.tgks.wms.order.entity.OrderEvt;
import com.moemao.tgks.wms.order.entity.OrderReq;

public interface OrderService
{
    public List<OrderEvt> queryOrder(OrderReq orderReq);

    public OrderEvt queryOrderById(String id);

    public int addOrder(OrderEvt orderEvt);

    public int updateOrder(OrderEvt orderEvt);

    public int deleteOrder(List<String> ids);

}
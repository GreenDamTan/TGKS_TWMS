package com.moemao.tgks.wms.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.order.entity.OrderEvt;
import com.moemao.tgks.wms.order.entity.OrderReq;

public interface OrderDao extends TGKSDao
{
    public List<OrderEvt> wms_queryOrder(OrderReq orderReq)
            throws DataAccessException;

    public int wms_addOrder(OrderEvt orderEvt) throws DataAccessException;

    public int wms_updateOrder(OrderEvt orderEvt) throws DataAccessException;

    public int wms_deleteOrder(List<String> list) throws DataAccessException;
}
package com.moemao.tgks.wms.supplier.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.supplier.dao.SupplierDao;
import com.moemao.tgks.wms.supplier.entity.SupplierEvt;
import com.moemao.tgks.wms.supplier.entity.SupplierReq;
import com.moemao.tgks.wms.supplier.service.SupplierService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class SupplierServiceImpl implements SupplierService
{
    /**
     * ﻿SupplierDao
     */
    private SupplierDao wms_supplierDao;

    @Override
    public List<SupplierEvt> querySupplier(SupplierReq supplierReq)
    {
        if (CommonUtil.isEmpty(supplierReq.getSortSql()))
        {
            supplierReq.setSortSql(" t.ID DESC");
        }
        return wms_supplierDao.wms_querySupplier(supplierReq);
    }

    @Override
    public SupplierEvt querySupplierById(String id)
    {
        SupplierReq supplierReq = new SupplierReq();
        supplierReq.setId(id);
        SupplierEvt supplierEvt = null;
        List<SupplierEvt> supplierList = wms_supplierDao
                .wms_querySupplier(supplierReq);
        if (!CommonUtil.isEmpty(supplierList))
        {
            supplierEvt = supplierList.get(0);
        }
        return supplierEvt;
    }

    @Override
    public int addSupplier(SupplierEvt supplierEvt)
    {
        supplierEvt.setId(WmsUtil.createUniqueID());
        return wms_supplierDao.wms_addSupplier(supplierEvt);
    }

    @Override
    public int updateSupplier(SupplierEvt supplierEvt)
    {
        return wms_supplierDao.wms_updateSupplier(supplierEvt);
    }

    @Override
    public int deleteSupplier(List<String> ids)
    {
        return wms_supplierDao.wms_deleteSupplier(ids);
    }

    /**
     * @return 返回 wms_supplierDao
     */
    public SupplierDao getWms_supplierDao()
    {
        return wms_supplierDao;
    }

    /**
     * @param 对wms_supplierDao进行赋值
     */
    public void setWms_supplierDao(SupplierDao wms_supplierDao)
    {
        this.wms_supplierDao = wms_supplierDao;
    }

}
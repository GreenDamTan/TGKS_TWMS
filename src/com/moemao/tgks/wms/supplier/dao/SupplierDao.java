package com.moemao.tgks.wms.supplier.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.supplier.entity.SupplierEvt;
import com.moemao.tgks.wms.supplier.entity.SupplierReq;

public interface SupplierDao extends TGKSDao
{
    public List<SupplierEvt> wms_querySupplier(SupplierReq supplierReq)
            throws DataAccessException;

    public int wms_addSupplier(SupplierEvt supplierEvt)
            throws DataAccessException;

    public int wms_updateSupplier(SupplierEvt supplierEvt)
            throws DataAccessException;

    public int wms_deleteSupplier(List<String> list) throws DataAccessException;
}
package com.moemao.tgks.wms.supplier.service;

import java.util.List;

import com.moemao.tgks.wms.supplier.entity.SupplierEvt;
import com.moemao.tgks.wms.supplier.entity.SupplierReq;

public interface SupplierService
{
    public List<SupplierEvt> querySupplier(SupplierReq supplierReq);

    public SupplierEvt querySupplierById(String id);

    public int addSupplier(SupplierEvt supplierEvt);

    public int updateSupplier(SupplierEvt supplierEvt);

    public int deleteSupplier(List<String> ids);

}
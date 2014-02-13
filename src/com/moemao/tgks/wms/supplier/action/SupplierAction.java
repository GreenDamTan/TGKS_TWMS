package com.moemao.tgks.wms.supplier.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.supplier.entity.SupplierEvt;
import com.moemao.tgks.wms.supplier.entity.SupplierReq;
import com.moemao.tgks.wms.supplier.service.SupplierService;

public class SupplierAction extends TGKSAction
{

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -2665159657260032465L;

    private static Log logger = LogFactory.getLog(SupplierAction.class);

    /**
     * ﻿Supplier业务接口
     */
    private SupplierService wms_supplierService;

    /**
     * 查询结果集
     */
    private List<SupplierEvt> list;

    /**
     * ﻿SupplierEvt对象
     */
    private SupplierEvt supplierEvt;

    /**
     * ﻿Supplier查询条件封装对象
     */
    private SupplierReq supplierReq = new SupplierReq();

    public String supplierManager()
    {
        return SUCCESS;
    }

    public String querySupplier()
    {
        list = wms_supplierService.querySupplier(supplierReq);
        return SUCCESS;
    }

    public String editSupplierPage()
    {
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            supplierEvt = wms_supplierService.querySupplierById(id);
        }
        
        return SUCCESS;
    }

    public String editSupplier()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "SupplierAction.updateSupplier");
        int result = 0;
        if (CommonUtil.isEmpty(supplierEvt.getId()))
        {
            result = wms_supplierService.addSupplier(supplierEvt);
        }
        else
        {
            result = wms_supplierService.updateSupplier(supplierEvt);
        }
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "SupplierAction.updateSupplier");
        return SUCCESS;
    }

    public String deleteSupplier()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
                "SupplierAction.deleteSupplier");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_supplierService.deleteSupplier(CommonUtil
                .stringToList(ids));
        CommonUtil.infoLog(logger,
                CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
                StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
                "SupplierAction.deleteSupplier");
        return SUCCESS;
    }

    /**
     * @return 返回 wms_supplierService
     */
    public SupplierService getWms_supplierService()
    {
        return wms_supplierService;
    }

    /**
     * @param 对wms_supplierService进行赋值
     */
    public void setWms_supplierService(SupplierService wms_supplierService)
    {
        this.wms_supplierService = wms_supplierService;
    }

    /**
     * @return 返回 list
     */
    public List<SupplierEvt> getList()
    {
        return list;
    }

    /**
     * @param 对list进行赋值
     */
    public void setList(List<SupplierEvt> list)
    {
        this.list = list;
    }

    /**
     * @return 返回 supplierEvt
     */
    public SupplierEvt getSupplierEvt()
    {
        return supplierEvt;
    }

    /**
     * @param 对supplierEvt进行赋值
     */
    public void setSupplierEvt(SupplierEvt supplierEvt)
    {
        this.supplierEvt = supplierEvt;
    }

    /**
     * @return 返回 supplierReq
     */
    public SupplierReq getSupplierReq()
    {
        return supplierReq;
    }

    /**
     * @param 对supplierReq进行赋值
     */
    public void setSupplierReq(SupplierReq supplierReq)
    {
        this.supplierReq = supplierReq;
    }

}
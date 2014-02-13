package com.moemao.tgks.wms.commodity.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.wms.category.entity.CategoryEvt;
import com.moemao.tgks.wms.category.entity.CategoryReq;
import com.moemao.tgks.wms.category.service.CategoryService;
import com.moemao.tgks.wms.commodity.entity.CommodityEvt;
import com.moemao.tgks.wms.commodity.entity.CommodityReq;
import com.moemao.tgks.wms.commodity.service.CommodityService;

public class CommodityAction extends TGKSAction
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 3940284122518570621L;

    private static Log logger = LogFactory.getLog(CommodityAction.class);

    /**
     * ﻿Commodity业务接口
     */
    private CommodityService wms_commodityService;
    
    /**
     * ﻿Category业务接口
     */
    private CategoryService wms_categoryService;

    /**
     * 查询结果集
     */
    private List<CommodityEvt> list;

    /**
     * ﻿CommodityEvt对象
     */
    private CommodityEvt commodityEvt;
    
    /**
     * CategoryEvt查询结果集
     */
    private List<CategoryEvt> categoryList;

    /**
     * ﻿Commodity查询条件封装对象
     */
    private CommodityReq commodityReq = new CommodityReq();

    public String commodityManager()
    {
        categoryList = wms_categoryService.queryCategory(new CategoryReq());
        return SUCCESS;
    }

    public String queryCommodity()
    {
        list = wms_commodityService.queryCommodity(commodityReq);
        return SUCCESS;
    }

    public String editCommodityPage()
    {
        categoryList = wms_categoryService.queryCategory(new CategoryReq());
        
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            commodityEvt = wms_commodityService.queryCommodityById(id);
        }
        
        return SUCCESS;
    }

    public String editCommodity()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CommodityAction.updateCommodity");
        
        int result = 0;
        
        if (CommonUtil.isEmpty(commodityEvt.getId()))
        {
            // id为空，则为新增操作
            result = wms_commodityService.addCommodity(commodityEvt);
        }
        else
        {
            // id存在，则为更新操作
            result = wms_commodityService.updateCommodity(commodityEvt);
        }
        
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CommodityAction.updateCommodity");
        return SUCCESS;
    }

    public String deleteCommodity()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
                "CommodityAction.deleteCommodity");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_commodityService.deleteCommodity(CommonUtil
                .stringToList(ids));
        CommonUtil.infoLog(logger,
                CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
                StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
                "CommodityAction.deleteCommodity");
        return SUCCESS;
    }
    
    /**
     * 
     * @函数功能说明：复制商品
     * @创建者：Ken
     * @创建日期：2012-11-30 下午4:27:01
     * @return String
     * @throws
     */
    public String copyCommodity()
    {
        categoryList = wms_categoryService.queryCategory(new CategoryReq());
        
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            commodityEvt = wms_commodityService.queryCommodityById(id);
            
            if (!CommonUtil.isEmpty(commodityEvt))
            {
                commodityEvt.setId("");
            }
        }
        
        return SUCCESS;
    }

    /**
     * @return 返回 wms_commodityService
     */
    public CommodityService getWms_commodityService()
    {
        return wms_commodityService;
    }

    /**
     * @param 对wms_commodityService进行赋值
     */
    public void setWms_commodityService(CommodityService wms_commodityService)
    {
        this.wms_commodityService = wms_commodityService;
    }

    /**
     * @return 返回 list
     */
    public List<CommodityEvt> getList()
    {
        return list;
    }

    /**
     * @param 对list进行赋值
     */
    public void setList(List<CommodityEvt> list)
    {
        this.list = list;
    }

    /**
     * @return 返回 commodityEvt
     */
    public CommodityEvt getCommodityEvt()
    {
        return commodityEvt;
    }

    /**
     * @param 对commodityEvt进行赋值
     */
    public void setCommodityEvt(CommodityEvt commodityEvt)
    {
        this.commodityEvt = commodityEvt;
    }

    /**
     * @return 返回 commodityReq
     */
    public CommodityReq getCommodityReq()
    {
        return commodityReq;
    }

    /**
     * @param 对commodityReq进行赋值
     */
    public void setCommodityReq(CommodityReq commodityReq)
    {
        this.commodityReq = commodityReq;
    }

    public CategoryService getWms_categoryService()
    {
        return this.wms_categoryService;
    }

    public void setWms_categoryService(CategoryService wms_categoryService)
    {
        this.wms_categoryService = wms_categoryService;
    }

    public List<CategoryEvt> getCategoryList()
    {
        return this.categoryList;
    }

    public void setCategoryList(List<CategoryEvt> categoryList)
    {
        this.categoryList = categoryList;
    }

}
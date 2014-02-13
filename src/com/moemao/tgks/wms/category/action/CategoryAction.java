package com.moemao.tgks.wms.category.action;

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

public class CategoryAction extends TGKSAction
{

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -2398910561918555454L;

    private static Log logger = LogFactory.getLog(CategoryAction.class);

    /**
     * ﻿Category业务接口
     */
    private CategoryService wms_categoryService;

    /**
     * 查询结果集
     */
    private List<CategoryEvt> list;

    /**
     * ﻿CategoryEvt对象
     */
    private CategoryEvt categoryEvt;

    /**
     * ﻿Category查询条件封装对象
     */
    private CategoryReq categoryReq = new CategoryReq();

    public String categoryManager()
    {
        list = wms_categoryService.queryCategory(categoryReq);
        return SUCCESS;
    }

    public String queryCategory()
    {
        list = wms_categoryService.queryCategory(categoryReq);
        return SUCCESS;
    }

    public String editCategoryPage()
    {
        list = wms_categoryService.queryCategory(categoryReq);
        
        String id = this.getRequest().getParameter("id");
        if (!CommonUtil.isEmpty(id))
        {
            categoryEvt = wms_categoryService.queryCategoryById(id);
        }
        
        return SUCCESS;
    }

    public String editCategory()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "CategoryAction.updateCategory");
        int result = 0;
        if (CommonUtil.isEmpty(categoryEvt.getId()))
        {
            result = wms_categoryService.addCategory(categoryEvt);
        }
        else
        {
            result = wms_categoryService.updateCategory(categoryEvt);
        }
        CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "CategoryAction.updateCategory");
        return SUCCESS;
    }

    public String deleteCategory()
    {
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN,
                "CategoryAction.deleteCategory");
        String ids = this.getRequest().getParameter("ids");
        int result = wms_categoryService.deleteCategory(CommonUtil
                .stringToList(ids));
        CommonUtil.infoLog(logger,
                CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS,
                StringUtil.toBeString(result));
        CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT,
                "CategoryAction.deleteCategory");
        return SUCCESS;
    }

    /**
     * @return 返回 wms_categoryService
     */
    public CategoryService getWms_categoryService()
    {
        return wms_categoryService;
    }

    /**
     * @param 对wms_categoryService进行赋值
     */
    public void setWms_categoryService(CategoryService wms_categoryService)
    {
        this.wms_categoryService = wms_categoryService;
    }

    /**
     * @return 返回 list
     */
    public List<CategoryEvt> getList()
    {
        return list;
    }

    /**
     * @param 对list进行赋值
     */
    public void setList(List<CategoryEvt> list)
    {
        this.list = list;
    }

    /**
     * @return 返回 categoryEvt
     */
    public CategoryEvt getCategoryEvt()
    {
        return categoryEvt;
    }

    /**
     * @param 对categoryEvt进行赋值
     */
    public void setCategoryEvt(CategoryEvt categoryEvt)
    {
        this.categoryEvt = categoryEvt;
    }

    /**
     * @return 返回 categoryReq
     */
    public CategoryReq getCategoryReq()
    {
        return categoryReq;
    }

    /**
     * @param 对categoryReq进行赋值
     */
    public void setCategoryReq(CategoryReq categoryReq)
    {
        this.categoryReq = categoryReq;
    }

}
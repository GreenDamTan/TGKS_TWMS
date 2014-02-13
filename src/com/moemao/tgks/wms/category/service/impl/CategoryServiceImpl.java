package com.moemao.tgks.wms.category.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.wms.category.dao.CategoryDao;
import com.moemao.tgks.wms.category.entity.CategoryEvt;
import com.moemao.tgks.wms.category.entity.CategoryReq;
import com.moemao.tgks.wms.category.service.CategoryService;
import com.moemao.tgks.wms.tool.WmsUtil;

public class CategoryServiceImpl implements CategoryService
{
    /**
     * ﻿CategoryDao
     */
    private CategoryDao wms_categoryDao;

    @Override
    public List<CategoryEvt> queryCategory(CategoryReq categoryReq)
    {
        if (CommonUtil.isEmpty(categoryReq.getSortSql()))
        {
            categoryReq.setSortSql(" t.ID DESC");
        }
        return wms_categoryDao.wms_queryCategory(categoryReq);
    }

    @Override
    public CategoryEvt queryCategoryById(String id)
    {
        CategoryReq categoryReq = new CategoryReq();
        categoryReq.setId(id);
        CategoryEvt categoryEvt = null;
        List<CategoryEvt> categoryList = wms_categoryDao
                .wms_queryCategory(categoryReq);
        if (!CommonUtil.isEmpty(categoryList))
        {
            categoryEvt = categoryList.get(0);
        }
        return categoryEvt;
    }

    @Override
    public int addCategory(CategoryEvt categoryEvt)
    {
        categoryEvt.setId(WmsUtil.createUniqueID());
        return wms_categoryDao.wms_addCategory(categoryEvt);
    }

    @Override
    public int updateCategory(CategoryEvt categoryEvt)
    {
        return wms_categoryDao.wms_updateCategory(categoryEvt);
    }

    @Override
    public int deleteCategory(List<String> ids)
    {
        return wms_categoryDao.wms_deleteCategory(ids);
    }

    /**
     * @return 返回 wms_categoryDao
     */
    public CategoryDao getWms_categoryDao()
    {
        return wms_categoryDao;
    }

    /**
     * @param 对wms_categoryDao进行赋值
     */
    public void setWms_categoryDao(CategoryDao wms_categoryDao)
    {
        this.wms_categoryDao = wms_categoryDao;
    }

}
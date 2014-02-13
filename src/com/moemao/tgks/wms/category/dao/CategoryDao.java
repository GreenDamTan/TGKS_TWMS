package com.moemao.tgks.wms.category.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.wms.category.entity.CategoryEvt;
import com.moemao.tgks.wms.category.entity.CategoryReq;

public interface CategoryDao extends TGKSDao
{
    public List<CategoryEvt> wms_queryCategory(CategoryReq categoryReq)
            throws DataAccessException;

    public int wms_addCategory(CategoryEvt categoryEvt)
            throws DataAccessException;

    public int wms_updateCategory(CategoryEvt categoryEvt)
            throws DataAccessException;

    public int wms_deleteCategory(List<String> list) throws DataAccessException;
}
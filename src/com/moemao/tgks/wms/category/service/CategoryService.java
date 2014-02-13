package com.moemao.tgks.wms.category.service;

import java.util.List;

import com.moemao.tgks.wms.category.entity.CategoryEvt;
import com.moemao.tgks.wms.category.entity.CategoryReq;

public interface CategoryService
{
    public List<CategoryEvt> queryCategory(CategoryReq categoryReq);

    public CategoryEvt queryCategoryById(String id);

    public int addCategory(CategoryEvt categoryEvt);

    public int updateCategory(CategoryEvt categoryEvt);

    public int deleteCategory(List<String> ids);

}
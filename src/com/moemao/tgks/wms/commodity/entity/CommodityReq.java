package com.moemao.tgks.wms.commodity.entity;

public class CommodityReq extends CommodityEvt
{

    /**
     * 排序字段
     */
    private String sortSql;
    
    /**
     * 价格区间 开始
     */
    private double priceStart;
    
    /**
     * 价格区间 结束
     */
    private double priceEnd;

    /**
     * @return 返回 排序字段
     */
    public String getSortSql()
    {
        return this.sortSql;
    }

    /**
     * @param 对排序字段进行赋值
     */
    public void setSortSql(String sortSql)
    {
        this.sortSql = sortSql;
    }

    public double getPriceStart()
    {
        return this.priceStart;
    }

    public void setPriceStart(double priceStart)
    {
        this.priceStart = priceStart;
    }

    public double getPriceEnd()
    {
        return this.priceEnd;
    }

    public void setPriceEnd(double priceEnd)
    {
        this.priceEnd = priceEnd;
    }

}
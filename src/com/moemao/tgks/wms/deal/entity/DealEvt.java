package com.moemao.tgks.wms.deal.entity;

import java.util.Date;

public class DealEvt
{
    /**
     * 表唯一主键
     */
    private String id;

    /**
     * 商品信息ID
     */
    private String commodityId;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 订单表ID
     */
    private String orderId;

    /**
     * 交易状态（0 未付款；1 已付款）
     */
    private String status;

    /**
     * 交易类型（0 购入；1 售出）
     */
    private String type;

    /**
     * 交易数量
     */
    private int number;

    /**
     * 交易价格
     */
    private double price;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 付款时间
     */
    private Date dealTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * @return 返回 id
     */
    public String getId()
    {
        return id;
    }

    /**
     * @param 对id进行赋值
     */
    public void setId(String id)
    {
        this.id = id;
    }

    /**
     * @return 返回 commodityId
     */
    public String getCommodityId()
    {
        return commodityId;
    }

    /**
     * @param 对commodityId进行赋值
     */
    public void setCommodityId(String commodityId)
    {
        this.commodityId = commodityId;
    }

    /**
     * @return 返回 commodityName
     */
    public String getCommodityName()
    {
        return commodityName;
    }

    /**
     * @param 对commodityName进行赋值
     */
    public void setCommodityName(String commodityName)
    {
        this.commodityName = commodityName;
    }

    /**
     * @return 返回 orderId
     */
    public String getOrderId()
    {
        return orderId;
    }

    /**
     * @param 对orderId进行赋值
     */
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    /**
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }

    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
    }

    /**
     * @return 返回 type
     */
    public String getType()
    {
        return type;
    }

    /**
     * @param 对type进行赋值
     */
    public void setType(String type)
    {
        this.type = type;
    }

    /**
     * @return 返回 number
     */
    public int getNumber()
    {
        return number;
    }

    /**
     * @param 对number进行赋值
     */
    public void setNumber(int number)
    {
        this.number = number;
    }

    /**
     * @return 返回 price
     */
    public double getPrice()
    {
        return price;
    }

    /**
     * @param 对price进行赋值
     */
    public void setPrice(double price)
    {
        this.price = price;
    }

    /**
     * @return 返回 createTime
     */
    public Date getCreateTime()
    {
        return createTime;
    }

    /**
     * @param 对createTime进行赋值
     */
    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    /**
     * @return 返回 dealTime
     */
    public Date getDealTime()
    {
        return dealTime;
    }

    /**
     * @param 对dealTime进行赋值
     */
    public void setDealTime(Date dealTime)
    {
        this.dealTime = dealTime;
    }

    /**
     * @return 返回 remark
     */
    public String getRemark()
    {
        return remark;
    }

    /**
     * @param 对remark进行赋值
     */
    public void setRemark(String remark)
    {
        this.remark = remark;
    }

}
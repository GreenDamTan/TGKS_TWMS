package com.moemao.tgks.wms.order.entity;

import java.util.Date;

public class OrderEvt
{
    /**
     * 表唯一主键
     */
    private String id;

    /**
     * 自定义订单ID
     */
    private String orderId;

    /**
     * 订单类型（0 购入；1 售出）
     */
    private String type;

    /**
     * 订单状态(0 草稿；1 交易中；2 已完成)
     */
    private String status;

    /**
     * 账目类型(0 私人；1 对公)
     */
    private String accountType;

    /**
     * 发票类型
     */
    private String invoiceType;
    
    /**
     * 发票编号
     */
    private String invoice;

    /**
     * 创建时间
     */
    private Date createTime;

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
     * @return 返回 accountType
     */
    public String getAccountType()
    {
        return accountType;
    }

    /**
     * @param 对accountType进行赋值
     */
    public void setAccountType(String accountType)
    {
        this.accountType = accountType;
    }

    public String getInvoiceType()
    {
        return this.invoiceType;
    }

    public void setInvoiceType(String invoiceType)
    {
        this.invoiceType = invoiceType;
    }

    /**
     * @return 返回 invoice
     */
    public String getInvoice()
    {
        return invoice;
    }

    /**
     * @param 对invoice进行赋值
     */
    public void setInvoice(String invoice)
    {
        this.invoice = invoice;
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
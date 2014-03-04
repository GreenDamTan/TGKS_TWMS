package com.moemao.tgks.wms.currencydetail.entity;

import java.util.Date;

public class CurrencyDetailEvt
{
	/**
	 * 表唯一主键
	 */
	private String id;
	
	/**
	 * 货币ID
	 */
	private String currencyId;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 币种
	 */
	private String type;
	
	/**
	 * 缩写
	 */
	private String code;
	
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 订单ID
	 */
	private String orderId;
	
	/**
	 * 订单编号
	 */
	private String orderOrderId;
	
	/**
	 * 交易ID
	 */
	private String dealId;
	
	/**
	 * 交易数量
	 */
	private double num;
	
	/**
	 * 创建时间
	 */
	private Date creaTime;
	
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
	 * @return 返回 currencyId
	 */
	public String getCurrencyId()
	{
		return currencyId;
	}
	
	/**
	 * @param 对currencyId进行赋值
	 */
	public void setCurrencyId(String currencyId)
	{
		this.currencyId = currencyId;
	}
	
	/**
	 * @return 返回 name
	 */
	public String getName()
	{
		return name;
	}
	
	/**
	 * @param 对name进行赋值
	 */
	public void setName(String name)
	{
		this.name = name;
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
	 * @return 返回 code
	 */
	public String getCode()
	{
		return code;
	}
	
	/**
	 * @param 对code进行赋值
	 */
	public void setCode(String code)
	{
		this.code = code;
	}
	
	/**
	 * @return 返回 unit
	 */
	public String getUnit()
	{
		return unit;
	}
	
	/**
	 * @param 对unit进行赋值
	 */
	public void setUnit(String unit)
	{
		this.unit = unit;
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
	 * @return 返回 orderOrderId
	 */
	public String getOrderOrderId()
	{
		return orderOrderId;
	}
	
	/**
	 * @param 对orderOrderId进行赋值
	 */
	public void setOrderOrderId(String orderOrderId)
	{
		this.orderOrderId = orderOrderId;
	}
	
	/**
	 * @return 返回 dealId
	 */
	public String getDealId()
	{
		return dealId;
	}
	
	/**
	 * @param 对dealId进行赋值
	 */
	public void setDealId(String dealId)
	{
		this.dealId = dealId;
	}
	
	/**
	 * @return 返回 num
	 */
	public double getNum()
	{
		return num;
	}
	
	/**
	 * @param 对num进行赋值
	 */
	public void setNum(double num)
	{
		this.num = num;
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

	public Date getCreaTime()
    {
    	return creaTime;
    }

	public void setCreaTime(Date creaTime)
    {
    	this.creaTime = creaTime;
    }
	
}
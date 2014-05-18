package com.moemao.tgks.wms.express.entity;

import java.util.Date;

public class ExpressEvt
{
	/**
	 * 表唯一主键
	 */
	private String id;
	
	/**
	 * 快递公司ID
	 */
	private String ecid;
	
	/**
	 * 快递名称
	 */
	private String ecName;
	
	/**
	 * 快递网站
	 */
	private String ecWeb;
	
	/**
	 * 快递单号
	 */
	private String number;
	
	/**
	 * 送货地址
	 */
	private String address;
	
	/**
	 * 区域 非表字段
	 */
	private String area;
	
	/**
	 * 重量
	 */
	private double weight;
	
	/**
	 * 价格
	 */
	private double price;
	
	/**
	 * 订单编号
	 */
	private String orderCode;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 备注
	 */
	private String remark;
	
	@Override
	public String toString()
	{
	return String.format("id:%S\necid:%S\necName:%S\necWeb:%S\nnumber:%S\naddress:%S\nweight:%S\nprice:%S\norderCode:%S\ncreateTime:%S\nremark:%S\n", id, ecid, ecName, ecWeb, number, address, weight, price, orderCode, createTime, remark);
	}
	
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
	 * @return 返回 ecid
	 */
	public String getEcid()
	{
		return ecid;
	}
	
	/**
	 * @param 对ecid进行赋值
	 */
	public void setEcid(String ecid)
	{
		this.ecid = ecid;
	}
	
	/**
	 * @return 返回 ecName
	 */
	public String getEcName()
	{
		return ecName;
	}
	
	/**
	 * @param 对ecName进行赋值
	 */
	public void setEcName(String ecName)
	{
		this.ecName = ecName;
	}
	
	/**
	 * @return 返回 ecWeb
	 */
	public String getEcWeb()
	{
		return ecWeb;
	}
	
	/**
	 * @param 对ecWeb进行赋值
	 */
	public void setEcWeb(String ecWeb)
	{
		this.ecWeb = ecWeb;
	}
	
	/**
	 * @return 返回 number
	 */
	public String getNumber()
	{
		return number;
	}
	
	/**
	 * @param 对number进行赋值
	 */
	public void setNumber(String number)
	{
		this.number = number;
	}
	
	/**
	 * @return 返回 address
	 */
	public String getAddress()
	{
		return address;
	}
	
	/**
	 * @param 对address进行赋值
	 */
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	/**
	 * @return 返回 weight
	 */
	public double getWeight()
	{
		return weight;
	}
	
	/**
	 * @param 对weight进行赋值
	 */
	public void setWeight(double weight)
	{
		this.weight = weight;
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
	 * @return 返回 orderCode
	 */
	public String getOrderCode()
	{
		return orderCode;
	}
	
	/**
	 * @param 对orderCode进行赋值
	 */
	public void setOrderCode(String orderCode)
	{
		this.orderCode = orderCode;
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

	public String getArea()
    {
    	return area;
    }

	public void setArea(String area)
    {
    	this.area = area;
    }
	
}
package com.moemao.tgks.wms.expressprice.entity;

public class ExpressPriceEvt
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
	 * 快递名称 非表字段
	 */
	private String ecName;
	
	/**
	 * 地区
	 */
	private String area;
	
	/**
	 * 首重
	 */
	private double first;
	
	/**
	 * 超重每公斤
	 */
	private double over;
	
	@Override
	public String toString()
	{
	return String.format("id:%S\necid:%S\narea:%S\nfirst:%S\nover:%S\n", id, ecid, area, first, over);
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
	 * @return 返回 area
	 */
	public String getArea()
	{
		return area;
	}
	
	/**
	 * @param 对area进行赋值
	 */
	public void setArea(String area)
	{
		this.area = area;
	}
	
	/**
	 * @return 返回 first
	 */
	public double getFirst()
	{
		return first;
	}
	
	/**
	 * @param 对first进行赋值
	 */
	public void setFirst(double first)
	{
		this.first = first;
	}
	
	/**
	 * @return 返回 over
	 */
	public double getOver()
	{
		return over;
	}
	
	/**
	 * @param 对over进行赋值
	 */
	public void setOver(double over)
	{
		this.over = over;
	}

	public String getEcName()
    {
    	return ecName;
    }

	public void setEcName(String ecName)
    {
    	this.ecName = ecName;
    }
	
}
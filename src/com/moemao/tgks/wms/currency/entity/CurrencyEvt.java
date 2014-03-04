package com.moemao.tgks.wms.currency.entity;

public class CurrencyEvt
{
	/**
	 * 表唯一主键
	 */
	private String id;
	
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
	 * 数量
	 */
	private double num;
	
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
	
}
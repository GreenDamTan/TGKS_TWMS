package com.moemao.tgks.wms.expresscompany.entity;

public class ExpressCompanyEvt
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
	 * 电话
	 */
	private String tel;
	
	/**
	 * 手机
	 */
	private String mobile;
	
	/**
	 * 网站
	 */
	private String web;
	
	/**
	 * 备注
	 */
	private String remark;
	
	@Override
	public String toString()
	{
		return String.format("id:%S\nname:%S\ntel:%S\nmobile:%S\nweb:%S\nremark:%S\n", id, name, tel, mobile, web, remark);
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
	 * @return 返回 tel
	 */
	public String getTel()
	{
		return tel;
	}
	
	/**
	 * @param 对tel进行赋值
	 */
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	/**
	 * @return 返回 mobile
	 */
	public String getMobile()
	{
		return mobile;
	}
	
	/**
	 * @param 对mobile进行赋值
	 */
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	
	/**
	 * @return 返回 web
	 */
	public String getWeb()
	{
		return web;
	}
	
	/**
	 * @param 对web进行赋值
	 */
	public void setWeb(String web)
	{
		this.web = web;
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
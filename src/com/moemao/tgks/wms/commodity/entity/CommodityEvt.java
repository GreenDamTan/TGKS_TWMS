package com.moemao.tgks.wms.commodity.entity;

import java.util.Date;

public class CommodityEvt
{
    /**
     * 表唯一主键
     */
    private String id;
    
    /**
     * 商品编号
     */
    private String code;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 库存数目
     */
    private int number;

    /**
     * 商品类别
     */
    private String categoryId;

    /**
     * 预览图片
     */
    private String images;

    /**
     * 品牌
     */
    private String brand;

    /**
     * 型号
     */
    private String type;

    /**
     * 详细信息
     */
    private String details;

    /**
     * 供货商ID
     */
    private String supplierId;

    /**
     * 进货网址
     */
    private String url;

    /**
     * 进货价
     */
    private double price;

    /**
     * 网上参考报价
     */
    private double netPrice;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 备注
     */
    private String remark;
    
    /**
     * 分类名称
     */
    private String categoryName;
    
    @Override
    public String toString()
    {
    	return String.format("id:%S\ncode:%S\nname:%S\nnumber:%S\ncategoryId:%S\nimages:%S\nbrand:%S\ntype:%S\ndetails:%S\nsupplierId:%S\nurl:%S\nprice:%S\nnetPrice:%S\ncreateTime:%S\nremark:%S\n", id, code, name, number, categoryId, images, brand, type, details, supplierId, url, price, netPrice, createTime, remark);
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

    public String getCode()
    {
        return this.code;
    }

    public void setCode(String code)
    {
        this.code = code;
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
     * @return 返回 categoryId
     */
    public String getCategoryId()
    {
        return categoryId;
    }

    /**
     * @param 对categoryId进行赋值
     */
    public void setCategoryId(String categoryId)
    {
        this.categoryId = categoryId;
    }

    /**
     * @return 返回 images
     */
    public String getImages()
    {
        return images;
    }

    /**
     * @param 对images进行赋值
     */
    public void setImages(String images)
    {
        this.images = images;
    }

    /**
     * @return 返回 brand
     */
    public String getBrand()
    {
        return brand;
    }

    /**
     * @param 对brand进行赋值
     */
    public void setBrand(String brand)
    {
        this.brand = brand;
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
     * @return 返回 details
     */
    public String getDetails()
    {
        return details;
    }

    /**
     * @param 对details进行赋值
     */
    public void setDetails(String details)
    {
        this.details = details;
    }

    /**
     * @return 返回 supplierId
     */
    public String getSupplierId()
    {
        return supplierId;
    }

    /**
     * @param 对supplierId进行赋值
     */
    public void setSupplierId(String supplierId)
    {
        this.supplierId = supplierId;
    }

    /**
     * @return 返回 url
     */
    public String getUrl()
    {
        return url;
    }

    /**
     * @param 对url进行赋值
     */
    public void setUrl(String url)
    {
        this.url = url;
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
     * @return 返回 netPrice
     */
    public double getNetPrice()
    {
        return netPrice;
    }

    /**
     * @param 对netPrice进行赋值
     */
    public void setNetPrice(double netPrice)
    {
        this.netPrice = netPrice;
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

    public String getCategoryName()
    {
        return this.categoryName;
    }

    public void setCategoryName(String categoryName)
    {
        this.categoryName = categoryName;
    }

}
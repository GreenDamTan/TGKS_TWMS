package com.moemao.tgks.wms.category.entity;

public class CategoryEvt
{
    /**
     * 表唯一主键
     */
    private String id;

    /**
     * 类别名称
     */
    private String name;

    /**
     * 上级类别ID
     */
    private String preId;
    
    /**
     * 上级类别名称
     */
    private String preName;

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
     * @return 返回 preId
     */
    public String getPreId()
    {
        return preId;
    }

    /**
     * @param 对preId进行赋值
     */
    public void setPreId(String preId)
    {
        this.preId = preId;
    }

    public String getPreName()
    {
        return this.preName;
    }

    public void setPreName(String preName)
    {
        this.preName = preName;
    }
}
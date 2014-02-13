package com.moemao.tgks.wms.tool;

import com.moemao.tgks.common.tool.IDUtil;

public class WmsUtil
{
    /**
     * WMS模块唯一标识生成
     * 根据传入的模块标识生成24位的ID
     * 
     * @return
     */
    public static String createUniqueID()
    {
        return IDUtil.createUniqueID(WmsConstant.MODULE_TAG);
    }
}

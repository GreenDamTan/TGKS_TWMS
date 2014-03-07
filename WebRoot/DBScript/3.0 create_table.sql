--
-- 表的结构 `t_tgks_wms_category`
--
DROP TABLE IF EXISTS `t_tgks_wms_category`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_category` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `preid` varchar(30) NOT NULL COMMENT '上级类别ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类别表';

--
-- 表的结构 `t_tgks_wms_commodity`
--
DROP TABLE IF EXISTS `t_tgks_wms_commodity`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_commodity` (
  `id` varchar(30) character set utf8 collate utf8_bin NOT NULL COMMENT '表唯一主键',
  `code` varchar(30) NOT NULL COMMENT '商品编号',
  `name` varchar(200) NOT NULL COMMENT '商品名称',
  `number` int(10) NOT NULL default '0' COMMENT '库存数目',
  `categoryid` varchar(30) NOT NULL COMMENT '商品类别',
  `images` varchar(2000) default NULL COMMENT '预览图片',
  `brand` varchar(50) default NULL COMMENT '品牌',
  `type` varchar(100) default NULL COMMENT '型号',
  `details` varchar(3000) default NULL COMMENT '详细信息',
  `supplierid` varchar(30) NOT NULL COMMENT '供货商ID',
  `url` varchar(256) default NULL COMMENT '进货网址',
  `price` double NOT NULL default '0' COMMENT '定价',
  `netprice` double NOT NULL default '0' COMMENT '网上参考报价',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品信息表';

--
-- 表的结构 `t_tgks_wms_deal`
--
DROP TABLE IF EXISTS `t_tgks_wms_deal`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_deal` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `commodityid` varchar(30) NOT NULL COMMENT '商品信息ID',  
  `commoditycode` varchar(30) NOT NULL COMMENT '商品信息编号',
  `commodityname` varchar(200) NOT NULL COMMENT '商品名称',
  `orderid` varchar(30) NOT NULL COMMENT '订单表ID',
  `paystatus` varchar(3) NOT NULL default '0' COMMENT '交易状态（0 未付款；1 已付款；2 已收款）',  
  `storestatus` varchar(3) NOT NULL default '0' COMMENT '交易状态（0 未过库；1 已入库；2 已出库）',
  `type` varchar(3) NOT NULL COMMENT '交易类型（0 购入；1 售出；2 耗损）',
  `number` int(10) NOT NULL default '0' COMMENT '交易数量',
  `price` double NOT NULL default '0' COMMENT '交易价格',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `dealtime` timestamp NULL default NULL COMMENT '付款时间',
  `remark` varchar(500) default NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品交易表';

--
-- 表的结构 `t_tgks_wms_order`
--
DROP TABLE IF EXISTS `t_tgks_wms_order`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_order` (
  `id` varchar(30) NOT NULL COMMENT '订单ID',
  `orderid` varchar(30) default NULL COMMENT '自定义订单ID',
  `type` varchar(3) NOT NULL COMMENT '订单类型（0 购入；1 售出）',
  `status` varchar(3) NOT NULL default '0' COMMENT '订单状态(0 草稿；1 交易中；2 已完成)',
  `accounttype` varchar(3) NOT NULL COMMENT '账目类型(0 私人；1 对公)',
  `invoicetype` varchar(3) default '0' COMMENT '发票类型(0 无票；1 普通发票；2 增值税发票)',
  `invoice` varchar(50) default NULL COMMENT '发票编号',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单记录表';

--
-- 表的结构 `t_tgks_wms_supplier`
--
DROP TABLE IF EXISTS `t_tgks_wms_supplier`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_supplier` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `name` varchar(100) NOT NULL COMMENT '供货商名称',
  `address` varchar(200) default NULL COMMENT '地址',
  `account` varchar(100) default NULL COMMENT '银行账户',
  `bank` varchar(200) default NULL COMMENT '开户银行',
  `taxnumber` varchar(50) default NULL COMMENT '税号',
  `details` varchar(1000) default NULL COMMENT '详细信息',
  `category` varchar(500) default NULL COMMENT '主营商品类别',
  `url` varchar(100) default NULL COMMENT '网址URL',
  `person` varchar(50) NOT NULL COMMENT '联系人',
  `sex` varchar(5) NOT NULL COMMENT '性别',
  `age` varchar(5) NOT NULL COMMENT '年龄',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `mobile` varchar(30) default NULL COMMENT '手机',
  `tel` varchar(30) default NULL COMMENT '电话',
  `fax` varchar(30) default NULL COMMENT '传真',
  `qq` varchar(30) default NULL COMMENT 'QQ',
  `alww` varchar(30) default NULL COMMENT '阿里旺旺',
  `msn` varchar(30) default NULL COMMENT 'MSN',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='供货商信息表';

--
-- 表的结构 `t_tgks_wms_customer`
--
DROP TABLE IF EXISTS `t_tgks_wms_customer`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_customer` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `name` varchar(100) NOT NULL COMMENT '客户名称',
  `address` varchar(200) default NULL COMMENT '地址',
  `account` varchar(100) default NULL COMMENT '银行账户',
  `bank` varchar(200) default NULL COMMENT '开户银行',
  `taxnumber` varchar(50) default NULL COMMENT '税号',
  `details` varchar(1000) default NULL COMMENT '详细信息',
  `category` varchar(500) default NULL COMMENT '主营商品类别',
  `url` varchar(100) default NULL COMMENT '网址URL',
  `person` varchar(50) NOT NULL COMMENT '联系人',
  `sex` varchar(5) NOT NULL COMMENT '性别',
  `age` varchar(5) NOT NULL COMMENT '年龄',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `mobile` varchar(30) default NULL COMMENT '手机',
  `tel` varchar(30) default NULL COMMENT '电话',
  `fax` varchar(30) default NULL COMMENT '传真',
  `qq` varchar(30) default NULL COMMENT 'QQ',
  `alww` varchar(30) default NULL COMMENT '阿里旺旺',
  `msn` varchar(30) default NULL COMMENT 'MSN',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户信息表';



--
-- 表的结构 `t_tgks_wms_currency`
--
DROP TABLE IF EXISTS `t_tgks_wms_currency`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_currency` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键（0 私款RMB；1 公款RMB）',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `type` varchar(10) NOT NULL COMMENT '币种',
  `code` varchar(10) default NULL COMMENT '缩写',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `num` double NOT NULL default '0' COMMENT '交易数量',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货币信息表';


--
-- 表的结构 `t_tgks_wms_currencydetail`
--
DROP TABLE IF EXISTS `t_tgks_wms_currencydetail`;
CREATE TABLE IF NOT EXISTS `t_tgks_wms_currencydetail` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `currencyid` varchar(30) NOT NULL COMMENT '货币ID（0 私款RMB；1 公款RMB）',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `type` varchar(10) NOT NULL COMMENT '币种',
  `code` varchar(10) default NULL COMMENT '缩写',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `orderId` varchar(10) NOT NULL COMMENT '订单ID',
  `orderOrderId` varchar(10) NOT NULL COMMENT '订单编号',
  `dealId` varchar(10) NOT NULL COMMENT '交易ID',
  `num` double NOT NULL default '0' COMMENT '交易数量',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货币详情信息表';
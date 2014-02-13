--
-- 转存表中的数据 't_tgks_common_menu'
--
INSERT INTO t_tgks_common_menu (id, preid, `name`, `status`, url, level, sort) VALUES
('COMM20121111021441000000', '0', '营销管理系统', '1', '#', '1', '2'),
('COMM20121111021441000001', 'COMM20121111021441000000', '订单交易管理', '1', '../wms/orderManager.action', '2', '2'),
('COMM20121111021441000002', 'COMM20121111021441000000', '库存管理', '1', '../wms/commodityManager.action', '2', '2'),
('COMM20121111021441000003', 'COMM20121111021441000000', '供货商管理', '1', '../wms/supplierManager.action', '2', '2'),
('COMM20121111021441000004', 'COMM20121111021441000000', '销售管理', '1', '../wms/categoryManager.action', '2', '2');
-- ----------------------------
-- 新增我分享出去的功能
-- ----------------------------
ALTER TABLE `panel_share`
ADD COLUMN `granter` varchar(255) NULL COMMENT '分享人' AFTER `target_id`;


-- ----------------------------
-- Table structure for panel_link_mapping
-- ----------------------------
CREATE TABLE `panel_link_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT '仪表板ID',
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 ;


-- ----------------------------
-- 策略模式优化发送消息
-- ----------------------------
ALTER TABLE `sys_msg_channel`
ADD COLUMN `service_name` varchar(255) NULL COMMENT '策略名称' AFTER `channel_name`;


UPDATE `sys_msg_channel` SET `service_name` = 'sendStation' WHERE `msg_channel_id` = 1;
INSERT INTO `sys_msg_channel`(`msg_channel_id`, `channel_name`, `service_name`) VALUES (2, 'webmsg.channel_email_msg', 'sendEmail');
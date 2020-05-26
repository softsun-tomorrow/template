/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : event_db

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 13/05/2020 14:43:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '系统首页', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '系统设置', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户管理', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作管理', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, '事件管理', 'fa-folder-open', NULL, NULL, '2020-05-12 07:02:21', '2020-05-12 07:03:14');
INSERT INTO `admin_menu` VALUES (9, 8, 10, '事件列表', 'fa-align-justify', 'events', NULL, '2020-05-12 07:04:08', '2020-05-12 08:47:16');
INSERT INTO `admin_menu` VALUES (10, 8, 9, '影响范围', 'fa-area-chart', 'event-ranges', NULL, '2020-05-12 08:47:03', '2020-05-12 08:47:16');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 316 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-12 06:38:44', '2020-05-12 06:38:44');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:40:47', '2020-05-12 06:40:47');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-05-12 06:42:39', '2020-05-12 06:42:39');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:42:56', '2020-05-12 06:42:56');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:43:02', '2020-05-12 06:43:02');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-05-12 06:44:25', '2020-05-12 06:44:25');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:44:34', '2020-05-12 06:44:34');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:44:36', '2020-05-12 06:44:36');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:44:38', '2020-05-12 06:44:38');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:44:39', '2020-05-12 06:44:39');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:44:46', '2020-05-12 06:44:46');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-12 06:47:26', '2020-05-12 06:47:26');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-12 06:48:08', '2020-05-12 06:48:08');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-12 06:48:31', '2020-05-12 06:48:31');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:52:05', '2020-05-12 06:52:05');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:52:08', '2020-05-12 06:52:08');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-05-12 06:53:56', '2020-05-12 06:53:56');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-05-12 06:54:00', '2020-05-12 06:54:00');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:03', '2020-05-12 06:54:03');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:05', '2020-05-12 06:54:05');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:08', '2020-05-12 06:54:08');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:22', '2020-05-12 06:54:22');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:28', '2020-05-12 06:54:28');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:39', '2020-05-12 06:54:39');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 06:54:56', '2020-05-12 06:54:56');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4e8b\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa-folder-open\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\"}', '2020-05-12 07:02:21', '2020-05-12 07:02:21');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:02:21', '2020-05-12 07:02:21');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:02:23', '2020-05-12 07:02:23');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:02:25', '2020-05-12 07:02:25');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:02:32', '2020-05-12 07:02:32');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:02:53', '2020-05-12 07:02:53');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:03:02', '2020-05-12 07:03:02');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2020-05-12 07:03:14', '2020-05-12 07:03:14');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:03:14', '2020-05-12 07:03:14');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:03:17', '2020-05-12 07:03:17');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:03:20', '2020-05-12 07:03:20');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:03:22', '2020-05-12 07:03:22');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:03:30', '2020-05-12 07:03:30');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4e8b\\u4ef6\\u5217\\u8868\",\"icon\":\"fa-align-justify\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\"}', '2020-05-12 07:04:08', '2020-05-12 07:04:08');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:04:08', '2020-05-12 07:04:08');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:04:10', '2020-05-12 07:04:10');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:04:18', '2020-05-12 07:04:18');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:04:22', '2020-05-12 07:04:22');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-12 07:32:50', '2020-05-12 07:32:50');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:33:00', '2020-05-12 07:33:00');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:36:18', '2020-05-12 07:36:18');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:36:21', '2020-05-12 07:36:21');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:36:25', '2020-05-12 07:36:25');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:36:31', '2020-05-12 07:36:31');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:36:42', '2020-05-12 07:36:42');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:37:14', '2020-05-12 07:37:14');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4e8b\\u4ef6\\u5217\\u8868\",\"icon\":\"fa-align-justify\",\"uri\":\"event\",\"roles\":[null],\"permission\":null,\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/auth\\/menu\"}', '2020-05-12 07:37:24', '2020-05-12 07:37:24');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:37:24', '2020-05-12 07:37:24');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:37:28', '2020-05-12 07:37:28');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:37:34', '2020-05-12 07:37:34');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:37:43', '2020-05-12 07:37:43');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:38:38', '2020-05-12 07:38:38');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:38:41', '2020-05-12 07:38:41');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4e8b\\u4ef6\\u5217\\u8868\",\"icon\":\"fa-align-justify\",\"uri\":\"events\",\"roles\":[null],\"permission\":null,\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/auth\\/menu\"}', '2020-05-12 07:38:46', '2020-05-12 07:38:46');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 07:38:46', '2020-05-12 07:38:46');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-12 07:39:31', '2020-05-12 07:39:31');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:39:42', '2020-05-12 07:39:42');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-12 07:42:23', '2020-05-12 07:42:23');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-12 07:42:35', '2020-05-12 07:42:35');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-12 07:44:39', '2020-05-12 07:44:39');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:45:06', '2020-05-12 07:45:06');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 07:46:49', '2020-05-12 07:46:49');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:06:28', '2020-05-12 08:06:28');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:06:40', '2020-05-12 08:06:40');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"11\"}', '2020-05-12 08:06:47', '2020-05-12 08:06:47');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/events', 'GET', '127.0.0.1', '{\"title\":\"11\"}', '2020-05-12 08:07:10', '2020-05-12 08:07:10');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/events', 'GET', '127.0.0.1', '{\"title\":\"11\"}', '2020-05-12 08:08:25', '2020-05-12 08:08:25');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/events', 'GET', '127.0.0.1', '{\"title\":\"11\"}', '2020-05-12 08:09:52', '2020-05-12 08:09:52');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/events', 'GET', '127.0.0.1', '{\"title\":\"11\"}', '2020-05-12 08:12:15', '2020-05-12 08:12:15');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/events', 'GET', '127.0.0.1', '{\"title\":\"11\"}', '2020-05-12 08:13:37', '2020-05-12 08:13:37');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:13:50', '2020-05-12 08:13:50');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:20:12', '2020-05-12 08:20:12');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:24:57', '2020-05-12 08:24:57');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:28:04', '2020-05-12 08:28:04');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:28:46', '2020-05-12 08:28:46');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:31:50', '2020-05-12 08:31:50');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:34:50', '2020-05-12 08:34:50');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:35:16', '2020-05-12 08:35:16');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:45:12', '2020-05-12 08:45:12');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:45:53', '2020-05-12 08:45:53');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5f71\\u54cd\\u8303\\u56f4\",\"icon\":\"fa-area-chart\",\"uri\":\"event-ranges\",\"roles\":[null],\"permission\":null,\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\"}', '2020-05-12 08:47:03', '2020-05-12 08:47:03');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 08:47:03', '2020-05-12 08:47:03');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":9}]}]\"}', '2020-05-12 08:47:16', '2020-05-12 08:47:16');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:47:16', '2020-05-12 08:47:16');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-12 08:47:20', '2020-05-12 08:47:20');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:47:23', '2020-05-12 08:47:23');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:49:55', '2020-05-12 08:49:55');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:50:49', '2020-05-12 08:50:49');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:50:53', '2020-05-12 08:50:53');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/event-ranges', 'POST', '127.0.0.1', '{\"name\":\"\\u5168\\u4f01\\u4e1a\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\"}', '2020-05-12 08:51:07', '2020-05-12 08:51:07');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:51:08', '2020-05-12 08:51:08');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/event-ranges', 'POST', '127.0.0.1', '{\"name\":\"\\u5168\\u4f01\\u4e1a\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\"}', '2020-05-12 08:55:10', '2020-05-12 08:55:10');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:55:10', '2020-05-12 08:55:10');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:55:16', '2020-05-12 08:55:16');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:55:23', '2020-05-12 08:55:23');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:56:24', '2020-05-12 08:56:24');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '[]', '2020-05-12 08:56:28', '2020-05-12 08:56:28');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 08:56:31', '2020-05-12 08:56:31');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:58:33', '2020-05-12 08:58:33');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 08:59:35', '2020-05-12 08:59:35');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 09:01:46', '2020-05-12 09:01:46');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:03:05', '2020-05-12 09:03:05');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:03:19', '2020-05-12 09:03:19');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/event-ranges', 'POST', '127.0.0.1', '{\"name\":\"\\u540d\\u6c14\\u5bb6\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\"}', '2020-05-12 09:03:30', '2020-05-12 09:03:30');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 09:03:30', '2020-05-12 09:03:30');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:03:32', '2020-05-12 09:03:32');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/event-ranges', 'POST', '127.0.0.1', '{\"name\":\"\\u7f8e\\u5bb6\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\"}', '2020-05-12 09:03:41', '2020-05-12 09:03:41');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 09:03:41', '2020-05-12 09:03:41');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/event-ranges/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:03:46', '2020-05-12 09:03:46');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/event-ranges', 'POST', '127.0.0.1', '{\"name\":\"\\u6280\\u672f\\u4e2d\\u5fc3\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\"}', '2020-05-12 09:04:25', '2020-05-12 09:04:25');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 09:04:25', '2020-05-12 09:04:25');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:04:31', '2020-05-12 09:04:31');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:04:37', '2020-05-12 09:04:37');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:06:13', '2020-05-12 09:06:13');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:06:14', '2020-05-12 09:06:14');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:12:07', '2020-05-12 09:12:07');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:12:31', '2020-05-12 09:12:31');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:12:55', '2020-05-12 09:12:55');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:20:42', '2020-05-12 09:20:42');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:21:46', '2020-05-12 09:21:46');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:36:43', '2020-05-12 09:36:43');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:42:02', '2020-05-12 09:42:02');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:42:39', '2020-05-12 09:42:39');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/event-ranges/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:42:46', '2020-05-12 09:42:46');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/event-ranges/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u5168\\u4f01\\u4e1a1\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\"}', '2020-05-12 09:42:50', '2020-05-12 09:42:50');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '[]', '2020-05-12 09:42:51', '2020-05-12 09:42:51');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/event-ranges/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:42:55', '2020-05-12 09:42:55');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/event-ranges/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:42:58', '2020-05-12 09:42:58');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/event-ranges/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u5168\\u4f01\\u4e1a\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/event-ranges\\/1\"}', '2020-05-12 09:43:02', '2020-05-12 09:43:02');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/event-ranges/1', 'GET', '127.0.0.1', '[]', '2020-05-12 09:43:02', '2020-05-12 09:43:02');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:43:04', '2020-05-12 09:43:04');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:43:07', '2020-05-12 09:43:07');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:43:31', '2020-05-12 09:43:31');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:43:52', '2020-05-12 09:43:52');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-12 09:43:54', '2020-05-12 09:43:54');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:44:09', '2020-05-12 09:44:09');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:44:29', '2020-05-12 09:44:29');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:47:21', '2020-05-12 09:47:21');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:47:38', '2020-05-12 09:47:38');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:49:10', '2020-05-12 09:49:10');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:49:20', '2020-05-12 09:49:20');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:49:34', '2020-05-12 09:49:34');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:51:27', '2020-05-12 09:51:27');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"20200511VCC\\u7cfb\\u7edf\\u6545\\u969c\\u901a\\u62a5\",\"level\":\"2\",\"desc\":\"2020\\u5e7405\\u670811\\u65e519\\uff1a20~ 2020\\u5e7405\\u670811\\u65e520\\uff1a00 \\u4f01\\u4e1a\\u53cd\\u9988\\u5fae\\u4fe1\\u670d\\u52a1\\u4e0d\\u7a33\\u5b9a\\uff0c\\u9ad8\\u6982\\u7387\\u51fa\\u73b0\\u767d\\u5c4f\\u3001\\u8bbf\\u95ee\\u5931\\u8d25\\u548c\\u7b49\\u5f85\\u52a0\\u8f7d\\u7684\\u60c5\\u51b5\",\"range\":\"2\",\"start_time\":\"2020-05-12 08:25:00\",\"end_time\":\"2020-05-13 12:30:00\",\"status\":\"0\",\"_token\":\"Dtf5nqQf5yeNKkJFn0o1nrHzTlz9jfYULgrbgUSg\"}', '2020-05-12 09:52:57', '2020-05-12 09:52:57');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 09:52:58', '2020-05-12 09:52:58');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:00:34', '2020-05-12 10:00:34');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:15', '2020-05-12 10:04:15');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:19', '2020-05-12 10:04:19');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:30', '2020-05-12 10:04:30');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:31', '2020-05-12 10:04:31');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:31', '2020-05-12 10:04:31');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:32', '2020-05-12 10:04:32');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:38', '2020-05-12 10:04:38');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:04:38', '2020-05-12 10:04:38');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:05:23', '2020-05-12 10:05:23');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:07:49', '2020-05-12 10:07:49');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:10:26', '2020-05-12 10:10:26');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:10:36', '2020-05-12 10:10:36');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-12 10:10:44', '2020-05-12 10:10:44');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-13 01:34:29', '2020-05-13 01:34:29');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 01:34:36', '2020-05-13 01:34:36');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 01:34:40', '2020-05-13 01:34:40');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 01:34:41', '2020-05-13 01:34:41');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 01:35:33', '2020-05-13 01:35:33');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 01:35:34', '2020-05-13 01:35:34');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-13 01:35:35', '2020-05-13 01:35:35');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:35:44', '2020-05-13 01:35:44');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-13 01:35:45', '2020-05-13 01:35:45');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/event-ranges/range', 'GET', '127.0.0.1', '[]', '2020-05-13 01:35:52', '2020-05-13 01:35:52');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:43:39', '2020-05-13 01:43:39');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:46:02', '2020-05-13 01:46:02');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:48:56', '2020-05-13 01:48:56');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:49:06', '2020-05-13 01:49:06');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:49:29', '2020-05-13 01:49:29');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:56:45', '2020-05-13 01:56:45');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"1111\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"2\",\"start_time\":\"2020-05-12 12:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u53d1\\u50bb\\u8bbd\\u5fb7\\u8bf5\\u529f\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 01:57:34', '2020-05-13 01:57:34');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 01:57:36', '2020-05-13 01:57:36');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:01:12', '2020-05-13 02:01:12');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":null,\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-26 00:00:00\",\"end_time\":\"2020-05-19 00:00:00\",\"desc\":\"\\u53d1\\u8303\\u5fb7\\u8428\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 02:01:25', '2020-05-13 02:01:25');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:01:26', '2020-05-13 02:01:26');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u7b2c\\u4e09\\u65b9\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-26 00:00:00\",\"end_time\":\"2020-05-19 00:00:00\",\"desc\":\"\\u53d1\\u8303\\u5fb7\\u8428\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 02:02:40', '2020-05-13 02:02:40');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:02:41', '2020-05-13 02:02:41');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:15:07', '2020-05-13 02:15:07');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":null,\"level\":\"3\",\"status\":\"0\",\"range_id\":null,\"start_time\":null,\"end_time\":null,\"desc\":null,\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 02:15:09', '2020-05-13 02:15:09');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:15:22', '2020-05-13 02:15:22');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:15:25', '2020-05-13 02:15:25');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u8428\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-13 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u8303\\u5fb7\\u8428\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:15:36', '2020-05-13 02:15:36');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:18:18', '2020-05-13 02:18:18');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:18:21', '2020-05-13 02:18:21');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:18:37', '2020-05-13 02:18:37');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:23:18', '2020-05-13 02:23:18');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:23:19', '2020-05-13 02:23:19');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u7b2c\\u4e09\\u65b9\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-27 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u4f5b\\u6321\\u6740\\u4f5b\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:23:31', '2020-05-13 02:23:31');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:23:32', '2020-05-13 02:23:32');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u7b2c\\u4e09\\u65b9\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-27 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u4f5b\\u6321\\u6740\\u4f5b\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 02:26:36', '2020-05-13 02:26:36');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:37', '2020-05-13 02:26:37');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:38', '2020-05-13 02:26:38');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:40', '2020-05-13 02:26:40');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:41', '2020-05-13 02:26:41');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:42', '2020-05-13 02:26:42');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:43', '2020-05-13 02:26:43');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:45', '2020-05-13 02:26:45');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:46', '2020-05-13 02:26:46');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:47', '2020-05-13 02:26:47');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:48', '2020-05-13 02:26:48');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:50', '2020-05-13 02:26:50');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:51', '2020-05-13 02:26:51');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:52', '2020-05-13 02:26:52');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:52', '2020-05-13 02:26:52');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:26:56', '2020-05-13 02:26:56');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:26:57', '2020-05-13 02:26:57');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:27:38', '2020-05-13 02:27:38');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:27:40', '2020-05-13 02:27:40');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u8428\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-27 00:00:00\",\"end_time\":\"2020-05-21 00:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:27:49', '2020-05-13 02:27:49');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:27:50', '2020-05-13 02:27:50');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:43:09', '2020-05-13 02:43:09');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u624b\\u52a8\\u9600\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"3\",\"start_time\":\"2020-05-13 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u53d1\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:43:19', '2020-05-13 02:43:19');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:43:40', '2020-05-13 02:43:40');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:43:42', '2020-05-13 02:43:42');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u8428\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"2\",\"start_time\":\"2020-05-13 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u65b9\\u5f0f\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:43:53', '2020-05-13 02:43:53');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:44:55', '2020-05-13 02:44:55');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:44:57', '2020-05-13 02:44:57');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u8428\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"1\",\"start_time\":\"2020-05-13 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:45:05', '2020-05-13 02:45:05');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/events/create', 'GET', '127.0.0.1', '[]', '2020-05-13 02:45:06', '2020-05-13 02:45:06');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u8428\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"1\",\"start_time\":\"2020-05-13 00:00:00\",\"end_time\":\"2020-05-13 00:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\"}', '2020-05-13 02:49:00', '2020-05-13 02:49:00');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:49:00', '2020-05-13 02:49:00');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:49:24', '2020-05-13 02:49:24');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:54:52', '2020-05-13 02:54:52');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:54:54', '2020-05-13 02:54:54');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"\\u7b2c\\u4e09\\u65b9\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"2\",\"start_time\":\"2020-05-06 00:00:00\",\"end_time\":\"2020-05-19 12:00:00\",\"desc\":\"fasd\",\"operator_id\":\"1\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:55:10', '2020-05-13 02:55:10');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:55:10', '2020-05-13 02:55:10');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:56:39', '2020-05-13 02:56:39');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/events/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:56:51', '2020-05-13 02:56:51');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/events/1', 'PUT', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u84281\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"2\",\"start_time\":\"2020-05-13 08:00:00\",\"end_time\":\"2020-05-18 13:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230111\",\"operator_id\":\"0\",\"operator_name\":null,\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 02:57:11', '2020-05-13 02:57:11');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/events/1/edit', 'GET', '127.0.0.1', '[]', '2020-05-13 02:57:12', '2020-05-13 02:57:12');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/events/1', 'PUT', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u84281\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"2\",\"start_time\":\"2020-05-13 08:00:00\",\"end_time\":\"2020-05-18 13:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230111\",\"operator_id\":\"0\",\"operator_name\":null,\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_method\":\"PUT\"}', '2020-05-13 02:57:55', '2020-05-13 02:57:55');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 02:57:55', '2020-05-13 02:57:55');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/events/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:58:32', '2020-05-13 02:58:32');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 02:58:40', '2020-05-13 02:58:40');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:00:47', '2020-05-13 03:00:47');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:01:37', '2020-05-13 03:01:37');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:03:00', '2020-05-13 03:03:00');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/events/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:03:25', '2020-05-13 03:03:25');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/events/1', 'PUT', '127.0.0.1', '{\"title\":\"\\u8303\\u5fb7\\u84281\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"1\",\"start_time\":\"2020-05-13 08:00:00\",\"end_time\":\"2020-05-18 13:00:00\",\"desc\":\"\\u53d1\\u9001\\u5230111\",\"operator_id\":\"0\",\"operator_name\":null,\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 03:03:28', '2020-05-13 03:03:28');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:03:28', '2020-05-13 03:03:28');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/events/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:03:40', '2020-05-13 03:03:40');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/events/1', 'GET', '127.0.0.1', '[]', '2020-05-13 03:06:28', '2020-05-13 03:06:28');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/events/1', 'GET', '127.0.0.1', '[]', '2020-05-13 03:07:09', '2020-05-13 03:07:09');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/events/1', 'GET', '127.0.0.1', '[]', '2020-05-13 03:07:43', '2020-05-13 03:07:43');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/events/1', 'GET', '127.0.0.1', '[]', '2020-05-13 03:07:53', '2020-05-13 03:07:53');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:07:59', '2020-05-13 03:07:59');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Event\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-13 03:08:07', '2020-05-13 03:08:07');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:08:07', '2020-05-13 03:08:07');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:08:14', '2020-05-13 03:08:14');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Event\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-13 03:08:35', '2020-05-13 03:08:35');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:08:35', '2020-05-13 03:08:35');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:09:10', '2020-05-13 03:09:10');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:12:07', '2020-05-13 03:12:07');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:12:12', '2020-05-13 03:12:12');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Models_Event\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-13 03:12:17', '2020-05-13 03:12:17');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:12:17', '2020-05-13 03:12:17');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:40:50', '2020-05-13 03:40:50');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:40:57', '2020-05-13 03:40:57');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/event-ranges/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:01', '2020-05-13 03:41:01');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:05', '2020-05-13 03:41:05');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/event-ranges/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:09', '2020-05-13 03:41:09');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:13', '2020-05-13 03:41:13');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:19', '2020-05-13 03:41:19');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:41:21', '2020-05-13 03:41:21');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:42:48', '2020-05-13 03:42:48');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:42:52', '2020-05-13 03:42:52');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"fsdfdfdsa\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"1\",\"start_time\":\"2020-05-12 12:00:00\",\"end_time\":\"2020-05-13 13:00:00\",\"desc\":\"fsdfdsfds\",\"operator_id\":\"1\",\"operator_name\":\"Administrator\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 03:43:12', '2020-05-13 03:43:12');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:43:12', '2020-05-13 03:43:12');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/events/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 03:43:34', '2020-05-13 03:43:34');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/events/3', 'PUT', '127.0.0.1', '{\"title\":\"fsdfdfdsa\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"1\",\"start_time\":\"2020-05-12 12:00:00\",\"end_time\":\"2020-05-13 13:00:00\",\"desc\":\"fsdfdsfds2020\\u5e7405\\u670811\\u65e519\\uff1a20~ 2020\\u5e7405\\u670811\\u65e520\\uff1a00 \\u4f01\\u4e1a\\u53cd\\u9988\\u5fae\\u4fe1\\u670d\\u52a1\\u4e0d\\u7a33\\u5b9a\\uff0c\\u9ad8\\u6982\\u7387\\u51fa\\u73b0\\u767d\\u5c4f\\u3001\\u8bbf\\u95ee\\u5931\\u8d25\\u548c\\u7b49\\u5f85\\u52a0\\u8f7d\\u7684\\u60c5\\u51b5\",\"operator_id\":\"1\",\"operator_name\":\"Administrator\",\"_token\":\"ANjGSoOZIfBAihSCxQlXZv3cyZL4O2hETNEAH4EP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 03:43:43', '2020-05-13 03:43:43');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:43:43', '2020-05-13 03:43:43');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 03:55:06', '2020-05-13 03:55:06');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 04:03:28', '2020-05-13 04:03:28');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 04:03:52', '2020-05-13 04:03:52');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 04:04:03', '2020-05-13 04:04:03');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/event-ranges', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:06', '2020-05-13 04:04:06');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:13', '2020-05-13 04:04:13');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/events/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:25', '2020-05-13 04:04:25');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:31', '2020-05-13 04:04:31');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/events/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:46', '2020-05-13 04:04:46');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:04:56', '2020-05-13 04:04:56');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/events/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:05:34', '2020-05-13 04:05:34');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:05:39', '2020-05-13 04:05:39');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/events/3', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:05:42', '2020-05-13 04:05:42');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 04:05:49', '2020-05-13 04:05:49');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 06:32:07', '2020-05-13 06:32:07');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,level,operator_id,operator_name,range_id,start_time,status,title,type,update_time\",\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:32:32', '2020-05-13 06:32:32');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,level,operator_id,operator_name,range_id,start_time,status,title,type,update_time\"}', '2020-05-13 06:35:33', '2020-05-13 06:35:33');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,level,operator_id,operator_name,range_id,start_time,status,title,type,update_time\"}', '2020-05-13 06:35:38', '2020-05-13 06:35:38');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,level,operator_id,operator_name,range_id,start_time,status,title,type,update_time\"}', '2020-05-13 06:36:09', '2020-05-13 06:36:09');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,improve_project,improve_time,is_sync,level,operator_id,operator_name,range_id,responsible_party,start_time,status,title,type,update_time\",\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:36:20', '2020-05-13 06:36:20');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,improve_project,improve_time,is_sync,level,operator_id,operator_name,range_id,responsible_party,start_time,status,title,type,update_time\"}', '2020-05-13 06:39:21', '2020-05-13 06:39:21');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:39:24', '2020-05-13 06:39:24');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:39:27', '2020-05-13 06:39:27');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/events/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:39:30', '2020-05-13 06:39:30');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/events/3', 'PUT', '127.0.0.1', '{\"title\":\"fsdfdfdsa\",\"level\":\"3\",\"status\":\"0\",\"range_id\":\"1\",\"type\":\"1\",\"is_sync\":\"0\",\"responsible_party\":\"\\u554a\\u554a\\u554a\",\"improve_project\":\"\\u5206\\u8eab\\u5927\\u5e08\\u4e1c\\u839e\\u5e02\\u5f53\",\"improve_time\":\"2020-05-12 08:00:00\",\"start_time\":\"2020-05-12 12:00:00\",\"end_time\":\"2020-05-13 13:00:00\",\"desc\":\"fsdfdsfds2020\\u5e7405\\u670811\\u65e519\\uff1a20~ 2020\\u5e7405\\u670811\\u65e520\\uff1a00 \\u4f01\\u4e1a\\u53cd\\u9988\\u5fae\\u4fe1\\u670d\\u52a1\\u4e0d\\u7a33\\u5b9a\\uff0c\\u9ad8\\u6982\\u7387\\u51fa\\u73b0\\u767d\\u5c4f\\u3001\\u8bbf\\u95ee\\u5931\\u8d25\\u548c\\u7b49\\u5f85\\u52a0\\u8f7d\\u7684\\u60c5\\u51b5\",\"operator_id\":\"1\",\"operator_name\":\"Administrator\",\"_token\":\"jggpX9iVYLlySAsgqV6cqLiIFVo3HzeIRuMSf6hb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events\"}', '2020-05-13 06:39:59', '2020-05-13 06:39:59');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 06:39:59', '2020-05-13 06:39:59');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,improve_project,improve_time,is_sync,level,operator_id,operator_name,range_id,responsible_party,start_time,status,title,type,update_time\",\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:40:13', '2020-05-13 06:40:13');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,improve_project,improve_time,is_sync,level,operator_id,operator_name,range_id,responsible_party,start_time,status,title,type,update_time\"}', '2020-05-13 06:40:16', '2020-05-13 06:40:16');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/events/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:40:18', '2020-05-13 06:40:18');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/events', 'POST', '127.0.0.1', '{\"title\":\"20200511VCC\\u7cfb\\u7edf\\u6545\\u969c\\u901a\\u62a5\",\"level\":\"2\",\"status\":\"1\",\"range_id\":\"1\",\"type\":\"1\",\"is_sync\":\"1\",\"responsible_party\":\"\\u8ba2\\u5355\\u7ec4\",\"improve_project\":\"\\u7cfb\\u7edf\\u91cd\\u90e8\",\"improve_time\":\"2020-05-14 12:00:00\",\"start_time\":\"2020-05-11 00:00:00\",\"end_time\":\"2020-05-14 00:00:00\",\"desc\":\"2020\\u5e7405\\u670811\\u65e519\\uff1a20~ 2020\\u5e7405\\u670811\\u65e520\\uff1a00 \\u4f01\\u4e1a\\u53cd\\u9988\\u5fae\\u4fe1\\u670d\\u52a1\\u4e0d\\u7a33\\u5b9a\\uff0c\\u9ad8\\u6982\\u7387\\u51fa\\u73b0\\u767d\\u5c4f\\u3001\\u8bbf\\u95ee\\u5931\\u8d25\\u548c\\u7b49\\u5f85\\u52a0\\u8f7d\\u7684\\u60c5\\u51b5\",\"operator_id\":\"1\",\"operator_name\":\"Administrator\",\"_token\":\"jggpX9iVYLlySAsgqV6cqLiIFVo3HzeIRuMSf6hb\",\"_previous_\":\"http:\\/\\/www.event-notice.cc\\/admin\\/events?_columns_=create_time%2Cend_time%2Cid%2Cimprove_project%2Cimprove_time%2Cis_sync%2Clevel%2Coperator_id%2Coperator_name%2Crange_id%2Cresponsible_party%2Cstart_time%2Cstatus%2Ctitle%2Ctype%2Cupdate_time\"}', '2020-05-13 06:41:38', '2020-05-13 06:41:38');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_columns_\":\"create_time,end_time,id,improve_project,improve_time,is_sync,level,operator_id,operator_name,range_id,responsible_party,start_time,status,title,type,update_time\"}', '2020-05-13 06:41:38', '2020-05-13 06:41:38');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/events/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:41:46', '2020-05-13 06:41:46');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/events', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-13 06:41:50', '2020-05-13 06:41:50');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/events', 'GET', '127.0.0.1', '[]', '2020-05-13 06:42:50', '2020-05-13 06:42:50');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-05-12 06:38:08', '2020-05-12 06:38:08');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$MpJh2S/HBTLL0WSuoB7lg.4HdbWTuml5vNtDSTlyspQpIEvuBu0Wy', 'Administrator', NULL, 'TxS13ksjzPoswFT6PDrEnhmnOnIPk0NyFivcik2A2SYmQQLxV4IAIy33wbyq', '2020-05-12 06:38:08', '2020-05-12 06:38:08');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '事件类型 1误操作 2系统故障',
  `responsible_party` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '责任方',
  `improve_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '改进方案',
  `improve_time` timestamp(0) NULL DEFAULT NULL COMMENT '改进计划时间',
  `is_sync` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否同步企业 1是0否',
  `level` tinyint(1) NOT NULL DEFAULT 3 COMMENT '等级 1一级 2二级 3三级',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `range_id` int(10) NOT NULL DEFAULT 0 COMMENT '影响范围id',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '事件开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '事件结束时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0未处理 1处理中 2已恢复',
  `operator_id` int(10) NULL DEFAULT 0 COMMENT '操作人ID',
  `operator_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人名称',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '事件通报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, '范德萨1', 0, NULL, NULL, NULL, 0, 2, '发送到111', 1, '2020-05-13 08:00:00', '2020-05-18 13:00:00', 1, 0, NULL, 1589338140, 1589339315, 1589339315);
INSERT INTO `event` VALUES (2, '第三方', 0, NULL, NULL, NULL, 0, 2, 'fasd', 2, '2020-05-06 00:00:00', '2020-05-19 12:00:00', 1, 1, '', 1589338510, 1589339537, 1589339537);
INSERT INTO `event` VALUES (3, 'fsdfdfdsa', 1, '啊啊啊', '分身大师东莞市当', '2020-05-12 08:00:00', 0, 3, 'fsdfdsfds2020年05月11日19：20~ 2020年05月11日20：00 企业反馈微信服务不稳定，高概率出现白屏、访问失败和等待加载的情况', 1, '2020-05-12 12:00:00', '2020-05-13 13:00:00', 0, 1, 'Administrator', 1589341392, 1589351999, 0);
INSERT INTO `event` VALUES (4, '20200511VCC系统故障通报', 1, '订单组', '系统重部', '2020-05-14 12:00:00', 1, 2, '2020年05月11日19：20~ 2020年05月11日20：00 企业反馈微信服务不稳定，高概率出现白屏、访问失败和等待加载的情况', 1, '2020-05-11 00:00:00', '2020-05-14 00:00:00', 1, 1, 'Administrator', 1589352098, 1589352098, 0);

-- ----------------------------
-- Table structure for event_range
-- ----------------------------
DROP TABLE IF EXISTS `event_range`;
CREATE TABLE `event_range`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '影响范围名称',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1已删除',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '影响范围表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event_range
-- ----------------------------
INSERT INTO `event_range` VALUES (1, '全企业', 1589273710, 1589276582, 0, 0);
INSERT INTO `event_range` VALUES (2, '名气家', 1589274210, 1589274210, 0, 0);
INSERT INTO `event_range` VALUES (3, '美家', 1589274221, 1589274221, 0, 0);
INSERT INTO `event_range` VALUES (4, '技术中心', 1589274265, 1589274265, 0, 0);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

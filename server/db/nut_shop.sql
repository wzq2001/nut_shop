/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50529
 Source Host           : localhost:3306
 Source Schema         : nut_shop

 Target Server Type    : MySQL
 Target Server Version : 50529
 File Encoding         : 65001

 Date: 18/04/2024 18:44:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_ad
-- ----------------------------
DROP TABLE IF EXISTS `b_ad`;
CREATE TABLE `b_ad`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_ad
-- ----------------------------
INSERT INTO `b_ad` VALUES (1, '8164fc3b-f47b-4b0e-ba26-50602d4ef276.png', 'www.google.com', '1681724561446');
INSERT INTO `b_ad` VALUES (3, '64c66b8f-b82e-4c7a-b714-9adc32cd5ff6.jpeg', 'http://www.baidu.com', '1681725297763');
INSERT INTO `b_ad` VALUES (4, '5f299ffb-c2f8-4ade-980e-cba7d4938519.png', 'http://www.baidu.com', '1681725339563');
INSERT INTO `b_ad` VALUES (6, 'eb71dae5-b84d-4b9a-8e36-5b2adf25c4e2.png', 'www.bing.com', '1682734858115');

-- ----------------------------
-- Table structure for b_address
-- ----------------------------
DROP TABLE IF EXISTS `b_address`;
CREATE TABLE `b_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `def` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_address_user_id_a37a8d6a_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_address
-- ----------------------------
INSERT INTO `b_address` VALUES (19, '单独', NULL, NULL, NULL, '1683465050274', NULL);
INSERT INTO `b_address` VALUES (22, 'aa', 'd', NULL, NULL, '1683543865613', NULL);
INSERT INTO `b_address` VALUES (23, 'd', 'd', NULL, NULL, '1683543878597', NULL);
INSERT INTO `b_address` VALUES (25, '李冰冰', '17899990011', '广州市中山路8号', '0', '1683543980977', 2);
INSERT INTO `b_address` VALUES (26, '刘若琳', '15899999999', '济南市历下区奥体西路99号', '0', '1683544028303', 2);
INSERT INTO `b_address` VALUES (52, '王梓祺', '15049558843', '内蒙古', '1', '1707303747917', 2);

-- ----------------------------
-- Table structure for b_banner
-- ----------------------------
DROP TABLE IF EXISTS `b_banner`;
CREATE TABLE `b_banner`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thing_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_banner_thing_id_3f307d00_fk_b_thing_id`(`thing_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_banner
-- ----------------------------
INSERT INTO `b_banner` VALUES (1, 'e095d91d-e5d4-4280-a8f0-6dfa35256b97.png', '1681778975288', 2);
INSERT INTO `b_banner` VALUES (3, '4cbec89a-e1ec-4b9b-8f59-5424270e2e28.png', '1681779092845', 1);

-- ----------------------------
-- Table structure for b_classification
-- ----------------------------
DROP TABLE IF EXISTS `b_classification`;
CREATE TABLE `b_classification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_classification
-- ----------------------------
INSERT INTO `b_classification` VALUES (1, '花生', '1681347523973');
INSERT INTO `b_classification` VALUES (2, '瓜子', '1681347533598');
INSERT INTO `b_classification` VALUES (3, '榛子', '1681347534635');
INSERT INTO `b_classification` VALUES (4, '腰果', '1681347558409');
INSERT INTO `b_classification` VALUES (5, '核桃', '1681347559996');
INSERT INTO `b_classification` VALUES (6, '松子', '1681347562381');
INSERT INTO `b_classification` VALUES (7, '板栗', '1707303975242');
INSERT INTO `b_classification` VALUES (8, '杏仁', '1707303975242');
INSERT INTO `b_classification` VALUES (9, '开心果', '1707303975242');
INSERT INTO `b_classification` VALUES (10, '夏威夷果', '1707303975242');

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `thing_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_comment_user_id_46f0670f_fk_b_user_id`(`user_id`) USING BTREE,
  INDEX `b_comment_thing_id_57ab492b_fk_b_thing_id`(`thing_id`) USING BTREE,
  CONSTRAINT `b_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_comment_thing_id_57ab492b_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_comment
-- ----------------------------
INSERT INTO `b_comment` VALUES (9, '大大', '1683431295759', 3, 2, 2);
INSERT INTO `b_comment` VALUES (10, '请求', '1683432294300', 11, 2, 2);
INSERT INTO `b_comment` VALUES (11, '问问', '1683432299591', 11, 2, 2);
INSERT INTO `b_comment` VALUES (12, '啊啊', '1683460886756', 0, 2, 2);
INSERT INTO `b_comment` VALUES (13, '哈哈哈', '1683722530385', 3, 2, 53);
INSERT INTO `b_comment` VALUES (14, '77', '1683722533784', 1, 2, 53);
INSERT INTO `b_comment` VALUES (15, '88', '1707289762173', 0, 2, 54);
INSERT INTO `b_comment` VALUES (17, '1234567', '1712668802497', 0, 2, 1);

-- ----------------------------
-- Table structure for b_notice
-- ----------------------------
DROP TABLE IF EXISTS `b_notice`;
CREATE TABLE `b_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_notice
-- ----------------------------
INSERT INTO `b_notice` VALUES (1, '！！！', '临期商品大促销', '2023-03-12 10:41:47.053444');
INSERT INTO `b_notice` VALUES (2, '！！！', '临期商品大促销', '1681465796380');
INSERT INTO `b_notice` VALUES (4, '！！！', '临期商品大促销', '1681465829203');
INSERT INTO `b_notice` VALUES (6, '临期商品打折:1234445', '商品:1234445临期8折!价格由123元，下调为98元!', '1708434495019');

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thing_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `order_number` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_order_thing_id_4e345e2c_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_order_user_id_64854046_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_order_thing_id_4e345e2c_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_order
-- ----------------------------
INSERT INTO `b_order` VALUES (81, '2', '1707299991878', NULL, 13, 2, 1, '1707299991878', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (82, '2', '1707300305788', NULL, 14, 2, 1, '1707300305788', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (84, '2', '1707303929315', NULL, 50, 2, 1, '1707303929315', '内蒙古', '王梓祺', '15049558843', NULL);
INSERT INTO `b_order` VALUES (90, '2', '1712532699120', NULL, 1, 2, 1, '1712532699120', '内蒙古', '王梓祺', '15049558843', NULL);

-- ----------------------------
-- Table structure for b_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_tag`;
CREATE TABLE `b_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_tag
-- ----------------------------
INSERT INTO `b_tag` VALUES (1, '内蒙古', '1681347572848');
INSERT INTO `b_tag` VALUES (2, '辽宁', '1681347572848');
INSERT INTO `b_tag` VALUES (3, '吉林', '1681347572848');
INSERT INTO `b_tag` VALUES (4, '黑龙江', '1681347572848');
INSERT INTO `b_tag` VALUES (5, '云南', '1681347572848');
INSERT INTO `b_tag` VALUES (6, '安徽', '1681347572848');
INSERT INTO `b_tag` VALUES (7, '新疆', '1681347572848');
INSERT INTO `b_tag` VALUES (8, '西藏', '1681347572848');
INSERT INTO `b_tag` VALUES (9, '河北', '1681347572848');
INSERT INTO `b_tag` VALUES (10, '山西', '1681347572848');
INSERT INTO `b_tag` VALUES (11, '山东', '1681347572848');

-- ----------------------------
-- Table structure for b_thing
-- ----------------------------
DROP TABLE IF EXISTS `b_thing`;
CREATE TABLE `b_thing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repertory` int(11) NOT NULL,
  `score` int(11) NULL DEFAULT 0,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pv` int(11) NULL DEFAULT 0,
  `recommend_count` int(11) NULL DEFAULT 0,
  `wish_count` int(11) NULL DEFAULT 0,
  `collect_count` int(11) NULL DEFAULT 0,
  `classification_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_thing_classification_id_47675ac4_fk_b_classification_id`(`classification_id`) USING BTREE,
  CONSTRAINT `b_thing_ibfk_1` FOREIGN KEY (`classification_id`) REFERENCES `b_classification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_thing
-- ----------------------------
INSERT INTO `b_thing` VALUES (1, '蒜香花生', 'a1.jpg', '蒜香花生是一种经过烹制后拥有浓郁蒜香味道的花生产品。通常将花生仁经过炸、烤或炒的方式处理，然后混合蒜蓉、蒜粉或蒜末等蒜制品，使其具有独特的香味和口感。\r\n特点：口感香脆，带有浓烈的蒜香味，适合作为零食食用，也可用于烹饪中增添风味。', '9.9', '0', 239, 0, '1740138396000', 0, 0, 2, 4, 1);
INSERT INTO `b_thing` VALUES (2, '陈皮花生', 'a7.png', '陈皮花生是一种特色花生制品，其特点是将花生仁与陈皮一起腌制或加工而成。陈皮通常是晒干后的橘子或柑橘的外皮，具有独特的香味和口感。\r\n特点：口感酥脆，带有淡淡的陈皮香味，具有一定的酸甜味道，可增进食欲，也有助于消化。', '9', '0', 123, 0, '1740138395000', 0, 0, 11, 1, 1);
INSERT INTO `b_thing` VALUES (3, '老卤花生', 'a8.jpg', '老卤花生是一种用卤汁腌制或烹制的花生制品。通常使用酱油、花椒、桂皮、八角等调料制成的卤汁进行腌制，使得花生仁吸收了丰富的卤味。\r\n特点：口感鲜嫩，带有浓厚的卤香味，具有独特的口感和风味，是一种常见的下酒小吃。', '9', '0', 234, 0, '1740138395000', 3, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (4, '五香花生', 'a5.jpg', '五香花生是一种以花生为主要原料，经过腌制或调味处理后产生的花生制品。通常使用五香粉、八角、桂皮、茴香等调料进行腌制，使得花生仁具有独特的五香风味。\r\n特点：口感酥脆，带有香甜的五香味道，是一种受欢迎的传统小吃，也可以作为下酒菜搭配啤酒等饮品。', '8.8', '0', 567, 0, '1740138395000', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (5, '养胃花生', 'a4.jpg', '养胃花生是一种被认为有助于胃部健康的花生制品。通常经过特殊的加工处理，可能添加了一些药材或中药成分，被认为具有调理胃肠、增强消化功能的作用。\r\n特点：口感一般与普通花生相似，但据传说具有养胃健脾的功效，适合胃部不适者食用。', '15', '0', 234, 0, '1740138395000', 0, 0, 11, 0, 1);
INSERT INTO `b_thing` VALUES (6, '多彩鱼皮花生', 'a6.png', '多彩鱼皮花生是一种创意花生制品，将花生仁裹上彩色鱼皮制成，外观色彩鲜艳、形状各异，具有一定的观赏性。\r\n特点：口感酥脆，外观多彩，适合作为休闲零食或节庆礼品。', '25', '0', 345, 0, '1740138395000', 9, 0, 1, 0, 1);
INSERT INTO `b_thing` VALUES (7, '原味瓜子', 'b2.jpg', '原味瓜子是未经任何调味处理的瓜子，保持了瓜子本身的原汁原味。它的外观呈现出深褐色或深灰色，外皮光滑，没有其他颜色或味道的添加。口感酥脆，略带一丝苦涩，具有浓郁的花生香味，是一种传统的、纯正的瓜子品种。', '8.8', '0', 479, 0, '1740138395000', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (8, '五香瓜子', 'b1.jpg', '五香瓜子是经过调味处理的瓜子产品，通常使用五香粉、八角、桂皮、茴香等调料进行腌制。它呈现出深浅均匀的棕红色，带有五香调料的浓郁香气。口感酥脆，香甜适中，略带微辣和麻的味道，是一种经典的中国小吃，适合作为零食或下酒菜。', '9.8', '0', 789, 0, '1740138395000', 88, 0, 2, 2, 2);
INSERT INTO `b_thing` VALUES (9, '奶香瓜子', 'b3.jpg', '奶香瓜子是在瓜子上添加奶香味的一种瓜子制品。它的外观呈现出金黄色，表面均匀涂覆着奶香液或奶香粉。口感酥脆，带有浓郁的奶香味，甜而不腻，是一种口感柔和的零食，适合各个年龄段的人群食用。', '9.9', '0', 744, 0, '1740138395000', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (10, '焦糖瓜子', 'b5.png', '焦糖瓜子是一种经过糖化处理的瓜子产品。它的外观呈现出深棕色，表面覆盖着焦糖。口感酥脆，焦糖味浓郁，略带一丝苦甜，香气诱人，是一种独特的甜品小吃，适合作为零食或节庆食品。', '13', '0', 432, 0, '1740138395000', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (11, '椰香瓜子', 'b6.jpg', '香气诱人：椰香瓜子具有浓郁的椰子香味，食用时散发出诱人的香气，令人垂涎欲滴。\r\n\r\n口感酥脆：经过烘烤处理后，瓜子口感酥脆，每一颗都带有令人愉悦的咀嚼感。\r\n\r\n香甜可口：椰香瓜子独特的椰子香味与瓜子本身的香甜相结合，口味独特，令人回味无穷。\r\n\r\n适合各种场合：椰香瓜子不仅可以作为休闲零食，也可以作为聚会或节日的美味小吃，深受人们喜爱。', '15', '0', 321, 0, '1740138395000', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (12, '香雪梨味儿瓜子', 'b7.jpg', '雪梨味儿瓜子是一种添加了椰香和雪梨味道的瓜子制品。它的外观呈现出淡黄色或淡白色，表面带有一层细腻的椰香和雪梨味的粉末。口感酥脆，带有淡淡的椰香和雪梨的味道，清新爽口，适合作为夏季的零食选择。', '30', '0', 211, 0, '1740138395000', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (13, '原味榛子', 'c3.jpg', '原味榛子是未经任何调味处理的榛子，保持了榛子本身的原汁原味。它的外观呈现出淡褐色或深褐色，外皮光滑，没有其他颜色或味道的添加。口感酥脆，略带一丝苦涩，具有浓郁的榛子香味，是一种传统的、纯正的榛子品种。', '25', '0', 987, 0, '1740138395000', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (14, '五香榛子', 'c5.jpg', '五香味榛子是经过调味处理的榛子产品，通常使用五香粉、八角、桂皮、茴香等调料进行腌制。它呈现出深浅均匀的棕红色，带有五香调料的浓郁香气。口感酥脆，香甜适中，略带微辣和麻的味道，是一种受欢迎的中国特色小吃。', '35', '0', 444, 0, '1740138395000', 0, 0, 1, 0, 3);
INSERT INTO `b_thing` VALUES (15, '开口大榛子', 'c2.png', '开口大榛子是指果壳裂开的榛子，榛子仁容易取出。它的外观呈现出果壳裂开的状况，方便取出内部的榛子仁。口感酥脆，果仁饱满，具有浓郁的榛子香味，是一种方便食用的榛子品种。', '34', '0', 555, 0, '1740138395000', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (16, '可可脆榛子', 'c4.jpg', '可可脆榛子是一种经过可可加工处理的榛子制品。它的外观呈现出深褐色，表面涂覆着一层可可粉或巧克力液体。口感酥脆，带有浓郁的巧克力味道，甜而不腻，是一种深受巧克力爱好者喜爱的美食。', '39.9', '0', 777, 0, '1740138395000', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (17, '咖啡味榛子', 'c6.png', '咖啡味榛子是一种在榛子上添加了咖啡味道的榛子制品。它的外观呈现出深褐色，表面涂覆着一层咖啡粉末或咖啡液体。口感酥脆，带有浓郁的咖啡香味，略带苦涩，适合喜欢咖啡风味的人群食用。', '40.9', '0', 66, 0, '1740138395000', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (18, '樱花白桃味榛子', 'c7.png', '樱花白桃味榛子是一种添加了樱花和白桃味道的榛子制品。它的外观呈现出淡粉色或淡黄色，表面涂覆着一层樱花和白桃味的粉末。口感酥脆，带有淡淡的樱花和白桃的味道，清新爽口，是一种口味独特的榛子选择。', '49.9', '0', 999, 0, '1740138395000', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (19, '紫皮腰果', 'd2.png', '紫皮腰果是一种果皮呈现紫色或深紫色的腰果品种。它的果仁通常为淡黄色或淡粉色。口感柔软，果肉饱满，味道略带甜味，具有浓郁的腰果香气。紫皮腰果富含维生素E和不饱和脂肪酸，是一种营养丰富的坚果。', '35', '0', 987, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (20, '原味腰果', 'd1.jpg', '原味腰果是未经任何调味处理的腰果，保持了腰果本身的原汁原味。它的外观呈现出淡黄色或浅粉色，果仁饱满，口感柔软，略带一丝甜味，具有浓郁的腰果香味。原味腰果是一种传统的、纯正的腰果品种。', '39', '0', 846, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (21, '带衣腰果', 'd5.jpg', '带衣腰果是指果仁表面仍然保留有果皮的腰果。果仁呈现出淡黄色或淡粉色，外表覆盖着一层薄薄的果皮。口感柔软，果肉饱满，带有果皮的清新香气，略带一丝苦涩。带衣腰果保留了果皮的营养成分，更加健康。', '38.9', '0', 222, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (22, '琥珀腰果', 'd8.png', '琥珀腰果是一种果仁呈琥珀色的腰果品种，外观呈现出深黄色或橙黄色。口感柔软，果肉饱满，具有浓郁的腰果香味。琥珀腰果通常用于烘焙、制作糕点或混合坚果零食。', '39.9', '0', 322, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (23, '炭烧腰果', 'd4.jpg', '炭烧腰果是一种经过特殊处理烤制而成的腰果品种。它的外观呈现出深褐色或黑色，口感略带焦香，果肉饱满，略带苦涩。炭烧腰果通常用于调味料或作为独特的小吃。', '39.8', '0', 876, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (24, '海苔腰果', 'd10.png', '海苔腰果是一种将腰果表面涂抹了海苔粉末或撒上海苔碎片的特色腰果品种。口感柔软，略带海苔的清新味道，带有一丝咸味，是一种口味独特的腰果品种。', '39.1', '0', 900, 0, '1740138395000', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (25, '纸皮核桃', 'e1.jpg', '纸皮核桃是一种外壳较薄而纹理清晰的核桃品种。它的外观呈现出淡褐色或浅黄色，果壳纸质薄而易剥，果仁饱满，具有浓郁的核桃香味。口感酥脆，果仁饱满，是一种受欢迎的核桃品种。', '20', '0', 321, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (26, '琥珀核桃', 'e2.jpg', '琥珀核桃是一种果壳呈琥珀色的核桃品种，果壳较厚实。它的外观呈现出深黄色或橙黄色，果壳硬实，果仁饱满，具有浓郁的核桃香味。口感酥脆，略带甜味，是一种口感独特的核桃品种。', '23.8', '0', 222, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (27, '紫皮红青素核桃', 'e4.jpg', '紫皮红青素核桃是一种来自云南地区的特色核桃品种。它的外观呈现出深紫色或红青素色，果壳较薄，果仁颜色鲜艳。口感酥脆，果仁饱满，具有浓郁的核桃香味，是云南地区的特色美食之一。', '33.33', '0', 315, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (28, '奶香核桃', 'e3.jpg', '奶香核桃是一种在核桃内部注入奶香液体的特色核桃品种。它的外观呈现出淡黄色或奶白色，果仁饱满，带有浓郁的奶香味。口感酥脆，奶香味浓郁，是一种口感柔和、香甜可口的核桃品种。', '23.2', '0', 415, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (29, '五香核桃', 'e5.jpg', '五香核桃是一种经过调味处理的核桃产品，产自新疆地区。它呈现出深浅均匀的棕红色，果壳较厚实，果仁饱满。口感酥脆，带有香甜的五香味道，略带微辣和麻的味道，是一种受欢迎的中国特色小吃。', '19.9', '0', 432, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (30, '海苔核桃', 'e6.jpg', '海苔核桃是一种将核桃仁裹上海苔粉末或海苔碎片制成的特色核桃品种。它的外观呈现出深褐色或深绿色，海苔颗粒均匀分布于核桃表面。口感酥脆，带有海苔的独特风味，略带咸味，是一种口感特别的核桃品种。', '29.9', '0', 155, 0, '1740138395000', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (31, '原味松子', 'j2.jpg', '原味松子是未经任何调味处理的松子，保持了松子本身的原汁原味。它的外观呈现出淡黄色或淡棕色，果仁形状完整，表面光滑。口感柔软，略带坚硬，味道清香，具有浓郁的松子香味，是一种传统的、纯正的松子品种。', '39.9', '0', 333, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (32, '大开口松子', 'j1.jpg', '大开口松子是指果壳裂开、果仁容易取出的松子。它的外观呈现出果壳裂开的状况，果仁大小均匀。口感柔软，果仁饱满，味道清香，是一种方便食用的松子品种。', '29.8', '0', 333, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (33, '椒盐松子', 'j4.jpg', '椒盐松子是一种经过调味处理的松子制品，通常使用盐和胡椒粉进行腌制。它的外观呈现出淡黄色或淡棕色，表面覆盖着一层椒盐调味料。口感柔软，略带咸味和微辣味，具有浓郁的松子香味，是一种受欢迎的小吃。', '33.3', '0', 333, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (34, '五香松子', 'j5.jpg', '五香松子是一种经过调味处理的松子制品，通常使用五香粉、八角、桂皮、茴香等调料进行腌制。它的外观呈现出淡黄色或淡棕色，表面覆盖着一层五香调味料。口感柔软，略带甜味和微辣味，具有浓郁的香料味道，是一种受欢迎的中国特色小吃。', '34.5', '0', 111, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (35, '野生黑松子', 'j6.jpg', '野生黑松子是一种生长在自然环境下的野生松子品种。它的外观呈现出深棕色或黑色，果仁形状不规则。口感柔软，略带苦涩，具有浓郁的松子香味，营养丰富，是一种珍贵的野生食材。', '36.7', '0', 421, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (36, '芥末味松子', 'j7.png', '芥末味松子是一种在松子上添加了芥末粉或芥末调味料的松子制品。它的外观呈现出淡黄色或淡棕色，表面覆盖着一层芥末粉末。口感柔软，略带辛辣和咸味，具有浓烈的芥末味道，是一种口味独特的松子品种。', '35.2', '0', 123, 0, '1740138395000', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (37, '原味板栗', 'g1.jpg', '原味板栗是未经任何调味处理的板栗，保持了板栗本身的原汁原味。它的外观呈现出棕色或深褐色，果实表面光滑。口感柔软，果肉饱满，味道清甜，具有浓郁的板栗香气，是一种传统的、纯正的板栗品种。', '36.9', '0', 904, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (38, '奶香板栗', 'g3.jpg', '奶香板栗是一种在板栗内部注入了奶香液体的特色板栗品种。它的外观呈现出棕色或深褐色，果实表面光滑，略带亮泽。口感柔软，味道香甜，带有浓郁的奶香味道，是一种口感柔和、香甜可口的板栗品种。', '38.9', '0', 789, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (39, '甜板栗', 'g4.jpg', '甜板栗是一种口感甜美、味道清甜的板栗品种。它的外观呈现出棕色或深褐色，果实表面光滑，略带亮泽。口感柔软，果肉饱满，味道清甜，具有浓郁的板栗香气，是一种受欢迎的板栗品种。', '38.7', '0', 411, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (40, '有机板栗', 'g2.jpg', '有机板栗是一种通过有机种植方式培育的板栗品种，不含化学农药和化肥。它的外观呈现出深褐色或棕色，果实表面光滑，呈现出自然的原始状态。口感柔软，味道清甜，具有浓郁的板栗香气，是一种更加健康、营养丰富的板栗品种。', '45', '0', 235, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (41, '奶酪油仁栗', 'g6.jpg', '奶酪油仁栗是一种在板栗内部注入了奶酪或奶酪油仁的特色板栗品种。它的外观呈现出棕色或深褐色，果实表面光滑，略带亮泽。口感柔软，味道香甜，带有浓郁的奶酪味道，是一种口感柔和、香甜可口的板栗品种。', '43', '0', 111, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (42, '枫栗', 'g8.jpg', '枫栗是一种以枫糖或枫糖浆腌制的板栗品种。它的外观呈现出棕色或深褐色，略带红色调，果实表面光滑，覆盖着一层枫糖浆。口感柔软，味道香甜，带有浓郁的枫糖味道，是一种美味的板栗品种。', '52', '0', 877, 0, '1740138395000', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (43, '奶香杏仁', 'h1.jpg', '奶香杏仁是未经任何调味处理的杏仁，保持了杏仁本身的原汁原味。它的外观呈现出淡黄色或淡棕色，外表光滑，没有其他添加物。口感酥脆，略带一丝苦涩，具有浓郁的杏仁香味，是一种传统的、纯正的杏仁品种。', '33', '0', 333, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (44, '小银杏仁', 'h2.jpg', '小银杏仁是一种尺寸较小的杏仁，果仁表面呈现出银灰色或淡绿色。它的口感比普通杏仁更为细腻，带有浓郁的杏仁香味。小银杏仁常被用于烘焙、制作糕点或混合坚果零食。', '22.22', '0', 555, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (45, '芥末味杏仁', 'h5.jpg', '芥末味杏仁是经过添加芥末粉或芥末调味料处理的杏仁制品。它的外观呈现出淡棕色或浅黄色，表面覆盖着一层芥末粉末。口感酥脆，带有浓烈的芥末味道，稍微辛辣刺激，是一种独特的杏仁品种。', '34', '0', 888, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (46, '巧克力味杏仁', 'h3.jpg', '巧克力味杏仁是经过巧克力涂覆或混合巧克力颗粒处理的杏仁制品。它的外观呈现出深褐色或棕色，表面覆盖着一层巧克力涂层或巧克力颗粒。口感酥脆，带有浓郁的巧克力味道，甜而不腻，是一种深受巧克力爱好者喜爱的美食。', '40.9', '0', 654, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (47, '蜂蜜杏仁', 'h4.jpg', '蜂蜜杏仁是在杏仁上淋上蜂蜜或蜂蜜糖浆的特色杏仁品种。它的外观呈现出淡黄色或金黄色，表面涂覆着一层透亮的蜂蜜液体。口感酥脆，带有浓郁的蜂蜜味道，甜而不腻，是一种口感柔和、香甜可口的杏仁品种。', '39.9', '0', 666, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (48, '麻仁杏仁', 'h6.jpg', '麻仁杏仁是一种在杏仁表面涂抹了芝麻酱或撒上炒熟的芝麻的杏仁制品。它的外观呈现出深褐色或深黄色，表面覆盖着一层芝麻颗粒。口感酥脆，带有浓郁的芝麻味道，略带香气，是一种口味独特的杏仁品种。', '39.8', '0', 544, 0, '1740138395000', 0, 0, 0, 0, 8);
INSERT INTO `b_thing` VALUES (49, '奶香夏威夷果', 'k2.jpg', '奶香味夏威夷果是一种在夏威夷果上添加了奶香调味料的制品。它的外观呈现出金黄色或深褐色，果仁表面略带光泽。口感酥脆，略带甜味，带有浓郁的奶香味道，是一种口感柔和、香甜可口的夏威夷果品种。', '39.9', '0', 684, 0, '1740138395000', 0, 0, 0, 0, 10);
INSERT INTO `b_thing` VALUES (50, '原味夏威夷果', 'k9.jpg', '原味夏威夷果是一种未经调味处理的夏威夷果，保持了其天然原味。它的外观呈现出深褐色或浅金黄色，果仁表面通常呈现出均匀的色泽。口感酥脆，果仁饱满且坚果香气浓郁，是一种纯正的夏威夷果口味。', '38.9', '0', 652, 0, '1740138395000', 0, 0, 0, 0, 10);
INSERT INTO `b_thing` VALUES (51, '黑松露夏威夷果', 'k6.png', '黑松露夏威夷果是一种在夏威夷果上添加了黑松露调味料的制品。它的外观呈现出深褐色或黑色，果仁表面略带光泽。口感酥脆，略带香味，带有黑松露独特的风味，是一种口感丰富、独特的夏威夷果品种。', '36.6', '0', 255, 0, '1740138395000', 0, 0, 0, 0, 10);
INSERT INTO `b_thing` VALUES (52, '椰蓉味夏威夷果', 'k5.jpg', '椰蓉味夏威夷果是一种在夏威夷果上添加了椰蓉调味料的制品。它的外观呈现出淡黄色或深褐色，果仁表面覆盖着一层椰蓉。口感酥脆，略带甜味，带有浓郁的椰蓉香气，是一种口感柔和、香甜可口的夏威夷果品种。', '36', '0', 777, 0, '1740138395000', 0, 0, 0, 0, 10);
INSERT INTO `b_thing` VALUES (53, '蜂蜜夏威夷果', 'k4.jpg', '蜂蜜夏威夷果是一种在夏威夷果上添加了蜂蜜调味料的制品。它的外观呈现出金黄色或深褐色，果仁表面略带光泽。口感酥脆，带有浓郁的蜂蜜香气和甜味，是一种口感柔和、香甜可口的夏威夷果品种。', '35', '0', 333, 0, '1740138395000', 0, 0, 0, 0, 10);
INSERT INTO `b_thing` VALUES (54, '生椰拿铁味夏威夷果', 'k1.png', '生椰拿铁味夏威夷果是一种在夏威夷果上添加了生椰拿铁调味料的制品。它的外观呈现出淡棕色或浅黄色，果仁表面覆盖着一层椰子粉末。口感酥脆，略带甜味和奶香味，带有浓郁的椰子香气，是一种口味独特的夏威夷果品种。', '35.4', '0', 777, 0, '1740138395000', 0, 0, 0, 1, 10);
INSERT INTO `b_thing` VALUES (55, '原色开心果', 'i2.jpg', '原色开心果是未经任何调味处理的开心果，保持了开心果本身的原汁原味。它的外观呈现出浅绿色或淡黄色，果壳通常为自然开裂状态，露出果仁。口感酥脆，果仁丰满，味道清甜，具有浓郁的开心果香味，是一种传统的、纯正的开心果品种。', '52', '0', 1234, 0, '1740138395000', 0, 0, 0, 0, 9);
INSERT INTO `b_thing` VALUES (56, '盐焗开心果', 'i3.jpg', '盐焗开心果是一种用盐水浸泡后烤制而成的开心果品种。它的外观呈现出浅黄色或淡褐色，果仁略带盐味。口感酥脆，略带咸味，带有浓郁的开心果香气，是一种受欢迎的小吃。', '61', '0', 345, 0, '1740138395000', 0, 0, 0, 0, 9);
INSERT INTO `b_thing` VALUES (57, '五香开心果', 'i4.jpg', '五香开心果是一种经过调味处理的开心果制品，通常使用五香粉、八角、桂皮、茴香等香料进行腌制。它的外观呈现出淡黄色或淡褐色，果仁表面覆盖着香料颗粒。口感酥脆，略带甜味和微辣味，带有浓郁的香料味道，是一种受欢迎的中国特色小吃。', '54', '0', 767, 0, '1740138395000', 0, 0, 0, 0, 9);
INSERT INTO `b_thing` VALUES (58, '绿宝格开心果', 'i6.png', '绿宝格开心果是一种果壳呈现出翠绿色的开心果品种。它的外观呈现出浅绿色或淡黄色，果壳通常为自然开裂状态，露出果仁。口感酥脆，果仁丰满，味道清甜，具有浓郁的开心果香味，是一种独特的开心果品种。', '80', '0', 34, 0, '1740138395000', 0, 0, 0, 0, 9);
INSERT INTO `b_thing` VALUES (59, '奶香开心果', 'i9.png', '奶香开心果是一种在开心果上添加了奶香调味料的开心果制品。它的外观呈现出淡黄色或淡褐色，果仁略带奶香味。口感酥脆，味道香甜，带有浓郁的奶香味道，是一种口感柔和、香甜可口的开心果品种。', '60', '0', 343, 0, '1740138395000', 0, 0, 0, 0, 9);
INSERT INTO `b_thing` VALUES (60, '芥末味开心果', 'i10.jpg', '芥末味开心果是一种在开心果上添加了芥末粉或芥末调味料的开心果制品。它的外观呈现出淡黄色或淡褐色，果仁表面覆盖着一层芥末粉末。口感酥脆，略带辛辣和咸味，具有浓烈的芥末味道，是一种口味独特的开心果品种。', '90', '0', 100, 0, '1740138395000', 0, 0, 0, 0, 9);

-- ----------------------------
-- Table structure for b_thing_collect
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_collect`;
CREATE TABLE `b_thing_collect`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_collect_thing_id_user_id_45b9f252_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_collect_user_id_e5d69968_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_collect_thing_id_8edce8b3_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_thing_collect
-- ----------------------------
INSERT INTO `b_thing_collect` VALUES (36, 1, 2);

-- ----------------------------
-- Table structure for b_thing_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_tag`;
CREATE TABLE `b_thing_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_tag_thing_id_tag_id_a5d426b2_uniq`(`thing_id`, `tag_id`) USING BTREE,
  INDEX `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `b_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_tag_thing_id_fb8ecf3f_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 412 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_thing_tag
-- ----------------------------
INSERT INTO `b_thing_tag` VALUES (411, 1, 2);
INSERT INTO `b_thing_tag` VALUES (374, 2, 3);
INSERT INTO `b_thing_tag` VALUES (375, 2, 4);
INSERT INTO `b_thing_tag` VALUES (372, 4, 5);
INSERT INTO `b_thing_tag` VALUES (371, 5, 11);
INSERT INTO `b_thing_tag` VALUES (387, 6, 4);
INSERT INTO `b_thing_tag` VALUES (388, 6, 5);
INSERT INTO `b_thing_tag` VALUES (385, 7, 1);
INSERT INTO `b_thing_tag` VALUES (386, 7, 5);
INSERT INTO `b_thing_tag` VALUES (368, 8, 4);
INSERT INTO `b_thing_tag` VALUES (369, 8, 5);
INSERT INTO `b_thing_tag` VALUES (366, 9, 4);
INSERT INTO `b_thing_tag` VALUES (367, 9, 5);
INSERT INTO `b_thing_tag` VALUES (364, 10, 4);
INSERT INTO `b_thing_tag` VALUES (365, 10, 5);
INSERT INTO `b_thing_tag` VALUES (362, 11, 4);
INSERT INTO `b_thing_tag` VALUES (363, 11, 5);
INSERT INTO `b_thing_tag` VALUES (360, 12, 4);
INSERT INTO `b_thing_tag` VALUES (361, 12, 5);
INSERT INTO `b_thing_tag` VALUES (357, 13, 2);
INSERT INTO `b_thing_tag` VALUES (358, 13, 4);
INSERT INTO `b_thing_tag` VALUES (359, 13, 5);
INSERT INTO `b_thing_tag` VALUES (355, 14, 4);
INSERT INTO `b_thing_tag` VALUES (356, 14, 5);
INSERT INTO `b_thing_tag` VALUES (354, 15, 3);
INSERT INTO `b_thing_tag` VALUES (352, 16, 3);
INSERT INTO `b_thing_tag` VALUES (353, 16, 4);
INSERT INTO `b_thing_tag` VALUES (350, 17, 6);
INSERT INTO `b_thing_tag` VALUES (351, 17, 7);
INSERT INTO `b_thing_tag` VALUES (348, 18, 6);
INSERT INTO `b_thing_tag` VALUES (349, 18, 7);
INSERT INTO `b_thing_tag` VALUES (346, 19, 6);
INSERT INTO `b_thing_tag` VALUES (347, 19, 7);
INSERT INTO `b_thing_tag` VALUES (344, 20, 6);
INSERT INTO `b_thing_tag` VALUES (345, 20, 7);
INSERT INTO `b_thing_tag` VALUES (342, 21, 6);
INSERT INTO `b_thing_tag` VALUES (343, 21, 7);
INSERT INTO `b_thing_tag` VALUES (340, 22, 6);
INSERT INTO `b_thing_tag` VALUES (341, 22, 7);
INSERT INTO `b_thing_tag` VALUES (338, 23, 6);
INSERT INTO `b_thing_tag` VALUES (339, 23, 7);
INSERT INTO `b_thing_tag` VALUES (336, 24, 6);
INSERT INTO `b_thing_tag` VALUES (337, 24, 7);
INSERT INTO `b_thing_tag` VALUES (334, 25, 3);
INSERT INTO `b_thing_tag` VALUES (335, 25, 5);
INSERT INTO `b_thing_tag` VALUES (332, 26, 3);
INSERT INTO `b_thing_tag` VALUES (333, 26, 8);
INSERT INTO `b_thing_tag` VALUES (331, 27, 8);
INSERT INTO `b_thing_tag` VALUES (330, 28, 8);
INSERT INTO `b_thing_tag` VALUES (384, 29, 8);
INSERT INTO `b_thing_tag` VALUES (329, 30, 8);
INSERT INTO `b_thing_tag` VALUES (328, 31, 8);
INSERT INTO `b_thing_tag` VALUES (327, 32, 8);
INSERT INTO `b_thing_tag` VALUES (326, 33, 8);
INSERT INTO `b_thing_tag` VALUES (325, 34, 8);
INSERT INTO `b_thing_tag` VALUES (323, 35, 4);
INSERT INTO `b_thing_tag` VALUES (324, 35, 9);
INSERT INTO `b_thing_tag` VALUES (321, 36, 4);
INSERT INTO `b_thing_tag` VALUES (322, 36, 9);
INSERT INTO `b_thing_tag` VALUES (319, 37, 4);
INSERT INTO `b_thing_tag` VALUES (320, 37, 9);
INSERT INTO `b_thing_tag` VALUES (317, 38, 4);
INSERT INTO `b_thing_tag` VALUES (318, 38, 9);
INSERT INTO `b_thing_tag` VALUES (382, 39, 4);
INSERT INTO `b_thing_tag` VALUES (383, 39, 9);
INSERT INTO `b_thing_tag` VALUES (315, 40, 4);
INSERT INTO `b_thing_tag` VALUES (316, 40, 9);
INSERT INTO `b_thing_tag` VALUES (313, 41, 4);
INSERT INTO `b_thing_tag` VALUES (314, 41, 9);
INSERT INTO `b_thing_tag` VALUES (311, 42, 4);
INSERT INTO `b_thing_tag` VALUES (312, 42, 9);
INSERT INTO `b_thing_tag` VALUES (309, 43, 4);
INSERT INTO `b_thing_tag` VALUES (310, 43, 9);
INSERT INTO `b_thing_tag` VALUES (307, 44, 4);
INSERT INTO `b_thing_tag` VALUES (308, 44, 9);
INSERT INTO `b_thing_tag` VALUES (305, 45, 7);
INSERT INTO `b_thing_tag` VALUES (306, 45, 10);
INSERT INTO `b_thing_tag` VALUES (302, 46, 4);
INSERT INTO `b_thing_tag` VALUES (303, 46, 7);
INSERT INTO `b_thing_tag` VALUES (304, 46, 10);
INSERT INTO `b_thing_tag` VALUES (299, 47, 4);
INSERT INTO `b_thing_tag` VALUES (300, 47, 7);
INSERT INTO `b_thing_tag` VALUES (301, 47, 10);
INSERT INTO `b_thing_tag` VALUES (296, 48, 4);
INSERT INTO `b_thing_tag` VALUES (297, 48, 7);
INSERT INTO `b_thing_tag` VALUES (298, 48, 10);
INSERT INTO `b_thing_tag` VALUES (293, 49, 4);
INSERT INTO `b_thing_tag` VALUES (294, 49, 7);
INSERT INTO `b_thing_tag` VALUES (295, 49, 10);
INSERT INTO `b_thing_tag` VALUES (289, 50, 4);
INSERT INTO `b_thing_tag` VALUES (290, 50, 7);
INSERT INTO `b_thing_tag` VALUES (291, 50, 8);
INSERT INTO `b_thing_tag` VALUES (292, 50, 10);
INSERT INTO `b_thing_tag` VALUES (287, 51, 7);
INSERT INTO `b_thing_tag` VALUES (288, 51, 10);
INSERT INTO `b_thing_tag` VALUES (282, 52, 4);
INSERT INTO `b_thing_tag` VALUES (283, 52, 5);
INSERT INTO `b_thing_tag` VALUES (284, 52, 6);
INSERT INTO `b_thing_tag` VALUES (285, 52, 9);
INSERT INTO `b_thing_tag` VALUES (286, 52, 10);
INSERT INTO `b_thing_tag` VALUES (380, 53, 7);
INSERT INTO `b_thing_tag` VALUES (381, 53, 10);
INSERT INTO `b_thing_tag` VALUES (378, 54, 7);
INSERT INTO `b_thing_tag` VALUES (379, 54, 10);

-- ----------------------------
-- Table structure for b_thing_wish
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_wish`;
CREATE TABLE `b_thing_wish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_wish_thing_id_user_id_9d647bbb_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_wish_user_id_e2d94f6c_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_wish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_wish_thing_id_f0864b16_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_thing_wish
-- ----------------------------
INSERT INTO `b_thing_wish` VALUES (15, 1, 2);
INSERT INTO `b_thing_wish` VALUES (8, 2, 2);

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT 0,
  `push_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_switch` tinyint(1) NULL DEFAULT 0,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES (2, 'ddd', '123', '1', '0', 'test', 'ec794bf4-da3c-4c69-ad67-ae17ef3803b1.jpeg', '13211112222', '13333@111.com', NULL, '333000', NULL, 8, 'hh333@mail.cn', 1, 'a4c9855f2a97a78b604d0fb258880b21');
INSERT INTO `b_user` VALUES (10, '王梓祺', '123', '3', '0', '帅', NULL, '12345678', '1234567890', NULL, NULL, '1712621278128', 0, NULL, 0, '123');
INSERT INTO `b_user` VALUES (15, 'wang1', '123', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1712669652657', 0, NULL, 0, '123');
INSERT INTO `b_user` VALUES (16, 'wang', '123', '1', '0', '哈哈vv', NULL, '182829828', '13984908049', NULL, '.。。。', '1712669797792', 0, NULL, 0, '123');

SET FOREIGN_KEY_CHECKS = 1;

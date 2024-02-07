/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : 127.0.0.1:3306
 Source Schema         : nut_shop

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 07/02/2024 18:48:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_ad
-- ----------------------------
DROP TABLE IF EXISTS `b_ad`;
CREATE TABLE `b_ad`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_ad
-- ----------------------------
INSERT INTO `b_ad` VALUES (1, '8164fc3b-f47b-4b0e-ba26-50602d4ef276.png', 'www.google.com', '1681724561446');
INSERT INTO `b_ad` VALUES (3, '64c66b8f-b82e-4c7a-b714-9adc32cd5ff6.jpeg', 'http://www.baidu.com111', '1681725297763');
INSERT INTO `b_ad` VALUES (4, '5f299ffb-c2f8-4ade-980e-cba7d4938519.png', 'http://www.baidu.com/kkk', '1681725339563');
INSERT INTO `b_ad` VALUES (6, 'eb71dae5-b84d-4b9a-8e36-5b2adf25c4e2.png', 'www.bing.com', '1682734858115');

-- ----------------------------
-- Table structure for b_address
-- ----------------------------
DROP TABLE IF EXISTS `b_address`;
CREATE TABLE `b_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `def` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_address_user_id_a37a8d6a_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_address
-- ----------------------------
INSERT INTO `b_address` VALUES (19, '单独', NULL, NULL, NULL, '1683465050274', NULL);
INSERT INTO `b_address` VALUES (22, 'aa', 'd', NULL, NULL, '1683543865613', NULL);
INSERT INTO `b_address` VALUES (23, 'd', 'd', NULL, NULL, '1683543878597', NULL);
INSERT INTO `b_address` VALUES (25, '李冰冰', '17899990011', '广州市中山路8号', '0', '1683543980977', 2);
INSERT INTO `b_address` VALUES (26, '刘若琳', '15899999999', '济南市历下区奥体西路99号', '1', '1683544028303', 2);
INSERT INTO `b_address` VALUES (27, '刘德华', '12322222223', '香港中路888号', '0', '1683544308777', 2);

-- ----------------------------
-- Table structure for b_banner
-- ----------------------------
DROP TABLE IF EXISTS `b_banner`;
CREATE TABLE `b_banner`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `thing_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_banner_thing_id_3f307d00_fk_b_thing_id`(`thing_id`) USING BTREE,
  CONSTRAINT `b_banner_thing_id_3f307d00_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

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
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_classification
-- ----------------------------
INSERT INTO `b_classification` VALUES (1, '服装', '1681347523973');
INSERT INTO `b_classification` VALUES (2, '零食', '1681347533598');
INSERT INTO `b_classification` VALUES (3, '图书', '1681347534635');
INSERT INTO `b_classification` VALUES (4, '儿童玩具', '1681347558409');
INSERT INTO `b_classification` VALUES (5, '厨房用品', '1681347559996');
INSERT INTO `b_classification` VALUES (6, '电器', '1681347562381');
INSERT INTO `b_classification` VALUES (7, '办公用品', '1681347567736');

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `comment_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `like_count` int(0) NOT NULL DEFAULT 0,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `thing_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_comment_user_id_46f0670f_fk_b_user_id`(`user_id`) USING BTREE,
  INDEX `b_comment_thing_id_57ab492b_fk_b_thing_id`(`thing_id`) USING BTREE,
  CONSTRAINT `b_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_comment_thing_id_57ab492b_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_comment
-- ----------------------------
INSERT INTO `b_comment` VALUES (8, 'aa', '1683427717415', 10, 2, 2);
INSERT INTO `b_comment` VALUES (9, '大大', '1683431295759', 3, 2, 2);
INSERT INTO `b_comment` VALUES (10, '请求', '1683432294300', 11, 2, 2);
INSERT INTO `b_comment` VALUES (11, '问问', '1683432299591', 11, 2, 2);
INSERT INTO `b_comment` VALUES (12, '啊啊', '1683460886756', 0, 2, 2);
INSERT INTO `b_comment` VALUES (13, '哈哈哈', '1683722530385', 3, 2, 55);
INSERT INTO `b_comment` VALUES (14, '009999', '1683722533784', 1, 2, 55);
INSERT INTO `b_comment` VALUES (15, 'askldjglkasdg', '1707289762173', 0, 2, 56);

-- ----------------------------
-- Table structure for b_notice
-- ----------------------------
DROP TABLE IF EXISTS `b_notice`;
CREATE TABLE `b_notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_notice
-- ----------------------------
INSERT INTO `b_notice` VALUES (1, 'test', '今日新货打折出售', '2023-03-12 10:41:47.053444');
INSERT INTO `b_notice` VALUES (2, '新品', '新到联想电脑30台1999元', '1681465796380');
INSERT INTO `b_notice` VALUES (4, 'test', '测试消息123哈哈哈哈', '1681465829203');

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `order_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pay_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `thing_id` bigint(0) NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `count` int(0) NOT NULL DEFAULT 0,
  `order_number` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `receiver_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `receiver_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `receiver_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_order_thing_id_4e345e2c_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_order_user_id_64854046_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_order_thing_id_4e345e2c_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_order
-- ----------------------------
INSERT INTO `b_order` VALUES (77, '2', '1707298866280', NULL, 77, 2, 1, '1707298866280', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (78, '2', '1707298896295', NULL, 79, 2, 1, '1707298896295', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (79, '2', '1707298973978', NULL, 79, 2, 1, '1707298973978', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (80, '2', '1707299092677', NULL, 79, 2, 1, '1707299092677', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (81, '2', '1707299991878', NULL, 15, 2, 1, '1707299991878', '香港中路888号', '刘德华', '12322222223', NULL);
INSERT INTO `b_order` VALUES (82, '1', '1707300305788', NULL, 16, 2, 1, '1707300305788', '香港中路888号', '刘德华', '12322222223', NULL);

-- ----------------------------
-- Table structure for b_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_tag`;
CREATE TABLE `b_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_tag
-- ----------------------------
INSERT INTO `b_tag` VALUES (1, '测试', '0');
INSERT INTO `b_tag` VALUES (2, '汽车', '1681347572848');
INSERT INTO `b_tag` VALUES (4, '烧烤', '1681347572848');
INSERT INTO `b_tag` VALUES (5, '潮牌', '1681347572848');
INSERT INTO `b_tag` VALUES (6, '儿童', '1681347572848');
INSERT INTO `b_tag` VALUES (7, '编程', '1681347572848');
INSERT INTO `b_tag` VALUES (8, '科技', '1681347572848');
INSERT INTO `b_tag` VALUES (9, '吃货', '1681347572848');
INSERT INTO `b_tag` VALUES (10, '游乐园', '0');
INSERT INTO `b_tag` VALUES (11, '家电', '1681347572848');
INSERT INTO `b_tag` VALUES (12, '配件', '1681347572848');
INSERT INTO `b_tag` VALUES (13, '无线', '1681347572848');
INSERT INTO `b_tag` VALUES (14, '文具', '1681347572848');
INSERT INTO `b_tag` VALUES (16, '好吃的', '1681382971561');
INSERT INTO `b_tag` VALUES (18, '豆豆', '1682592402128');

-- ----------------------------
-- Table structure for b_thing
-- ----------------------------
DROP TABLE IF EXISTS `b_thing`;
CREATE TABLE `b_thing`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `repertory` int(0) NOT NULL,
  `score` int(0) NULL DEFAULT 0,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pv` int(0) NULL DEFAULT 0,
  `recommend_count` int(0) NULL DEFAULT 0,
  `wish_count` int(0) NULL DEFAULT 0,
  `collect_count` int(0) NULL DEFAULT 0,
  `classification_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_thing_classification_id_47675ac4_fk_b_classification_id`(`classification_id`) USING BTREE,
  CONSTRAINT `b_thing_ibfk_1` FOREIGN KEY (`classification_id`) REFERENCES `b_classification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_thing
-- ----------------------------
INSERT INTO `b_thing` VALUES (1, '西瓜呜呜呜哈哈哈', '4a5c51b4-f837-40c5-9925-fdb63d494533.jpeg', '啊啊', '330', '0', 30, 0, '2023-03-11 18:05:25.130644', 0, 0, 2, 2, 1);
INSERT INTO `b_thing` VALUES (2, '测试商品', 'ea71ad95-7da2-41c0-9e49-ea2b96f81e53.jpeg', '看看姐姐', '9', '0', 90, 0, '2023-03-17 20:34:49.160642', 0, 0, 11, 1, 3);
INSERT INTO `b_thing` VALUES (3, '古古怪怪哈哈哈哈', '70e77e0a-019a-44b3-ac28-8399ef030728.jpeg', '哈哈哈哈哈哈哈哈哈哈哈刚刚发的第三十四撒身上', '9', '0', 98, 0, '2023-03-17 20:35:39.100000', 3, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (6, '小红色敞篷车', 'ed6410b5-16ea-4f90-b853-c4d6e48a8548.jpeg', '这款 Red 小跑车采用复古造型和高品质结构。 耐用的钢体、真正的橡胶轮胎和经典的加工提供了可靠的骑行体验,可持续使用多年。 工作转向帮助孩子在学习如何转向时发展运动技能。 舒适的座椅靠背增加了符合人体工程学的支撑力,橡胶轮胎提供安静、无刮痕的骑行体验。 Honking 喇叭增加了乐趣。最大承重能力为 42 磅。 适合 1-3 岁的儿童。', '211', '0', 1111, 0, '2023-03-19 20:40:53.393238', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (7, 'Little Tikes', '88f76aa8-b9dd-4831-b772-e5466e877da9.jpeg', 'Little Tikes 易得分篮球套装专为 18 个月至 5 岁的儿童设计,向孩子们介绍各种能力的篮球比赛和比赛。 高度可在 2.5 至 1.2 米之间进行六种设置,甚至是小的呼啦圈星星。 超大篮筐和儿童篮球确保轻松得分,帮助孩子发展手眼协调能力,同时提供合适的挑战水平。 在玩之前,将沙子添加到底座上以确保稳定性。', '211', '0', 213, 0, '2023-03-19 20:43:38.294480', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (8, '恐龙舒适轿车', '266001d1-d4bd-41cb-9a09-8ab94991f35d.jpeg', '介绍 Little Tikes 舒适情侣恐龙。 几代，孩子们在玩具上 Cozy Coupee 的原始骑行者，一直在道路上冒险和想象力。 现在这款经典的儿童跑车拥有全新的外观 - 穿上我们的 Cozy Coupe Dino 骑行吧！ 有趣的恐龙造型让小孩子想象力奔跑，鼓励各种冒险。', '54', '0', 345, 0, '2023-03-19 20:44:33.546024', 9, 0, 1, 0, 4);
INSERT INTO `b_thing` VALUES (9, '婴儿摇铃玩具', '58cd7cef-c4c6-4dd4-8d25-fc8d3e0af8ad.jpeg', '2003年，宝贝儿子呱呱坠地，让Ellen和Michael Diamant初尝为人父母的喜悦。像多数新晋爸妈一样，幸福之余面对琳琅满目的婴儿产品，要在很短的时间内选出满意的方案，他们也难免感到不知所措。\r\n为了觅得一款又美观又实用的尿布袋，他们各处寻找却一无所获，由此决定自力更生，踏上设计之途。\r\n将近十年来，Ellen和Michael先后推出数百种产品，始终致力于打造以“一切各得其所”为理念的解决方案，旨在为和自己一样忙碌的父母奉上贴心、实用而美观的产品。\r\n如今，SkipHop已成为婴儿用品行业备受赞誉的全球品牌，以创新、出色的设计和优异的品质赢得有要求的爸妈们的一致肯定。', '876', '0', 479, 0, '2023-03-19 20:46:23.734708', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (10, '贝适安busybuddy狗狗漏食玩具', '9a6c7d68-6856-424d-897c-804bdca2f4a5.jpeg', '总公司创立于1988年，旗下的玩具品牌Busy Buddy，为一系列可塞零食抗***的创意玩具，每个玩具各有其独特的造型，相对的就有其专属的塞零食方式，可当成***赏玩具，也可以陪伴狗狗度过独处的时光，激发狗狗无线创意，同时消耗精力释放压力。天然无毒材质，结构密实。请依照狗狗体型及嗜咬程度选择正确的尺寸，才能让玩具发挥功效，并延长玩具的寿命。Busy Buddy曾因出色的设计和性能在国际宠物界多次***。目前产地是中国，产品主要在北美及欧洲销售。', '32', '0', 65, 0, '2023-03-19 20:47:33.732547', 88, 0, 2, 2, 4);
INSERT INTO `b_thing` VALUES (11, '大型犬拼图玩具', '36509a1c-65a9-4e53-b919-4b592c32a04d.jpeg', '大型犬拼图玩具 狗狗*拼图喂食器 用于智商训练和大脑刺激的玩具 用于*分配的狗狗丰富玩具 慢速喂食 心理刺激作为给小狗、中型、大型犬的礼物', '321', '0', 744, 0, '2023-03-19 20:48:34.733491', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (12, '侏罗纪世界 HLP16 玩具', '2baa3f45-61ac-4cf4-a837-48c419621dde.jpeg', '美国专业的婴幼儿学习用品品牌，旗下产品涉及针对不同年龄段儿童的学习点读机、学习桌、玩具等。 这款 探索工具箱，适用于2-5岁宝宝，学习拆卸和构建，培养宝宝工程师思维。', '56', '0', 432, 0, '2023-03-19 20:49:43.137552', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (13, '快乐小鲁班军事系列积木战斗机', '50b04075-6b81-46a9-90da-4d5af215265b.jpeg', '孩子到了适当的年纪，开始发挥他们无比的好奇心与想象力。这时候妈妈们就应该为孩子挑选一款适合的积木玩具。积木玩具是培养锻炼儿童智力最好的早教玩具。它提供更多的机会去发挥他们的想象力和创造力。孩子们在摆搭之前要想好自己搭些什么，要观察，思考选用什么样的块块才能体现他所构想的形象，因此对儿童的想象力，结构思维，造型能力是很好的锻炼，而且可发展孩子们的空间知觉，创造力，发挥儿童组织力和理解力，增强耐力及对建筑科学的兴趣。\r\n那么孩子玩积木玩具的有什么好处？ \r\n积木玩具可以锻炼宝宝以下能力：\r\n1、通过一些动作，处理视觉输入。良好的手触摸，眼睛协调能力也有利于一般身体协调和平衡。\r\n2、创造力和想象力的发挥能促进孩子们不断尝试一些新的想法，帮助他们逐渐形成一种创新思维和不断寻找解决问题的新方法。\r\n3、有利于发展“空间智慧”。孩子在玩具积木的过程中不停地研究布局、结构，这有利于他们掌握物体形状，辨别空间方位，把握二维和三维空间及其转换。\r\n4、帮助孩子们学会通过推理，来得出结论，包括数学，逻辑推理，科学分析等思维形式。在孩子们成长的过程中需要这种能力进行有效的统计，测量，推理，归纳，分析等。', '432', '0', 321, 0, '2023-03-19 20:54:05.429884', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (14, '烧烤和Groove Camper - 玩具套装带', '31ab2951-96f8-4d8e-adee-5fd6c46a4e5d.jpeg', '孩子到了适当的年纪，开始发挥他们无比的好奇心与想象力。这时候妈妈们就应该为孩子挑选一款适合的积木玩具。积木玩具是培养锻炼儿童智力最好的早教玩具。它提供更多的机会去发挥他们的想象力和创造力。孩子们在摆搭之前要想好自己搭些什么，要观察，思考选用什么样的块块才能体现他所构想的形象，因此对儿童的想象力，结构思维，造型能力是很好的锻炼，而且可发展孩子们的空间知觉，创造力，发挥儿童组织力和理解力，增强耐力及对建筑科学的兴趣。\r\n那么孩子玩积木玩具的有什么好处？ [1] \r\n积木玩具可以锻炼宝宝以下能力：\r\n1、通过一些动作，处理视觉输入。良好的手触摸，眼睛协调能力也有利于一般身体协调和平衡。\r\n2、创造力和想象力的发挥能促进孩子们不断尝试一些新的想法，帮助他们逐渐形成一种创新思维和不断寻找解决问题的新方法。\r\n3、有利于发展“空间智慧”。孩子在玩具积木的过程中不停地研究布局、结构，这有利于他们掌握物体形状，辨别空间方位，把握二维和三维空间及其转换。\r\n4、帮助孩子们学会通过推理，来得出结论，包括数学，逻辑推理，科学分析等思维形式。在孩子们成长的过程中需要这种能力进行有效的统计，测量，推理，归纳，分析等。', '32', '0', 211, 0, '2023-03-19 20:55:57.715472', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (15, '毛绒兔子幸运吉祥物玩具', '1fbbae3b-887b-45f3-8ef9-a2904edee5b6.jpeg', '孩子到了适当的年纪，开始发挥他们无比的好奇心与想象力。这时候妈妈们就应该为孩子挑选一款适合的积木玩具。积木玩具是培养锻炼儿童智力最好的早教玩具。它提供更多的机会去发挥他们的想象力和创造力。孩子们在摆搭之前要想好自己搭些什么，要观察，思考选用什么样的块块才能体现他所构想的形象，因此对儿童的想象力，结构思维，造型能力是很好的锻炼，而且可发展孩子们的空间知觉，创造力，发挥儿童组织力和理解力，增强耐力及对建筑科学的兴趣。\r\n那么孩子玩积木玩具的有什么好处？ [1] \r\n积木玩具可以锻炼宝宝以下能力：\r\n1、通过一些动作，处理视觉输入。良好的手触摸，眼睛协调能力也有利于一般身体协调和平衡。\r\n2、创造力和想象力的发挥能促进孩子们不断尝试一些新的想法，帮助他们逐渐形成一种创新思维和不断寻找解决问题的新方法。\r\n3、有利于发展“空间智慧”。孩子在玩具积木的过程中不停地研究布局、结构，这有利于他们掌握物体形状，辨别空间方位，把握二维和三维空间及其转换。\r\n4、帮助孩子们学会通过推理，来得出结论，包括数学，逻辑推理，科学分析等思维形式。在孩子们成长的过程中需要这种能力进行有效的统计，测量，推理，归纳，分析等。', '887', '0', 987, 0, '2023-03-19 20:56:46.041419', 0, 0, 0, 0, 4);
INSERT INTO `b_thing` VALUES (16, '趣味水果计数器', '09c48dc0-9e4b-4304-9798-48e8b659f5ef.jpeg', '孩子到了适当的年纪，开始发挥他们无比的好奇心与想象力。这时候妈妈们就应该为孩子挑选一款适合的积木玩具。积木玩具是培养锻炼儿童智力最好的早教玩具。它提供更多的机会去发挥他们的想象力和创造力。孩子们在摆搭之前要想好自己搭些什么，要观察，思考选用什么样的块块才能体现他所构想的形象，因此对儿童的想象力，结构思维，造型能力是很好的锻炼，而且可发展孩子们的空间知觉，创造力，发挥儿童组织力和理解力，增强耐力及对建筑科学的兴趣。\r\n那么孩子玩积木玩具的有什么好处？ [1] \r\n积木玩具可以锻炼宝宝以下能力：\r\n1、通过一些动作，处理视觉输入。良好的手触摸，眼睛协调能力也有利于一般身体协调和平衡。\r\n2、创造力和想象力的发挥能促进孩子们不断尝试一些新的想法，帮助他们逐渐形成一种创新思维和不断寻找解决问题的新方法。\r\n3、有利于发展“空间智慧”。孩子在玩具积木的过程中不停地研究布局、结构，这有利于他们掌握物体形状，辨别空间方位，把握二维和三维空间及其转换。\r\n4、帮助孩子们学会通过推理，来得出结论，包括数学，逻辑推理，科学分析等思维形式。在孩子们成长的过程中需要这种能力进行有效的统计，测量，推理，归纳，分析等。', '321', '0', 444, 0, '2023-03-19 20:57:37.048066', 0, 0, 1, 0, 4);
INSERT INTO `b_thing` VALUES (17, 'SQL入门经典（第5版）（异步图书） (计算机编程入门经典系列 31)', 'f08190e5-502e-476c-a4f9-f7eac0be937b.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '324', '0', 555, 0, '2023-03-19 21:01:52.110574', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (18, 'TCP/IP入门经典（第5版）（异步图书） (计算机编程入门经典系列 33)', 'edff6448-f92e-4f92-a475-1556ca7a7615.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '56', '0', 777, 0, '2023-03-19 21:02:32.424351', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (19, '像计算机科学家一样思考Python（第2版）（异步图书）', '92b6a1c4-f786-441b-a285-ad8262db560f.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '321', '0', 66, 0, '2023-03-19 21:03:22.283539', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (20, '硅谷之火：个人计算机的诞生与衰落（第3版）（图灵图书）', 'e9bbf322-28a9-4b87-83da-f1028971ac72.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '876', '0', 999, 0, '2023-03-19 21:03:56.544521', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (21, 'SAP从入门到精通（异步图书） (计算机行业应用软件系列)', '7c37dbd8-956a-43d8-a476-0fe7f0b36e95.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '378', '0', 987, 0, '2023-03-19 21:04:25.873270', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (22, '数据结构与算法图解（图灵图书）', '8e50750e-cada-47ff-8fcc-9b531d67e780.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '874', '0', 846, 0, '2023-03-19 21:04:57.521332', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (23, '计算机科学精粹', 'f480ca9b-abc5-4bbf-8a69-e872fc842679.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '386', '0', 222, 0, '2023-03-19 21:05:28.347980', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (24, 'C++多线程编程实战', '3f75945f-46c2-4bb7-9d16-3f89dda111bf.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '837', '0', 322, 0, '2023-03-19 21:06:05.068109', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (25, '算法精粹：经典计算机科学问题的', '3b456cbf-0fff-44c1-8adc-5e6261a6b25f.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '390', '0', 876, 0, '2023-03-19 21:06:38.022644', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (26, '计算机网络教程(第4版)', '9f576635-f270-4e3a-92ec-741692d80cb7.jpeg', '能开发 GUI 软件的编程语言众多，既有传统的 C++、C#、VB、Delphi、Java，也有新晋选手 Python、Node.js（JavaScript），还有小众的易语言（中文编程语言）。\r\n\r\n如果你只是想玩玩，那么你随意，适合自己的就行，其中 Python 上手比较简单。\r\n\r\n如果你想找一份工作，建议学习 C++ 或者 C#。C# 虽然比 C++ 简单一点，但是它只适用于 Windows 平台；而 C++ 是一种通用语言，它可以应用于 Windows、Linux 以及嵌入式平台，就业选择较多。\r\n2) 网站开发\r\n网站开发分为前端和后台，前端就是用户在浏览器中看到的界面，后台就是放在服务器上的程序。\r\n\r\n前端开发需要学习 HTML、CSS 和 JavaScript，没得选，而且必须都学习。\r\n\r\n后台发开语言则多如牛毛，有走进坟墓的 ASP、Ruby on Rails，也有常用的 PHP、Java（JSP）、C#（ASP.NET），还有新晋选手 Python、Node.js（JavaScript）、Go 语言。\r\n\r\n如果你想自己玩玩或者创业，建议选择 PHP，上手非常简单。我使用的也是 PHP，因为当时学不会 ASP.NET 和 JSP，所以选择了简单的 PHP。\r\n\r\n如果你想找一份工作，那么已经走近坟墓的 ASP、Ruby on Rails 就不要选了，没人用了。C# 也不要选了，只适用于 Windows 平台，而大量的服务器都是 Linux。Python 也不要选，实际应用场景不多。Go 语言主要用作 Web 底层开发，而不是应用层开发。\r\n\r\n剩下的 PHP、Java、Node.js 你自己看着办吧，没法说哪种语言一定有优势，它们只是适用于不同的场景。\r\n\r\n值得一提的是，这里我们将 Node.js 和 JavaScript 看做是等价的，如果你选择了 JavaScript，那么你既能开发网站前端，也能开发网站后台，就不用学习多种编程语言了。', '556', '0', 900, 0, '2023-03-19 21:07:15.063253', 0, 0, 0, 0, 3);
INSERT INTO `b_thing` VALUES (27, '邱吉尔蝴蝶花罐装碎巧克力黄油饼', '94c9900c-1922-4616-9d9f-46917eb177ef.jpeg', '一：苏打饼干\r\n\r\n纤维素很低，B族维生素消失殆尽\r\n\r\n苏打饼干含糖、含油较少，又加入了酵母，具有发酵制品特有香味，往往被认为是饼干里最有营养的，也被很多人当作早餐。但事实并非如此，为让饼干达到起层效果会添加小苏打，小苏打会减少面粉中的B族维生素，甚至会使之消失殆尽。\r\n\r\n二：曲奇饼干\r\n\r\n高糖、高油脂、低蛋白质\r\n\r\n曲奇饼干中的糖和油脂要高于其他种类的饼干。一小块曲奇饼干的热量往往超过一杯草莓汁!较酥脆的曲奇饼干选择的原料是“低筋粉”，也就是蛋白质比较少的小麦粉，这种饼干还不如馒头的蛋白质高。\r\n\r\n三：威化饼干\r\n\r\n热量高，结构密度低，吃多了不易察觉\r\n\r\n与其他饼干不同的是，威化饼干是以小米粉(糯米粉)、淀粉为主要原料，比精白面粉营养稍高。但威化饼中的奶油脂肪含量十分高，平均每一块60卡路里，而且密度低，吃不饱，所以吃多了也不容易察觉。其实，三块巧克力威化饼的热量就已经超过200卡路里了。\r\n\r\n四：夹心饼干\r\n\r\n“心”是添加剂合成，没有水果原料\r\n\r\n夹心饼干是在两块饼干之间添加糖、油脂或果酱为主要原料的各种夹心料的夹心焙烤食品。夹心饼干里的“心”为追求味道和颜色会使用添加剂，一般是 香精和色素，很少真正添加什么水果原料，\r\n\r\n比如橘子味夹心饼干，不是加入橘子，而是添加剂调和成的，虽然添加剂不一定有害，但不会带来营养，可能还不如单纯 的饼干好。因此不管多么美味的饼干都只能小食，而且饼干多半都很干，食用后很容易出现有\"热气\"(上火)针状。因此在平时生活中，对各种夹心饼干也只能点到为止。\r\n\r\n五：全麦饼干\r\n\r\n提高了营养同时也提高了油脂量\r\n\r\n纤维素含量较高的全麦饼干，因为纤维素口感较差，为弥补口感，生产商往往会在饼干里加入很多油，导致油脂含量较高。但如果包装上标榜的所谓全麦、燕麦、黑麦、五谷饼干等原料，在配料表里排名倒数几位，那可能不是真正的谷物饼干。', '901', '0', 321, 0, '2023-03-19 21:11:17.327821', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (28, 'SKATER 斯凯达 便当盒 储存容', 'e9c140a4-e077-4750-8e3d-9db540a150d0.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '531', '0', 222, 0, '2023-03-19 21:27:07.696079', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (29, '米饭，我是汉堡！', 'cad0f753-04da-4ebd-aeed-d2ce83cf0b9c.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '152', '0', 315, 0, '2023-03-19 21:27:44.825427', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (30, 'SKATER 斯凯达 收纳盒 折叠收纳', 'dfbbcffe-362e-42d0-bcdd-063f5b307553.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '315', '0', 415, 0, '2023-03-19 21:28:13.898216', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (31, '套烧烤汉堡套装，高品质汉堡套装，配有 Pro 汉堡压榨', '1de697b6-a299-4f0b-9bc0-f26518f2b6fd.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '365', '0', 432, 0, '2023-03-19 21:28:47.277461', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (32, '疯狂汉堡游戏 快速建立', '2013778b-2460-4d76-ac9c-90ec5e1d7f2f.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '416', '0', 155, 0, '2023-03-19 21:29:27.383885', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (33, '汉堡汽车卡车', '63538afc-533a-44b1-8e00-7466e0c528ae.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '366', '0', 333, 0, '2023-03-19 21:30:00.683509', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (34, '美国经典汉堡狗玩具', 'fb209198-480a-4e4c-a665-56efa58c1942.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '312', '0', 333, 0, '2023-03-19 21:30:27.226393', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (35, '卡套 带卷轴 收纳袋', '45fa2ea1-c066-4770-a6d7-57b9846005d9.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '332', '0', 333, 0, '2023-03-19 21:31:01.606326', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (36, '斯凯达 杯子 洗碗机安全', '3e96dae1-8f41-4d70-9de0-c9e4c529d81b.jpeg', '饼干的诞生，背后的故事也同样充满着意外性，在 十九世纪五十年代的某一天，天空乌云密布，忽起狂风，使一艘出海勘察英国帆船触礁，被迫在法国比斯湾附近的一个荒岛上停泊，船员们虽死里逃生，但岛上没有任何食物亦是船员们重生后的又一个难题。百般无奈的他们只好等风停后再次登上那艘已经破烂不堪的船上搜刮粮食，但遗憾的是，船上储备的面粉、奶油、砂糖等等都已经泡在水里了，船员们毫无办法，只好将这一切几乎已经泡烂的东西带到岛上，待面团稍微烘干一点后，将它一点一点地撕下，捏成一个个小团，然后烤熟后分给大家吃。但让人感到意外的是，用此方法烤出来的东西竟是如此美味，酥松香脆，且饱腹感强，船员们因此也有了生存下去的希望。一段时间过后，船员们回到了英国，为了纪念此次脱险，他们再一次用这个方法做出来了同样的美味，并以海湾的名字命名这一份美味为 “比斯湾”，这就是饼干的英文名“ biscuit”的由来。\r\n\r\n然而在世界的另一边，饼干的英语被称为 “Cracker”，然而较为有趣的是，从美国市场流入中国广东来的 饼干，广东人却 称它为“克力架  ”，有人认为这是广东人为饼干营销而作出的“ 噱头 ”，不以为然，其实他们都错了。因为在美国英语里 ，饼干就叫Cracker，只是广东人按粤语音译为“克力架”。而法语饼干名称“Biscuit”在美国英语中是指“热食的软饼”，即可丽饼、华夫饼等等。\r\n\r\n\r\n时至今日，市面上的饼干产品已是多种多样，但总体而言分为两大类，分别是美国式的“薄而脆”和英国式的“厚而酥”，而近期流行的“披萨饼干”，也是采用西方披萨外形，增加水果元素，给传统饼干带来创新。', '801', '0', 1111, 0, '2023-03-19 21:31:29.923693', 0, 0, 0, 0, 2);
INSERT INTO `b_thing` VALUES (37, '巴伐利亚短款男装 | 传统德国正品', '3a24c6d2-40ab-4bb4-a744-80bf04220e39.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '477', '0', 421, 0, '2023-03-20 20:26:09.974673', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (38, '男士修身Polo衫,带标志细节', 'fe1245c5-0d59-4d50-90d6-ca680267027e.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '78', '0', 44, 0, '2023-03-20 20:27:01.006599', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (39, '男士带徽标弹力棉平角内裤（3件装）', 'a281dfe1-3c78-4522-b38e-c53de2ff22c9.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '876', '0', 904, 0, '2023-03-20 20:27:36.058562', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (40, '保罗拉夫劳伦 男士轻质华夫格长袖亨利衫', '5a7fc4c7-4327-4e69-9e5e-82182d19bc03.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '821', '0', 58, 0, '2023-03-20 20:28:10.238931', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (41, '工装HH标志棉质编织腰带，带扣可调腰带', 'f79c3ceb-9690-4be8-b188-ff91933bffab.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '908', '0', 43, 0, '2023-03-20 20:28:44.181929', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (42, '范思哲 男式 VE1241 眼镜 54 毫米', '7fc5f045-ac08-4be1-b88a-f07545a0e45c.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '45', '0', 55, 0, '2023-03-20 20:29:19.038740', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (43, '多色大马钥匙扣 皮革 黑色', 'debc41a3-20b8-4e01-b17d-fca1a7820574.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '43', '0', 1111, 0, '2023-03-20 20:29:52.053595', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (44, '男士 凉鞋', '701d29e3-8c39-46c3-95ae-264c87ee13d2.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '87', '0', 877, 0, '2023-03-20 20:30:24.446335', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (45, '足部护理 男装 魔法粉 鞋子除臭粉', '2c9276dc-b3ee-4328-be6f-a8739eaf3531.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '33', '0', 333, 0, '2023-03-20 20:30:57.188485', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (46, '短款网球袜，运动透气防气泡速干无绒单', '3c4b2947-aa34-4e69-8f3c-904e01a6791a.jpeg', '优衣库(Uniqlo) 的内在涵义是指通过摒弃了不必要装潢装饰的仓储型店铺，采用超市型的自助购物方式，以合理可信的价格提供顾客希望的商品。\r\n\r\n创造优衣库 (Uniqlo) 品牌的Fast retailing股份有限公司，前身是1949年3月开业的山口县的个人企业，1963年5月变更为股份有限公司，原名为小郡商事株式会社，1991年改为迅销。\r\n\r\n价廉物美的休闲装“UNIQLO”是Unique Clothing Warehouse的缩写，以为消费者提供“低价良品、品质保证”的经营理念，在日本经济低迷时期取得了惊人的业绩。\r\n\r\n迅销公司名称是FAST RETAILING，这其中包含了很多特别的含义。FAST（迅速）+RETAILING（零售）体现了如何将顾客的要求迅速商品化、如何迅速提供商品这一企业根本精神，也表达了他们期望成为拥有快餐文化这一世界通用理念的零售企业界之不可动摇的信念。\r\n\r\n这个理念是指通过全世界统一的服务、以合理可信的价格、大量持续提供任何时候、任何地方、任何人都可以穿着的服装。因此他们拥有独特的商品策划、开发和销售体系，从而实现店铺运作低成本化。', '467', '0', 555, 0, '2023-03-20 20:31:31.217097', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (47, '卷发棒 灰色 32毫米 熨斗 家电 家电 护发素', '07dfd814-28a7-408a-ba89-368789592361.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '999', '0', 888, 0, '2023-03-20 20:35:56.641337', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (48, '陶瓷涂层不粘煎锅 9.4 英寸(约 24 厘米易于抓握,柔', 'b988bb82-552b-4ae9-acfb-b6eff78e221f.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '789', '0', 654, 0, '2023-03-20 20:36:38.195239', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (49, '博朗 男士电动剃须刀 系列', 'af235af7-f71f-416a-9e38-68c3ad26ad20.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '432', '0', 666, 0, '2023-03-20 20:37:16.692421', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (50, '食物垃圾处理器', '3d01f74c-20b3-47f5-8fa9-740c7cddbf07.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '654', '0', 544, 0, '2023-03-20 20:37:55.567506', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (51, '流式麦克风音频 - 单向心型', '3d5c44b6-de8b-42ac-8a15-910ec593c72a.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '567', '0', 54, 0, '2023-03-20 20:38:30.550391', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (52, '冰箱门把手盖厨房家电防护手套防滑布保护套', '791e2e6a-6db9-4d54-9f92-cbb9c91c57d9.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '67', '0', 54, 0, '2023-03-20 20:39:08.169454', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (53, '传统家电企业如何互联', '55c42013-b94e-44c6-b839-81471cc04dcb.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '543', '0', 43, 0, '2023-03-20 20:39:41.092252', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (54, '厨房 收纳 家电 置物架', '119c87c5-b59e-4936-9fbc-cd8351470dc1.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '46', '0', 777, 0, '2023-03-20 20:40:32.602409', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (55, '多功能锅 可同时煎烤+炖煮（电烤盘和平底锅）', 'e98af765-4b0f-4f4b-8e8a-f232133ab100.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '43', '0', 333, 0, '2023-03-20 20:41:08.213680', 0, 0, 0, 0, 5);
INSERT INTO `b_thing` VALUES (56, '锁套装适用于家电厨', '7859b029-5bc2-4ece-8546-4408ce8d69bb.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '908', '0', 777, 0, '2023-03-20 20:41:39.847980', 0, 0, 0, 1, 5);
INSERT INTO `b_thing` VALUES (57, 'ProClip 车载支架', 'ca174798-a1fe-4e1a-ab03-8d80d74ad0d4.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '433', '0', 222, 0, '2023-03-20 20:47:14.464968', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (58, '数据电缆适用于黑莓', 'b86fc2cd-f135-419d-8039-600d10cf674f.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '32', '0', 1111, 0, '2023-03-20 20:47:44.902310', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (59, '自行车 Bike 婴儿车 管道', '98be90a3-8c89-436c-a24b-c16ac3c379df.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '433', '0', 322, 0, '2023-03-20 20:48:15.890308', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (60, '腊肠犬长毛皮狗包/钥匙圈饰品', 'e1d4e3a4-06e7-4d96-b60d-71cb8db4b019.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '45', '0', 112, 0, '2023-03-20 20:48:48.121962', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (61, '数据线 适用于', '4ec354f7-8651-4919-b878-342896444193.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '76', '0', 987, 0, '2023-03-20 20:49:20.085623', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (62, '手持防静电刷,适用于薄膜、玻璃和丙烯酸', '4aa269a6-4c83-4263-a6cb-740ad108bcd1.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '987', '0', 906, 0, '2023-03-20 20:49:57.228662', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (63, 'Damascena 获奖无年眼', '066794d5-285c-467c-b2dc-de0b2597b758.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '890', '0', 666, 0, '2023-03-20 20:50:32.617691', 0, 0, 1, 1, 6);
INSERT INTO `b_thing` VALUES (64, '挂绳 UCF迷你/M/Q', 'f77de97e-b79d-48b7-b6e5-6567df26585f.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '433', '0', 888, 0, '2023-03-20 20:51:02.196500', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (65, '优质皮革翻盖外壳适用于', 'b7c5ee92-17f1-4040-bed8-6f61f3f5930d.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '655', '0', 433, 0, '2023-03-20 20:51:32.773396', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (66, '经典镀铬硬壳适用', '9da218e9-becd-4b16-aedf-82fc46b6b2ce.jpeg', '世界上第一台电饭煲，是由日本人井深大发明于1950年代。电饭煲又称作电锅，是利用电能转变为热能的炊具，使用方便，清洁卫生，还具有对食品进行蒸、煮、炖、煨等多种操作功能。\r\n中国第一台简易电饭煲则是1976年生产出的。从机械式控制，到电子式控制，再到微电脑控制，再是将要成为主流的电磁电饭煲和微压力电饭煲，电饭煲的控制技术也经历了几个重要的阶段。 电热水壶基本就是有水壶到电加热的一个过程，结构相比而言简单一些，电热水壶是一个不断改进的过程。现不仅有自动控温功能，更增添了童锁等安全设计，如特设黄色警告式锁盖，全方位保障用户使用安全。\r\n西式小家电电水壶正被中国市场逐步接受。据极品传播机构调研数据，2006年，中国国内电水壶市场容量达到了900万台。2007年1～4月份，国内电水壶销售量平均增幅为35%，预计下半年电水壶市场还继续保持这个增长速度，高于2006年的30%。参照海外市场80%以上城镇家庭普及率，中国的电水壶市场远未饱和，发展空间巨大。', '433', '0', 444, 0, '2023-03-20 20:52:05.014584', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (67, '揭秘美国打击商', '839fb8e2-636e-47bb-a39f-7c6d326de88f.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '87', '0', 877, 0, '2023-03-21 20:50:59.061006', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (68, '用python实现办公自动', '7da385db-6603-4e08-ad6b-2de775dfab68.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '76', '0', 789, 0, '2023-03-21 20:51:55.225562', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (69, '行政办公流程与制度范', '1085cacc-bd97-451b-b9f0-a5a3bfa0cd13.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '89', '0', 888, 0, '2023-03-21 20:52:32.828554', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (70, '苹果办公三剑客', 'b395ea5c-e5a9-4a56-9b5e-f1736078e722.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '87', '0', 78, 0, '2023-03-21 20:53:08.491835', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (71, '玩转Access数据库', '63e916d9-75c2-4398-bd10-0a578c13031a.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '899', '0', 89, 0, '2023-03-21 20:53:43.985441', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (72, '函数的一知半', 'b6dbbb0e-262f-4267-83ef-bf527d0c8aa0.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '89', '0', 89, 0, '2023-03-21 20:54:40.412503', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (73, '家居办公用品 手推车和搬运', 'f6b8099e-9c89-4795-b3fc-ee128b5b637c.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '89', '0', 980, 0, '2023-03-21 20:55:24.414391', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (74, 'Word办公应用技巧', '3dc65bc1-32e6-42f5-a426-1cdf0b5b12d2.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '87', '0', 987, 0, '2023-03-21 20:56:06.272710', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (75, '文秘办公应用典', 'ed17adc0-d18a-4ea4-9447-7817fc2a4168.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '899', '0', 98, 0, '2023-03-21 20:56:38.987872', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (76, '珍贵木制办公桌墨水瓶', 'af4777cd-2f23-4c05-9fdd-bd07274f008b.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '90', '0', 98, 0, '2023-03-21 20:57:15.095312', 0, 0, 0, 0, 7);
INSERT INTO `b_thing` VALUES (77, '英寸笔记本电', '4e5065a6-4dbd-4c20-97b6-92f1e4192647.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '32', '0', 322, 0, '2023-03-21 20:58:48.388531', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (78, '松下电器 Lumix 系统相', '1316bb64-a45c-4154-b333-a8cdd74e8c48.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '344', '0', 33, 0, '2023-03-21 21:00:43.665083', 0, 0, 0, 0, 6);
INSERT INTO `b_thing` VALUES (79, '印花乌克兰别针翻领', '1693fa26-ea7f-455b-86c6-3d3d73082562.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '433', '0', 32, 0, '2023-03-21 21:02:11.366736', 0, 0, 0, 0, 1);
INSERT INTO `b_thing` VALUES (80, '印花休闲长袖蝴蝶结', 'f7f8a920-5a79-480e-9288-d3caf83df406.jpeg', '复印机、打印机、传真机、证卡机、考勤机等等……是集光学、机械、电子技术为一体的精密办公设备，通过使用颗小的静电墨粉，利用静电原理，在感光材料上形成静电潜像，使微小的墨粉附在感光材料上，再将其转印到纸上从而得到需要副本。这个工序是利用静电的特性进行的。因此，在机器内部的传动部件、光学部件以及高压部件上容易附着纸屑、漂浮的墨粉等，但这些的存在只会影响复印的质量。若放任不管，会增加机器的驱动负荷，妨碍热量的排除，说不定也可能是造成机器故障的原因。\r\n定期的维护保养，可以清除机器内部的污垢，在必要的部件上加注润滑油，清洁光学部件，改善复印品质量，将可能发生的故障消灭在萌芽状态，减少停机时间。\r\n为了始终得到良好的复印品质量，缩短停机时间，减少损失，建议用户在保修期结束之前，与授权代理商签订维修保养协议，以使您的机器在保修期后仍能享受保修期般的服务，获得长久保障。', '33', '0', 321, 0, '2023-03-21 21:02:52.454089', 0, 0, 1, 1, 1);
INSERT INTO `b_thing` VALUES (81, '英寸笔记本电脑包,黑色', 'b5de8200-ff15-4574-8e38-7642fe952f77.jpeg', '关于配送时间的预估仅供参考，实际配送受清关或天气等不可抗力因素的影响，您可在“我的订单”中跟踪包裹查看配送状态，如有疑问请联系客服咨询。\r\n• 亚马逊海外购商品符合海关进出口政策要求，且支持中国除港澳台地区之外的全境配送，但部分偏远地区的配送时间会相应延长，少数商品不支持配送。如果您已成功下单而我们无法为您配送，我们会及时通知您。\r\n• 亚马逊海外购商品目前不支持晚间送货、预约送货、自提等服务。', '321', '0', 333, 0, '2023-03-22 20:29:00.305841', 0, 0, 2, 4, 6);

-- ----------------------------
-- Table structure for b_thing_collect
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_collect`;
CREATE TABLE `b_thing_collect`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(0) NOT NULL,
  `user_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_collect_thing_id_user_id_45b9f252_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_collect_user_id_e5d69968_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_collect_thing_id_8edce8b3_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_thing_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_tag`;
CREATE TABLE `b_thing_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(0) NOT NULL,
  `tag_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_tag_thing_id_tag_id_a5d426b2_uniq`(`thing_id`, `tag_id`) USING BTREE,
  INDEX `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `b_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_tag_thing_id_fb8ecf3f_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 398 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_thing_tag
-- ----------------------------
INSERT INTO `b_thing_tag` VALUES (373, 1, 2);
INSERT INTO `b_thing_tag` VALUES (374, 2, 4);
INSERT INTO `b_thing_tag` VALUES (375, 2, 5);
INSERT INTO `b_thing_tag` VALUES (372, 6, 6);
INSERT INTO `b_thing_tag` VALUES (371, 7, 6);
INSERT INTO `b_thing_tag` VALUES (387, 8, 5);
INSERT INTO `b_thing_tag` VALUES (388, 8, 6);
INSERT INTO `b_thing_tag` VALUES (385, 9, 1);
INSERT INTO `b_thing_tag` VALUES (386, 9, 6);
INSERT INTO `b_thing_tag` VALUES (368, 10, 5);
INSERT INTO `b_thing_tag` VALUES (369, 10, 6);
INSERT INTO `b_thing_tag` VALUES (366, 11, 5);
INSERT INTO `b_thing_tag` VALUES (367, 11, 6);
INSERT INTO `b_thing_tag` VALUES (364, 12, 5);
INSERT INTO `b_thing_tag` VALUES (365, 12, 6);
INSERT INTO `b_thing_tag` VALUES (362, 13, 5);
INSERT INTO `b_thing_tag` VALUES (363, 13, 6);
INSERT INTO `b_thing_tag` VALUES (360, 14, 5);
INSERT INTO `b_thing_tag` VALUES (361, 14, 6);
INSERT INTO `b_thing_tag` VALUES (357, 15, 2);
INSERT INTO `b_thing_tag` VALUES (358, 15, 5);
INSERT INTO `b_thing_tag` VALUES (359, 15, 6);
INSERT INTO `b_thing_tag` VALUES (355, 16, 5);
INSERT INTO `b_thing_tag` VALUES (356, 16, 6);
INSERT INTO `b_thing_tag` VALUES (354, 17, 4);
INSERT INTO `b_thing_tag` VALUES (352, 18, 4);
INSERT INTO `b_thing_tag` VALUES (353, 18, 5);
INSERT INTO `b_thing_tag` VALUES (350, 19, 7);
INSERT INTO `b_thing_tag` VALUES (351, 19, 8);
INSERT INTO `b_thing_tag` VALUES (348, 20, 7);
INSERT INTO `b_thing_tag` VALUES (349, 20, 8);
INSERT INTO `b_thing_tag` VALUES (346, 21, 7);
INSERT INTO `b_thing_tag` VALUES (347, 21, 8);
INSERT INTO `b_thing_tag` VALUES (344, 22, 7);
INSERT INTO `b_thing_tag` VALUES (345, 22, 8);
INSERT INTO `b_thing_tag` VALUES (342, 23, 7);
INSERT INTO `b_thing_tag` VALUES (343, 23, 8);
INSERT INTO `b_thing_tag` VALUES (340, 24, 7);
INSERT INTO `b_thing_tag` VALUES (341, 24, 8);
INSERT INTO `b_thing_tag` VALUES (338, 25, 7);
INSERT INTO `b_thing_tag` VALUES (339, 25, 8);
INSERT INTO `b_thing_tag` VALUES (336, 26, 7);
INSERT INTO `b_thing_tag` VALUES (337, 26, 8);
INSERT INTO `b_thing_tag` VALUES (334, 27, 4);
INSERT INTO `b_thing_tag` VALUES (335, 27, 6);
INSERT INTO `b_thing_tag` VALUES (332, 28, 4);
INSERT INTO `b_thing_tag` VALUES (333, 28, 9);
INSERT INTO `b_thing_tag` VALUES (331, 29, 9);
INSERT INTO `b_thing_tag` VALUES (330, 30, 9);
INSERT INTO `b_thing_tag` VALUES (384, 31, 9);
INSERT INTO `b_thing_tag` VALUES (329, 32, 9);
INSERT INTO `b_thing_tag` VALUES (328, 33, 9);
INSERT INTO `b_thing_tag` VALUES (327, 34, 9);
INSERT INTO `b_thing_tag` VALUES (326, 35, 9);
INSERT INTO `b_thing_tag` VALUES (325, 36, 9);
INSERT INTO `b_thing_tag` VALUES (323, 37, 5);
INSERT INTO `b_thing_tag` VALUES (324, 37, 10);
INSERT INTO `b_thing_tag` VALUES (321, 38, 5);
INSERT INTO `b_thing_tag` VALUES (322, 38, 10);
INSERT INTO `b_thing_tag` VALUES (319, 39, 5);
INSERT INTO `b_thing_tag` VALUES (320, 39, 10);
INSERT INTO `b_thing_tag` VALUES (317, 40, 5);
INSERT INTO `b_thing_tag` VALUES (318, 40, 10);
INSERT INTO `b_thing_tag` VALUES (382, 41, 5);
INSERT INTO `b_thing_tag` VALUES (383, 41, 10);
INSERT INTO `b_thing_tag` VALUES (315, 42, 5);
INSERT INTO `b_thing_tag` VALUES (316, 42, 10);
INSERT INTO `b_thing_tag` VALUES (313, 43, 5);
INSERT INTO `b_thing_tag` VALUES (314, 43, 10);
INSERT INTO `b_thing_tag` VALUES (311, 44, 5);
INSERT INTO `b_thing_tag` VALUES (312, 44, 10);
INSERT INTO `b_thing_tag` VALUES (309, 45, 5);
INSERT INTO `b_thing_tag` VALUES (310, 45, 10);
INSERT INTO `b_thing_tag` VALUES (307, 46, 5);
INSERT INTO `b_thing_tag` VALUES (308, 46, 10);
INSERT INTO `b_thing_tag` VALUES (305, 47, 8);
INSERT INTO `b_thing_tag` VALUES (306, 47, 11);
INSERT INTO `b_thing_tag` VALUES (302, 48, 5);
INSERT INTO `b_thing_tag` VALUES (303, 48, 8);
INSERT INTO `b_thing_tag` VALUES (304, 48, 11);
INSERT INTO `b_thing_tag` VALUES (299, 49, 5);
INSERT INTO `b_thing_tag` VALUES (300, 49, 8);
INSERT INTO `b_thing_tag` VALUES (301, 49, 11);
INSERT INTO `b_thing_tag` VALUES (296, 50, 5);
INSERT INTO `b_thing_tag` VALUES (297, 50, 8);
INSERT INTO `b_thing_tag` VALUES (298, 50, 11);
INSERT INTO `b_thing_tag` VALUES (293, 51, 5);
INSERT INTO `b_thing_tag` VALUES (294, 51, 8);
INSERT INTO `b_thing_tag` VALUES (295, 51, 11);
INSERT INTO `b_thing_tag` VALUES (289, 52, 5);
INSERT INTO `b_thing_tag` VALUES (290, 52, 8);
INSERT INTO `b_thing_tag` VALUES (291, 52, 9);
INSERT INTO `b_thing_tag` VALUES (292, 52, 11);
INSERT INTO `b_thing_tag` VALUES (287, 53, 8);
INSERT INTO `b_thing_tag` VALUES (288, 53, 11);
INSERT INTO `b_thing_tag` VALUES (282, 54, 5);
INSERT INTO `b_thing_tag` VALUES (283, 54, 6);
INSERT INTO `b_thing_tag` VALUES (284, 54, 7);
INSERT INTO `b_thing_tag` VALUES (285, 54, 10);
INSERT INTO `b_thing_tag` VALUES (286, 54, 11);
INSERT INTO `b_thing_tag` VALUES (380, 55, 8);
INSERT INTO `b_thing_tag` VALUES (381, 55, 11);
INSERT INTO `b_thing_tag` VALUES (378, 56, 8);
INSERT INTO `b_thing_tag` VALUES (379, 56, 11);
INSERT INTO `b_thing_tag` VALUES (376, 57, 8);
INSERT INTO `b_thing_tag` VALUES (377, 57, 12);
INSERT INTO `b_thing_tag` VALUES (394, 58, 8);
INSERT INTO `b_thing_tag` VALUES (395, 58, 12);
INSERT INTO `b_thing_tag` VALUES (396, 58, 16);
INSERT INTO `b_thing_tag` VALUES (397, 58, 18);
INSERT INTO `b_thing_tag` VALUES (278, 59, 8);
INSERT INTO `b_thing_tag` VALUES (279, 59, 12);
INSERT INTO `b_thing_tag` VALUES (276, 60, 8);
INSERT INTO `b_thing_tag` VALUES (277, 60, 12);
INSERT INTO `b_thing_tag` VALUES (274, 61, 8);
INSERT INTO `b_thing_tag` VALUES (275, 61, 12);
INSERT INTO `b_thing_tag` VALUES (272, 62, 8);
INSERT INTO `b_thing_tag` VALUES (273, 62, 12);
INSERT INTO `b_thing_tag` VALUES (270, 63, 8);
INSERT INTO `b_thing_tag` VALUES (271, 63, 12);
INSERT INTO `b_thing_tag` VALUES (268, 64, 8);
INSERT INTO `b_thing_tag` VALUES (269, 64, 12);
INSERT INTO `b_thing_tag` VALUES (266, 65, 8);
INSERT INTO `b_thing_tag` VALUES (267, 65, 12);
INSERT INTO `b_thing_tag` VALUES (264, 66, 8);
INSERT INTO `b_thing_tag` VALUES (265, 66, 12);
INSERT INTO `b_thing_tag` VALUES (261, 67, 7);
INSERT INTO `b_thing_tag` VALUES (262, 67, 8);
INSERT INTO `b_thing_tag` VALUES (263, 67, 9);
INSERT INTO `b_thing_tag` VALUES (259, 68, 13);
INSERT INTO `b_thing_tag` VALUES (260, 68, 14);
INSERT INTO `b_thing_tag` VALUES (255, 69, 8);
INSERT INTO `b_thing_tag` VALUES (256, 69, 9);
INSERT INTO `b_thing_tag` VALUES (257, 69, 12);
INSERT INTO `b_thing_tag` VALUES (258, 69, 14);
INSERT INTO `b_thing_tag` VALUES (252, 70, 11);
INSERT INTO `b_thing_tag` VALUES (253, 70, 13);
INSERT INTO `b_thing_tag` VALUES (254, 70, 14);
INSERT INTO `b_thing_tag` VALUES (249, 71, 12);
INSERT INTO `b_thing_tag` VALUES (250, 71, 13);
INSERT INTO `b_thing_tag` VALUES (251, 71, 14);
INSERT INTO `b_thing_tag` VALUES (246, 72, 12);
INSERT INTO `b_thing_tag` VALUES (247, 72, 13);
INSERT INTO `b_thing_tag` VALUES (248, 72, 14);
INSERT INTO `b_thing_tag` VALUES (243, 73, 12);
INSERT INTO `b_thing_tag` VALUES (244, 73, 13);
INSERT INTO `b_thing_tag` VALUES (245, 73, 14);
INSERT INTO `b_thing_tag` VALUES (240, 74, 8);
INSERT INTO `b_thing_tag` VALUES (241, 74, 13);
INSERT INTO `b_thing_tag` VALUES (242, 74, 14);
INSERT INTO `b_thing_tag` VALUES (237, 75, 11);
INSERT INTO `b_thing_tag` VALUES (238, 75, 13);
INSERT INTO `b_thing_tag` VALUES (239, 75, 14);
INSERT INTO `b_thing_tag` VALUES (389, 76, 12);
INSERT INTO `b_thing_tag` VALUES (390, 76, 13);
INSERT INTO `b_thing_tag` VALUES (391, 76, 14);
INSERT INTO `b_thing_tag` VALUES (392, 76, 16);
INSERT INTO `b_thing_tag` VALUES (393, 76, 18);
INSERT INTO `b_thing_tag` VALUES (229, 77, 5);
INSERT INTO `b_thing_tag` VALUES (230, 77, 6);
INSERT INTO `b_thing_tag` VALUES (231, 77, 7);
INSERT INTO `b_thing_tag` VALUES (232, 77, 8);
INSERT INTO `b_thing_tag` VALUES (233, 77, 11);
INSERT INTO `b_thing_tag` VALUES (226, 78, 9);
INSERT INTO `b_thing_tag` VALUES (227, 78, 10);
INSERT INTO `b_thing_tag` VALUES (228, 78, 11);
INSERT INTO `b_thing_tag` VALUES (223, 79, 10);
INSERT INTO `b_thing_tag` VALUES (224, 79, 12);
INSERT INTO `b_thing_tag` VALUES (225, 79, 14);
INSERT INTO `b_thing_tag` VALUES (221, 80, 6);
INSERT INTO `b_thing_tag` VALUES (222, 80, 10);
INSERT INTO `b_thing_tag` VALUES (216, 81, 4);
INSERT INTO `b_thing_tag` VALUES (217, 81, 5);
INSERT INTO `b_thing_tag` VALUES (218, 81, 8);
INSERT INTO `b_thing_tag` VALUES (219, 81, 11);
INSERT INTO `b_thing_tag` VALUES (220, 81, 12);

-- ----------------------------
-- Table structure for b_thing_wish
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_wish`;
CREATE TABLE `b_thing_wish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `thing_id` bigint(0) NOT NULL,
  `user_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_wish_thing_id_user_id_9d647bbb_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_wish_user_id_e2d94f6c_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_wish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b_thing_wish_thing_id_f0864b16_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_thing_wish
-- ----------------------------
INSERT INTO `b_thing_wish` VALUES (15, 1, 2);
INSERT INTO `b_thing_wish` VALUES (8, 2, 2);
INSERT INTO `b_thing_wish` VALUES (16, 80, 2);

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `role` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `score` int(0) NULL DEFAULT 0,
  `push_email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `push_switch` tinyint(1) NULL DEFAULT 0,
  `token` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES (2, 'ddd', '123', '1', '0', 'test', 'ec794bf4-da3c-4c69-ad67-ae17ef3803b1.jpeg', '13211112222', '13333@111.com', NULL, '333000', NULL, 8, 'hh333@mail.cn', 1, 'a4c9855f2a97a78b604d0fb258880b21');
INSERT INTO `b_user` VALUES (3, 'www', '123', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'dcf7e9c1ca5211b175e1572e6980d4b5');
INSERT INTO `b_user` VALUES (5, 'sss', '123', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1683425605400', 3, NULL, NULL, '37e8f6ae0ef304cccadd6c19481b331b');
INSERT INTO `b_user` VALUES (7, 'admin123', '123', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1683963040980', 0, NULL, 0, 'f159053ec4a0e4a0e3c66cfd7c254853');
INSERT INTO `b_user` VALUES (8, 'admin', '123', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1683963080205', 0, NULL, 0, '9116392dc24b7b84483ba00b0d72b80c');
INSERT INTO `b_user` VALUES (9, 'admin1', '123', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1683967886490', 0, NULL, 0, 'ee9aa725dbbb485c1fe8b150d6b0f2c1');

SET FOREIGN_KEY_CHECKS = 1;

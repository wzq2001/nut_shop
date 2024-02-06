CREATE TABLE `b_user`
(
    `id`          INT AUTO_INCREMENT,
    `username`    VARCHAR(255) NOT NULL COMMENT '用户名',
    `password`    VARCHAR(255) NOT NULL COMMENT '密码',
    `nickname`    VARCHAR(255) COMMENT '昵称',
    `mobile`      VARCHAR(255) COMMENT '手机号码',
    `email`       VARCHAR(255) COMMENT '电子邮箱',
    `description` TEXT COMMENT '用户描述',
    `role`        VARCHAR(255) COMMENT '用户角色',
    `status`      VARCHAR(255) COMMENT '用户状态',
    `score`       INT COMMENT '用户分数',
    `avatar`      VARCHAR(255) COMMENT '用户头像链接',
    `token`       VARCHAR(255) COMMENT '用户令牌',
    `create_time` DATETIME COMMENT '创建时间',
    `push_email`  VARCHAR(255) COMMENT '推送邮箱',
    `push_switch` VARCHAR(255) COMMENT '推送开关',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户表';

CREATE TABLE `b_thing_wish`
(
    `id`       BIGINT AUTO_INCREMENT,
    `thing_id` VARCHAR(255) NOT NULL COMMENT '事物ID',
    `user_id`  VARCHAR(255) NOT NULL COMMENT '用户ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='事物愿望表';

CREATE TABLE `b_thing_tag`
(
    `id`       BIGINT AUTO_INCREMENT,
    `thing_id` BIGINT NOT NULL COMMENT '事物ID',
    `tag_id`   BIGINT NOT NULL COMMENT '标签ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='事物标签关联表';

CREATE TABLE `b_thing_collect`
(
    `id`       BIGINT AUTO_INCREMENT,
    `thing_id` VARCHAR(255) NOT NULL COMMENT '事物ID',
    `user_id`  VARCHAR(255) NOT NULL COMMENT '用户ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户收藏事物表';

CREATE TABLE `b_thing`
(
    `id`                BIGINT AUTO_INCREMENT,
    `title`             VARCHAR(255) NOT NULL COMMENT '标题',
    `cover`             VARCHAR(255) COMMENT '封面图片URL',
    `description`       TEXT COMMENT '描述',
    `price`             VARCHAR(255) COMMENT '价格',
    `status`            VARCHAR(255) COMMENT '状态',
    `create_time`       DATETIME COMMENT '创建时间',
    `repertory`         VARCHAR(255) COMMENT '库存',
    `score`             VARCHAR(255) COMMENT '评分',
    `pv`                VARCHAR(255) COMMENT '页面浏览量',
    `recommend_count`   VARCHAR(255) COMMENT '推荐计数',
    `wish_count`        VARCHAR(255) COMMENT '愿望计数',
    `collect_count`     VARCHAR(255) COMMENT '收藏计数',
    `classification_id` BIGINT COMMENT '分类ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='事物表';

CREATE TABLE `b_tag`
(
    `id`          BIGINT AUTO_INCREMENT,
    `title`       VARCHAR(255) NOT NULL COMMENT '标签标题',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='标签表';

CREATE TABLE `b_order`
(
    `id`               BIGINT AUTO_INCREMENT,
    `status`           VARCHAR(255) NOT NULL COMMENT '订单状态',
    `order_time`       DATETIME COMMENT '订单时间',
    `pay_time`         DATETIME COMMENT '支付时间',
    `thing_id`         VARCHAR(255) COMMENT '商品ID',
    `user_id`          VARCHAR(255) COMMENT '用户ID',
    `count`            INT COMMENT '数量',
    `order_number`     VARCHAR(255) NOT NULL COMMENT '订单编号',
    `receiver_address` VARCHAR(255) COMMENT '收货地址',
    `receiver_name`    VARCHAR(255) COMMENT '收货人姓名',
    `receiver_phone`   VARCHAR(255) COMMENT '收货人电话',
    `remark`           TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单表';

CREATE TABLE `b_notice`
(
    `id`          BIGINT AUTO_INCREMENT,
    `title`       VARCHAR(255) COMMENT '标题',
    `content`     TEXT COMMENT '内容',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='通知表';


CREATE TABLE `b_comment`
(
    `id`           BIGINT AUTO_INCREMENT,
    `content`      TEXT COMMENT '评论内容',
    `comment_time` DATETIME COMMENT '评论时间',
    `like_count`   INT COMMENT '点赞数',
    `user_id`      BIGINT COMMENT '用户ID',
    `thing_id`     BIGINT COMMENT '事物ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='评论表';

CREATE TABLE `b_classification`
(
    `id`          BIGINT AUTO_INCREMENT,
    `title`       VARCHAR(255) COMMENT '分类标题',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='分类表';

CREATE TABLE `b_banner`
(
    `id`          BIGINT AUTO_INCREMENT,
    `image`       VARCHAR(255) COMMENT '图片URL',
    `thing_id`    BIGINT COMMENT '事物ID',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='横幅广告表';

CREATE TABLE `b_address`
(
    `id`          BIGINT AUTO_INCREMENT,
    `name`        VARCHAR(255) COMMENT '姓名',
    `mobile`      VARCHAR(255) COMMENT '手机',
    `description` TEXT COMMENT '地址描述',
    `def`         VARCHAR(255) COMMENT '是否默认',
    `create_time` DATETIME COMMENT '创建时间',
    `user_id`     BIGINT COMMENT '用户ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='地址表';

CREATE TABLE `b_ad`
(
    `id`          BIGINT AUTO_INCREMENT,
    `image`       VARCHAR(255) COMMENT '图片URL',
    `link`        VARCHAR(255) COMMENT '链接地址',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='广告表';

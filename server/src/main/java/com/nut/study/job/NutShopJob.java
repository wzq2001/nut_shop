package com.nut.study.job;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.nut.study.entity.Notice;
import com.nut.study.entity.Thing;
import com.nut.study.mapper.ThingMapper;
import com.nut.study.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class NutShopJob {

    @Autowired
    NoticeService noticeService;

    @Autowired
    ThingMapper thingMapper;

    //临期时长
    private static final Long EXPIRE_TIME = Long.valueOf(60 * 60 * 24 * 30) * 1000;

    //临期商品处理 5秒一次额
    @Scheduled(cron = "0/5 * * * * ?")
    public void handleProductExpire() {
        System.out.println("处理临期商品");
        //查询临期商品
        QueryWrapper<Thing> wrapper = new QueryWrapper<>();
        wrapper.lt("create_time", System.currentTimeMillis() + EXPIRE_TIME);
        wrapper.ge("create_time", System.currentTimeMillis());
        List<Thing> things = thingMapper.selectList(wrapper);
        for (Thing thing : things) {
            //发送通知
            Notice notice = new Notice();
            notice.setContent("商品:" + thing.getTitle() + "即将过期，请尽快处理");
            notice.setTitle("临期商品打折");
            noticeService.createNotice(notice);
        }
    }

}

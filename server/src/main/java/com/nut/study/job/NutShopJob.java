package com.nut.study.job;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.nut.study.entity.Notice;
import com.nut.study.entity.Thing;
import com.nut.study.mapper.NoticeMapper;
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
    NoticeMapper noticeMapper;
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
            QueryWrapper<Notice> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("title", "临期商品打折:" + thing.getTitle());
            Long l = noticeMapper.selectCount(queryWrapper);
            if (l > 0) {
                continue;
            }
            Notice notice = new Notice();
            String price = thing.getPrice();
            // 转换为整数
            long priceAsLong = (long) (Double.parseDouble(price) * 0.8);
            // 将 long 转换回字符串
            String newPrice = String.valueOf(priceAsLong);
            notice.setContent("商品:" + thing.getTitle() + "临期8折!价格由" + price + "元，下调为" + newPrice + "元!");
            notice.setTitle("临期商品打折:" + thing.getTitle());
            noticeService.createNotice(notice);
            thing.setPrice(newPrice);
            thingMapper.updateById(thing);
        }

        //查询过期商品下架
        QueryWrapper<Thing> wrapper1 = new QueryWrapper<>();
        wrapper1.le("create_time", String.valueOf(System.currentTimeMillis()));
        thingMapper.delete(wrapper1);
    }

}

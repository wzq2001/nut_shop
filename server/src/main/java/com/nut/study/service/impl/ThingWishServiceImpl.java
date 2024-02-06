package com.nut.study.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nut.study.mapper.ThingWishMapper;
import com.nut.study.service.ThingWishService;
import com.nut.study.entity.ThingWish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
class ThingWishServiceImpl extends ServiceImpl<ThingWishMapper, ThingWish> implements ThingWishService {
    @Autowired
    ThingWishMapper mapper;

    @Override
    public List<Map> getThingWishList(String userId) {
        return mapper.getThingWishList(userId);
    }

    @Override
    public void createThingWish(ThingWish thingWish) {
        mapper.insert(thingWish);;
    }

    @Override
    public void deleteThingWish(String id) {
        mapper.deleteById(id);
    }

    @Override
    public ThingWish getThingWish(String userId, String thingId) {
        QueryWrapper<ThingWish> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("thing_id", thingId)
                .eq("user_id", userId);
        return mapper.selectOne(queryWrapper);
    }
}

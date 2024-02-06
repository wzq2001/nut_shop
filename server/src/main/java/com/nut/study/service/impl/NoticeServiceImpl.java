package com.nut.study.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nut.study.entity.Notice;
import com.nut.study.mapper.NoticeMapper;
import com.nut.study.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements NoticeService {
    @Autowired
    NoticeMapper mapper;

    @Override
    public List<Notice> getNoticeList() {
        return mapper.selectList(new QueryWrapper<>());
    }

    @Override
    public void createNotice(Notice notice) {
        System.out.println(notice);
        notice.setCreateTime(String.valueOf(System.currentTimeMillis()));
        mapper.insert(notice);
    }

    @Override
    public void deleteNotice(String id) {
        mapper.deleteById(id);
    }

    @Override
    public void updateNotice(Notice notice) {
        mapper.updateById(notice);
    }
}

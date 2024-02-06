package com.nut.study.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.nut.study.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {

}

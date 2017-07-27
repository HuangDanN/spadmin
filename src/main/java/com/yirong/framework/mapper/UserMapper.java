package com.yirong.framework.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.yirong.framework.entity.User;

/**
 * @author xn-h
 * @describe(用户mapper映射类)
 * @create 2017/7/23
 **/
public interface UserMapper extends BaseMapper<User> {

	User selectByUsername(String loginname);
}

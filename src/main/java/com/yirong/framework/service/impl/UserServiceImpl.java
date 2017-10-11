package com.yirong.framework.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.yirong.framework.entity.User;
import com.yirong.framework.mapper.UserMapper;
import com.yirong.framework.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public User selectByUsername(String username) {
		Wrapper<User> wrapper = new EntityWrapper<>();
		wrapper.eq("LOGINNAME",username);
		return super.selectOne(wrapper);
	}

}

package com.yirong.framework.service.impl;

import com.yirong.framework.entity.User;
import com.yirong.framework.mapper.UserMapper;
import com.yirong.framework.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xn-h
 * @describe(用户业务逻辑实现类)
 * @create 2017/7/26
 **/
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User selectByUsername(String loginname) {
		return userMapper.selectByUsername(loginname);
	}
}

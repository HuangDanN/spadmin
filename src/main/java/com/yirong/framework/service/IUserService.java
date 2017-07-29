package com.yirong.framework.service;

import com.yirong.framework.entity.User;

/**
 * @author xn-h
 * @describe(用户业务逻辑接口)
 * @create 2017/7/26
 **/
public interface IUserService {

	User selectByUsername(String loginname);
}

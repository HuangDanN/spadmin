package com.yirong.framework.service;

import com.baomidou.mybatisplus.service.IService;
import com.yirong.framework.entity.User;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
public interface IUserService extends IService<User> {

	/**
	 * @describe ()
	 * @author xn-h
	 * @create 2017/9/20
	 * @param [username]
	 * @return com.yirong.framework.entity.User
	**/
	User selectByUsername(String username);

}

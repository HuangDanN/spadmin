package com.yirong.framework.service;

import com.yirong.framework.entity.Role;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 用户角色表 服务类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
public interface IRoleService extends IService<Role> {

	List<Role> queryRolesByUserName(String userName);
}

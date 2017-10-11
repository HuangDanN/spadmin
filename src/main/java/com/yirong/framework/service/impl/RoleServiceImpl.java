package com.yirong.framework.service.impl;

import com.yirong.framework.entity.Role;
import com.yirong.framework.mapper.RoleMapper;
import com.yirong.framework.service.IRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户角色表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

	@Autowired
	RoleMapper roleMapper;

	@Override
	public List<Role> queryRolesByUserName(String userName) {
		return roleMapper.queryRolesByUserName(userName);
	}
}

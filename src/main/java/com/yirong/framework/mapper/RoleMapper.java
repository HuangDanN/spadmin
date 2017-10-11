package com.yirong.framework.mapper;

import com.yirong.framework.entity.Role;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  * 用户角色表 Mapper 接口
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
public interface RoleMapper extends BaseMapper<Role> {

	List<Role> queryRolesByUserName(String userName);
}
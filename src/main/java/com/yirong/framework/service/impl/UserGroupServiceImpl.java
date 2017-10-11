package com.yirong.framework.service.impl;

import com.yirong.framework.entity.UserGroup;
import com.yirong.framework.mapper.UserGroupMapper;
import com.yirong.framework.service.IUserGroupService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户与组织机构关系表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class UserGroupServiceImpl extends ServiceImpl<UserGroupMapper, UserGroup> implements IUserGroupService {
	
}

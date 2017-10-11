package com.yirong.framework.service.impl;

import com.yirong.framework.entity.Group;
import com.yirong.framework.mapper.GroupMapper;
import com.yirong.framework.service.IGroupService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 组织机构表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class GroupServiceImpl extends ServiceImpl<GroupMapper, Group> implements IGroupService {
	
}

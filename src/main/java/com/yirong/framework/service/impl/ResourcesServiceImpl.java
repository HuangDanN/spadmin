package com.yirong.framework.service.impl;

import com.yirong.framework.entity.Resources;
import com.yirong.framework.mapper.ResourcesMapper;
import com.yirong.framework.service.IResourcesService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限资源表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class ResourcesServiceImpl extends ServiceImpl<ResourcesMapper, Resources> implements IResourcesService {
	
}

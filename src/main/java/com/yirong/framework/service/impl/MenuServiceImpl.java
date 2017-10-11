package com.yirong.framework.service.impl;

import com.yirong.framework.entity.Menu;
import com.yirong.framework.mapper.MenuMapper;
import com.yirong.framework.service.IMenuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台菜单管理 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {
	
}

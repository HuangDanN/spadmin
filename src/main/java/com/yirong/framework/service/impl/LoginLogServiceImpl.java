package com.yirong.framework.service.impl;

import com.yirong.framework.entity.LoginLog;
import com.yirong.framework.mapper.LoginLogMapper;
import com.yirong.framework.service.ILoginLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户登录记录表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements ILoginLogService {
	
}

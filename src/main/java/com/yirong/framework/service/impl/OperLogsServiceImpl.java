package com.yirong.framework.service.impl;

import com.yirong.framework.entity.OperLogs;
import com.yirong.framework.mapper.OperLogsMapper;
import com.yirong.framework.service.IOperLogsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class OperLogsServiceImpl extends ServiceImpl<OperLogsMapper, OperLogs> implements IOperLogsService {
	
}

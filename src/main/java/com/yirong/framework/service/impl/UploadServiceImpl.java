package com.yirong.framework.service.impl;

import com.yirong.framework.entity.Upload;
import com.yirong.framework.mapper.UploadMapper;
import com.yirong.framework.service.IUploadService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 上传文件/图片表 服务实现类
 * </p>
 *
 * @author xn-h
 * @since 2017-09-19
 */
@Service
public class UploadServiceImpl extends ServiceImpl<UploadMapper, Upload> implements IUploadService {
	
}

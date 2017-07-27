package com.yirong.framework.config.security.service.impl;

import java.util.List;

import com.yirong.framework.config.security.entity.AuthMetaData;
import com.yirong.framework.config.security.mapper.AuthMetaDataMapper;
import com.yirong.framework.config.security.service.IAuthMetaDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* @ClassName: IAuthMetaDataService
* @Description: TODO(权限角色 资源业务逻辑实现类)  
* @author hxn
* @date 2017年7月27日 下午2:18:55  
*
 */
@Service
public class AuthMetaDataService implements IAuthMetaDataService {

	@Autowired
	private AuthMetaDataMapper authMetaDataMapper;
	
	@Override
	public List<AuthMetaData> ListAuthMetaData() {
		// TODO Auto-generated method stub
		return authMetaDataMapper.ListAuthMetaData();
	}

}

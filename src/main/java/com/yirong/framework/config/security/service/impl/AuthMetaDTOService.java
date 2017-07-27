package com.yirong.framework.config.security.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yirong.framework.config.security.service.IAuthMetaDTOService;
import com.yirong.framework.dto.AuthMetaDTO;
import com.yirong.framework.mapper.AuthMetaDTOMapper;

/**
 * 
* @ClassName: AuthMetaDTOService  
* @Description: TODO(权限角色 资源业务逻辑实现类)  
* @author hxn
* @date 2017年7月27日 下午2:18:55  
*
 */
@Service
public class AuthMetaDTOService implements IAuthMetaDTOService{

	@Autowired
	private AuthMetaDTOMapper authMetaDTOMapper;
	
	@Override
	public List<AuthMetaDTO> ListAuthMetaDTO() {
		// TODO Auto-generated method stub
		return authMetaDTOMapper.ListAuthMetaDTO();
	}

}

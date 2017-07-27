package com.yirong.framework.config.security.service;

import java.util.List;

import com.yirong.framework.dto.AuthMetaDTO;

/**
 * 
* @ClassName: IAuthMetaDTOService  
* @Description: TODO(权限角色 资源业务逻辑接口)  
* @author hxn
* @date 2017年7月27日 下午2:17:27  
*
 */
public interface IAuthMetaDTOService {

	List<AuthMetaDTO> ListAuthMetaDTO();
}

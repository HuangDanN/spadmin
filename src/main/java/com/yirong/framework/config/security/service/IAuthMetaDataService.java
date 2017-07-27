package com.yirong.framework.config.security.service;

import java.util.List;

import com.yirong.framework.config.security.entity.AuthMetaData;

/**
 * 
* @ClassName: IAuthMetaDataService
* @Description: TODO(权限角色 资源业务逻辑接口)  
* @author hxn
* @date 2017年7月27日 下午2:17:27  
*
 */
public interface IAuthMetaDataService {

	List<AuthMetaData> ListAuthMetaData();
}

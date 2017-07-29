package com.yirong.framework.config.security.mapper;

import com.yirong.framework.config.security.entity.AuthMetaData;

import java.util.List;

/**
 * 
* @ClassName: AuthMetaDTOMapper  
* @Description: TODO(权限角色 资源Mapper映射类)  
* @author hxn
* @date 2017年7月27日 下午2:09:39  
*
 */
public interface AuthMetaDataMapper {

	List<AuthMetaData> ListAuthMetaData();
}

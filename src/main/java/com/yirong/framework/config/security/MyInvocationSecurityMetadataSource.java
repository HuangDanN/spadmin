package com.yirong.framework.config.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.yirong.framework.config.security.entity.AuthMetaData;
import com.yirong.framework.config.security.service.IAuthMetaDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import com.xiaoleilu.hutool.util.StrUtil;

/**
 * 
* @ClassName: MyInvocationSecurityMetadataSource  
* @Description: TODO(初始化权限信息)  
* @author hxn
* @date 2017年7月27日 下午1:56:07  
*
 */
@Component
public class MyInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {

	private static final Logger logger = LoggerFactory.getLogger(MyInvocationSecurityMetadataSource.class);
	
	@Autowired
	private IAuthMetaDataService authMetaDataService;
	
	private AntPathMatcher urlMatcher = new AntPathMatcher();
	
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	
	public static Map<String, Collection<String>> authMap = null;
	
	/**
	 * 
	* @Title: loadResourceDefine  
	* @Description:   加载 Role-Resource数据库信息进行配置
	* @param     设定文件  
	* @return void    返回类型  
	* @author hxn
	* @date 2017年7月27日 下午2:21:35  
	* @throws
	 */
	@PostConstruct
	public void loadResourceDefine() {
		logger.info("---------------开始加载 权限信息--------------------");
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		authMap = new HashMap<String, Collection<String>>();
		List<AuthMetaData> amList = authMetaDataService.ListAuthMetaData();
		
		for(AuthMetaData data:amList){
			Collection<String> roleList=authMap.get(data.getAuthCode());
			if (roleList == null || roleList.size() <= 0) {
				roleList = new ArrayList<String>();
			}
			roleList.add(data.getRoleCode());
			authMap.put(data.getAuthCode(), roleList);
			
			String url=data.getUrl();
			if(StrUtil.isBlank(url)){
				continue;
			}
			Collection<ConfigAttribute> calist = resourceMap.get(url);
			if (calist == null || calist.size() <= 0) {
				calist = new ArrayList<ConfigAttribute>();
			}
			ConfigAttribute roleCode = new SecurityConfig(data.getRoleCode());
			calist.add(roleCode);
			resourceMap.put(data.getUrl(), calist);
		}
		
		logger.info("---------------加载 权限信息 完成--------------------");
	}
	
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		// TODO Auto-generated method stub
		String url = ((FilterInvocation) object).getRequestUrl();
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();
			if (urlMatcher.match(resURL, url)) {
				return resourceMap.get(resURL);
			}
		}
		return null;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return true;
	}
	
	/**
	 * 
	* @Title: getNeedRole  
	* @Description:   根据URL返回所需要的权限
	* @param @param url
	* @param @return    设定文件  
	* @return Collection<ConfigAttribute>    返回类型  
	* @author hxn
	* @date 2017年7月27日 下午2:38:00  
	* @throws
	 */
	public static Collection<ConfigAttribute> getNeedRole(String url) {
		Iterator<String> ite = resourceMap.keySet().iterator();
		if(url == null)
		    url = "";
		while (ite.hasNext()) {
			String resURL = ite.next();
			AntPathMatcher urlMatcher = new AntPathMatcher();
			if (urlMatcher.match(resURL, url)) {
				return resourceMap.get(resURL);
			}
		}
		return null;
	}
	
	public void refresh() {
		this.loadResourceDefine();
	}

}

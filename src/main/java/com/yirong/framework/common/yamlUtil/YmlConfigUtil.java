package com.yirong.framework.common.yamlUtil;

import java.util.Map;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 
* @ClassName: YmlConfigUtil  
* @Description: TODO(获取yml配置信息工具类)  
* @author hxn
* @date 2017年7月27日 下午3:18:41  
*
 */
public class YmlConfigUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext = null;

    private static  Map<String,String> propertiesMap =null;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		if(YmlConfigUtil.applicationContext == null){
            YmlConfigUtil.applicationContext  = applicationContext;
        }
	}

	 public static String getConfigByKey(String key) throws JsonProcessingException {
		if (propertiesMap ==null){
			YmlConfig ymlConfig = applicationContext.getBean(YmlConfig.class);
	        propertiesMap = ymlConfig.getMapProps();
	    }
	    return propertiesMap.get(key);
	}
	
}

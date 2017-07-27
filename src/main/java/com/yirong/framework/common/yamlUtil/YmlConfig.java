package com.yirong.framework.common.yamlUtil;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 
* @ClassName: YmlConfig  
* @Description: TODO(yml配置类)  
* @author hxn
* @date 2017年7月27日 下午3:19:03  
*
 */
@Component
@ConfigurationProperties
public class YmlConfig {

	private Map<String,String> mapProps = new HashMap<>();

	public Map<String, String> getMapProps() {
		return mapProps;
	}

	public void setMapProps(Map<String, String> mapProps) {
		this.mapProps = mapProps;
	}
	
	
}

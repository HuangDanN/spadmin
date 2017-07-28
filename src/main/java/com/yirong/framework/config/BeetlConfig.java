package com.yirong.framework.config;

import java.util.Properties;

import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.xiaoleilu.hutool.util.StrUtil;

/**
 * 
* @ClassName: BeetlConfig  
* @Description: TODO(Beetl模板配置类)  
* @author hxn
* @date 2017年7月28日 下午1:56:10  
*
 */
@Configuration
@ConfigurationProperties(prefix = "beetl")
public class BeetlConfig {

	private String templatePath;
	
	private String delimiterStatementStart;
	
    private String delimiterStatementEnd;
	
    private String resourceTagsuffix;
	
    private String resourceAutoCheck;
	
	@Bean(initMethod = "init", name = "beetlConfig")
	public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
		BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
		try {
			ClasspathResourceLoader cploder = new ClasspathResourceLoader(BeetlConfig.class.getClassLoader(),templatePath);
			beetlGroupUtilConfiguration.setResourceLoader(cploder);
			beetlGroupUtilConfiguration.setConfigProperties(getProperties());
			return beetlGroupUtilConfiguration;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	@Bean(name = "beetlViewResolver")
    public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") 
    	BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);
        return beetlSpringViewResolver;
    }
	
	private Properties getProperties(){
		Properties properties = new Properties();
		if(StrUtil.isBlank(delimiterStatementStart)){
			if(delimiterStatementStart.startsWith("\\")){
                delimiterStatementStart = delimiterStatementStart.substring(1);
            }
            properties.setProperty("DELIMITER_STATEMENT_START",delimiterStatementStart);
		}
		if(StrUtil.isBlank(delimiterStatementEnd)){
			properties.setProperty("DELIMITER_STATEMENT_END",delimiterStatementEnd);
		}
		if(StrUtil.isBlank(resourceTagsuffix)){
			properties.setProperty("RESOURCE.tagSuffix",resourceTagsuffix);
		}
		if(StrUtil.isBlank(resourceAutoCheck)){
			properties.setProperty("RESOURCE.autoCheck",resourceAutoCheck);
		}
		return properties;
   }
}

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
	
	@Bean(initMethod = "init")
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
	
	@Bean
    public BeetlSpringViewResolver getBeetlSpringViewResolver() {
        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        beetlSpringViewResolver.setConfig(getBeetlGroupUtilConfiguration());
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

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}

	public String getDelimiterStatementStart() {
		return delimiterStatementStart;
	}

	public void setDelimiterStatementStart(String delimiterStatementStart) {
		this.delimiterStatementStart = delimiterStatementStart;
	}

	public String getDelimiterStatementEnd() {
		return delimiterStatementEnd;
	}

	public void setDelimiterStatementEnd(String delimiterStatementEnd) {
		this.delimiterStatementEnd = delimiterStatementEnd;
	}

	public String getResourceTagsuffix() {
		return resourceTagsuffix;
	}

	public void setResourceTagsuffix(String resourceTagsuffix) {
		this.resourceTagsuffix = resourceTagsuffix;
	}

	public String getResourceAutoCheck() {
		return resourceAutoCheck;
	}

	public void setResourceAutoCheck(String resourceAutoCheck) {
		this.resourceAutoCheck = resourceAutoCheck;
	}
}

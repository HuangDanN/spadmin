package com.yirong.framework.config.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractResourceBasedMessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.yirong.framework.common.CommonConstant;

/**
 * 
* @ClassName: SecurityBeanConfig  
* @Description: TODO(Security.bean配置类)  
* @author hxn
* @date 2017年7月27日 上午11:15:24  
*
 */
@Configuration
public class SecurityBeanConfig {

	@Bean
	public AuthenticationProvider authenticationProvider(){
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(null);
		daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
		AbstractResourceBasedMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:ValidationMessages");
		messageSource.setDefaultEncoding("UTF-8");
		daoAuthenticationProvider.setMessageSource(messageSource);
		return daoAuthenticationProvider;
	}
	
}

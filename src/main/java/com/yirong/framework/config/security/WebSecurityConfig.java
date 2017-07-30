package com.yirong.framework.config.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractResourceBasedMessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.yirong.framework.common.CommonConstant;

/**
 * @author xn-h
 * @describe(web权限控制配置)
 * @create 2017/7/23
 **/
@Configuration
@EnableWebSecurity
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


	@Autowired
	private MyUserDetailService userDetailService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private MyInvocationSecurityMetadataSource SecurityMetadataSource;

	@Autowired
	private MyAccessDecisionManager accessDecisionManager;

	@Override
	public void configure(WebSecurity web)throws Exception{
		web.ignoring()
				.antMatchers("/resources/**");    //资源无需验证权限
	}

	protected void configure(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.userDetailsService(userDetailService);
	}

	@Override
	public void configure(HttpSecurity http)throws Exception{
		http
			.authorizeRequests()
				//无需验证权限
				.antMatchers("/admin/login").permitAll()
				//需要登录权限
				.antMatchers("/admin/*").fullyAuthenticated()
			.and()
			.formLogin()
				.loginPage("/admin/login")  //登录页面
				.failureUrl("/admin/login") //失败跳转页面
				.loginProcessingUrl("/admin/securityLogin")  //登录认证url
				.successHandler(new MyAuthenticationSuccessHandler())   //成功处理类
			.and()
			.logout()
				.invalidateHttpSession(true)   //注销session
				.logoutSuccessUrl("/admin/login")  //注销跳转url
				.logoutUrl("/admin/securityLogout") //注销的url
			.and()
			.httpBasic()
			.and()
			.exceptionHandling().accessDeniedPage("/error/noright")
			.and()
			.authenticationProvider(authenticationProvider());
//			.addFilterBefore()
		http.addFilterBefore(filterSecurityInterceptor(), FilterSecurityInterceptor.class);
	}

	/**
	 * @describe (成功处理类)
	 * @author xn-h
	 * @create 2017/7/24
	 * @param
	 * @return
	**/
	public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

		@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
			String username = authentication.getName();
			request.getSession().setAttribute(CommonConstant.SESSION_USER_NAME, username);
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}

	@Bean
	public MyFilterSecurityInterceptor filterSecurityInterceptor(){
		MyFilterSecurityInterceptor filterSecurityInterceptor = new MyFilterSecurityInterceptor();
		filterSecurityInterceptor.setSecurityMetadataSource(SecurityMetadataSource);
		filterSecurityInterceptor.setAccessDecisionManager(accessDecisionManager);
		filterSecurityInterceptor.setAuthenticationManager(authenticationManager);
		return filterSecurityInterceptor;
	}

	@Bean
	public AuthenticationProvider authenticationProvider(){
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(userDetailService);
		daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
		AbstractResourceBasedMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:ValidationMessages");
		messageSource.setDefaultEncoding("UTF-8");
		daoAuthenticationProvider.setMessageSource(messageSource);
		return daoAuthenticationProvider;
	}
	
}

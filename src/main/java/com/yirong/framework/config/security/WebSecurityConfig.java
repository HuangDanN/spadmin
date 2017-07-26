package com.yirong.framework.config.security;

import com.yirong.framework.common.CommonConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xn-h
 * @describe(web权限控制配置)
 * @create 2017/7/23
 **/
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	private static final Logger logger = LoggerFactory.getLogger(WebSecurityConfig.class);

	@Override
	public void configure(WebSecurity web)throws Exception{
		web.ignoring()
				.antMatchers("/resources/**");    //资源无需验证权限
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
			.httpBasic();
//			.addFilterBefore()
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

}

package com.yirong.framework.config.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xn-h
 * @describe(校验用户信息，验证码)
 * @create 2017/7/24
 **/
@Component
public class DaoUserDetailService implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(DaoUserDetailService.class);

	@Autowired
	private HttpServletRequest request;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return null;
	}
}

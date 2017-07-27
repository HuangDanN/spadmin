package com.yirong.framework.config.security;

import com.octo.captcha.service.CaptchaServiceException;
import com.yirong.framework.common.captcha.CaptchaServiceSingleton;
import com.yirong.framework.entity.User;
import com.yirong.framework.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
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
public class MyUserDetailService implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(MyUserDetailService.class);

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private IUserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		String captchaId = request.getSession().getId();
		String captcha_value = request.getParameter("j_captcha");

		Boolean isResponseCorrect = Boolean.FALSE;
		try {
			isResponseCorrect = CaptchaServiceSingleton.getInstance()
					.validateResponseForID(captchaId, captcha_value);
		}

		catch (CaptchaServiceException ex) {
			logger.error("====验证码验证发生错误====", ex);
		}

		if (!isResponseCorrect) {
			throw new BadCredentialsException("验证码不正确");
		}

		if(username!=null){
			username=username.trim();
		}

		User user = userService.selectByUsername(username);
		if (user == null) {
			throw new BadCredentialsException("用户名不存在");
		}


		return null;
	}
}

package com.yirong.framework.controller;

import com.yirong.framework.view.LoginView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * @author xn-h
 * @describe(登录控制层)
 * @create 2017/9/20
 **/
@Controller
public class LoginController {

	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String index (HttpServletRequest request){
		return LoginView.LOGIN;
	}
}

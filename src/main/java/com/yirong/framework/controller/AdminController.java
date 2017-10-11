package com.yirong.framework.controller;

import com.yirong.framework.common.CommonConstant;
import com.yirong.framework.entity.User;
import com.yirong.framework.service.IMenuService;
import com.yirong.framework.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xn-h
 * @describe(admin控制层)
 * @create 2017/10/7
 **/
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private IMenuService menuService;
	@Autowired
	private IUserService userService;

	/*
	 * @describe (后台管理页面,加载菜单)
	 * @author xn-h
	 * @create 2017/10/7
	 * @param [request, model]
	 * @return java.lang.String
	**/
	@RequestMapping
	public String index(HttpServletRequest request, Model model) {
		String loginname = (String)request.getSession().getAttribute(CommonConstant.SESSION_USER_NAME);
		User user = userService.selectByUsername(loginname);
		return null;
	}
}

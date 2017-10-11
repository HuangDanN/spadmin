package com.yirong.framework.controller;

import com.yirong.framework.view.ErrorView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author xn-h
 * @describe(错误控制层)
 * @create 2017/10/3
 **/
@Controller
@RequestMapping(value = "/error")
public class ErrorController {

	@RequestMapping(value="/noright")
	public String noright() {
		return ErrorView.NORIGHT;
	}
}

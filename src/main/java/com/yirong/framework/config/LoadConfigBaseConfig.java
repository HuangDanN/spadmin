package com.yirong.framework.config;

import com.yirong.framework.common.system.SystemParaUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

/**
 * @author xn-h
 * @describe()
 * @create 2017/9/21
 **/
@Component
public class LoadConfigBaseConfig implements ApplicationListener<ContextRefreshedEvent> {

	private static final Logger logger = LoggerFactory.getLogger(LoadConfigBaseConfig.class);

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {

	}
}

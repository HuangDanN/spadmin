package com.yirong;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * 
* @ClassName: MainServletInitializer  
* @Description: TODO(Web程序启动类 用于打成war包)  
* @author hxn
* @date 2017年7月28日 下午3:42:05  
*
 */
public class MainServletInitializer extends SpringBootServletInitializer {

	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(MainApplication.class);
    }
}

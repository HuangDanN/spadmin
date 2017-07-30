package com.yirong.framework.config;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author xn-h
 * @describe(MybatisPlus配置类)
 * @create 2017/7/22
 **/
@Configuration
@MapperScan("com.**.mapper*")
public class MybatisPlusConfig {

	/**
	 * @describe (mybatis-plus分页插件)
	 * @author xn-h
	 * @create 2017/7/22
	 * @param []
	 * @return com.baomidou.mybatisplus.plugins.PaginationInterceptor
	**/
	@Bean
	public PaginationInterceptor paginationInterceptor() {
		return new PaginationInterceptor();
	}

	/**
	 * @describe (SQL 执行性能分析，开发环境使用，线上不推荐。 maxTime 指的是 sql 最大执行时长)
	 * @author xn-h
	 * @create 2017/7/22
	 * @param []
	 * @return com.baomidou.mybatisplus.plugins.PerformanceInterceptor
	**/
	@Bean
	public PerformanceInterceptor performanceInterceptor(){
		PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
		performanceInterceptor.setMaxTime(1000);
		performanceInterceptor.setFormat(true);
		return performanceInterceptor;
	}
}

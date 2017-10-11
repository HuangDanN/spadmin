package com.yirong.framework.config;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean;
import com.baomidou.mybatisplus.spring.boot.starter.SpringBootVFS;
import com.yirong.framework.common.dbtool.SQLInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @author xn-h
 * @describe(MybatisPlus配置类)
 * @create 2017/7/22
 **/
@Configuration
public class MybatisPlusConfig {

	/**
	 * @describe (mybatis-plus分页插件)
	 * @author xn-h
	 * @create 2017/7/22
	 * @param []
	 * @return com.baomidou.mybatisplus.plugins.PaginationInterceptor
	**/
//	@Bean
//	public PaginationInterceptor paginationInterceptor() {
//		return new PaginationInterceptor();
//	}

	/**
	 * @describe (SQL 执行性能分析，开发环境使用，线上不推荐。 maxTime 指的是 sql 最大执行时长)
	 * @author xn-h
	 * @create 2017/7/22
	 * @param []
	 * @return com.baomidou.mybatisplus.plugins.PerformanceInterceptor
	**/
//	@Bean
//	public PerformanceInterceptor performanceInterceptor(){
//		PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
//		performanceInterceptor.setMaxTime(1000);
//		performanceInterceptor.setFormat(true);
//		performanceInterceptor.setWriteInLog(false);
//		return performanceInterceptor;
//	}

	/*
	 * @describe (打印sql语句)
	 * @author xn-h
	 * @create 2017/10/4
	 * @param []
	 * @return com.yirong.framework.common.dbtool.SQLInterceptor
	**/
//	@Bean
//	public SQLInterceptor sQLInterceptor(){
//		SQLInterceptor sQLInterceptor = new SQLInterceptor();
//		sQLInterceptor.setShowSql(true);
//		return sQLInterceptor;
//	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		MybatisSqlSessionFactoryBean factory = new MybatisSqlSessionFactoryBean();
		factory.setDataSource(dataSource);
		factory.setVfs(SpringBootVFS.class);
		//打印sql语句
		SQLInterceptor sQLInterceptor = new SQLInterceptor();
		sQLInterceptor.setShowSql(true);


		// 具体参考自己设置，参考 xml 参数说明或源码注释
		factory.setPlugins(new Interceptor[]{
				sQLInterceptor,
				new PaginationInterceptor()//分页插件
		});
		return factory.getObject();
	}
}

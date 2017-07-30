package com.yirong.framework.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/**
 * @author xn-h
 * @describe(Hikari数据库连接池配置类)
 * @create 2017/7/22
 **/
@Configuration
public class HikariDataSourceConfig {

	@Value("${oracle.datasource.driverClassName}")
	private String driverClassName;

	@Value("${oracle.datasource.url}")
	private String jdbcurl;

	@Value("${oracle.datasource.username}")
	private String username;

	@Value("${oracle.datasource.password}")
	private String password;

	/**
	 * @describe (Hikari 配置信息)
	 * @author xn-h
	 * @create 2017/7/22
	 * @param []
	 * @return javax.sql.DataSource
	**/
	@Bean(destroyMethod = "close")
	@Primary
	public DataSource dataSource(){
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(jdbcurl);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);

		hikariConfig.setMaximumPoolSize(5);
		hikariConfig.setConnectionTestQuery("SELECT 1 from dual");
		hikariConfig.setPoolName("springHikariCP");

		hikariConfig.addDataSourceProperty("dataSource.cachePrepStmts", "true");
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSize", "250");
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "2048");
		hikariConfig.addDataSourceProperty("dataSource.useServerPrepStmts", "true");

		HikariDataSource dataSource = new HikariDataSource(hikariConfig);

		return dataSource;
	}
}

package com.generator;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xn-h
 * @describe(mybatis-plus代码生成器)
 * @create 2017/9/19
 * 参考 http://baomidou.oschina.io/mybatis-plus-doc/#/generate-code
 **/
public class MyGenerator {

	public static void main(String arg[]) {
		AutoGenerator mpg = new AutoGenerator();

		// 全局配置
		GlobalConfig gc = new GlobalConfig();
		gc.setOutputDir("H:\\code\\generator1");//这里写你自己的java目录
		gc.setFileOverride(true);//是否覆盖
		gc.setActiveRecord(true);
		gc.setEnableCache(false);// XML 二级缓存
		gc.setBaseResultMap(true);// XML ResultMap
		gc.setBaseColumnList(true);// XML columList
		gc.setAuthor("xn-h");
		mpg.setGlobalConfig(gc);

		// 数据源配置
		DataSourceConfig dsc = new DataSourceConfig();
		dsc.setDbType(DbType.ORACLE);
		dsc.setTypeConvert(new MySqlTypeConvert() {
			// 自定义数据库表字段类型转换【可选】
			@Override
			public DbColumnType processTypeConvert(String fieldType) {
				if(fieldType.contains("NUMBER")){
					return DbColumnType.LONG;
				}
				return super.processTypeConvert(fieldType);
			}
		});
		dsc.setDriverName("oracle.jdbc.driver.OracleDriver");
		dsc.setUsername("huang");
		dsc.setPassword("huang");
		dsc.setUrl("jdbc:oracle:thin:@//localhost:1521/orcl");
		mpg.setDataSource(dsc);

		// 策略配置
		StrategyConfig strategy = new StrategyConfig();
		strategy.setTablePrefix(new String[]{"tb_","tsys_"});// 此处可以修改为您的表前缀
		strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
		strategy.setLogicDeleteFieldName("NDELETE");
		mpg.setStrategy(strategy);

		// 包配置
		PackageConfig pc = new PackageConfig();
		pc.setParent(null);
		pc.setEntity("com.yirong.framework.entity");
		pc.setMapper("com.yirong.framework.mapper");
		pc.setXml("com.yirong.framework.mapper.xml");
		pc.setService("com.yirong.framework.service");
		pc.setServiceImpl("com.yirong.framework.service.impl");
		pc.setController("com.yirong.framework.controller");
		mpg.setPackageInfo(pc);

		// 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
		InjectionConfig cfg = new InjectionConfig() {
			@Override
			public void initMap() {
				Map<String, Object> map = new HashMap<>();
				map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
				this.setMap(map);
			}
		};
		mpg.setCfg(cfg);

		// 执行生成
		mpg.execute();

		// 打印注入设置
		System.err.println(mpg.getCfg().getMap().get("abc"));
	}
}

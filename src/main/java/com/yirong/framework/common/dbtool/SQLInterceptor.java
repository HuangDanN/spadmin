package com.yirong.framework.common.dbtool;

import com.yirong.framework.common.ReflectHelper;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.util.Properties;

/**
 * @author xn-h
 * @describe(运行时输出sql)
 * @create 2017/10/3
 **/
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
public class SQLInterceptor  implements Interceptor {

	private static final Logger logger = LoggerFactory.getLogger(SQLInterceptor.class);


	private boolean isShowSql = true;

	public boolean isShowSql() {
		return isShowSql;
	}

	public void setShowSql(boolean showSql) {
		isShowSql = showSql;
	}

	public Object intercept(Invocation invocation) throws Throwable {

		if(!isShowSql)
			return  invocation.proceed();
		RoutingStatementHandler statementHandler = (RoutingStatementHandler) invocation
				.getTarget();
		BoundSql boundSql = statementHandler.getBoundSql();
		BaseStatementHandler delegate = (BaseStatementHandler) ReflectHelper
				.getValueByFieldName(statementHandler, "delegate");
		MappedStatement mappedStatement = (MappedStatement) ReflectHelper
				.getValueByFieldName(delegate, "mappedStatement");
		logger.info("-------------------------------------------------"+ mappedStatement.getId());
		long startDate = System.currentTimeMillis();
		System.out.println(boundSql.getSql());
		Object o = invocation.proceed();
		long endDate = System.currentTimeMillis();
		long between=(endDate - startDate);//可以除以1000转换成秒
		logger.info("-------------------------------------------------执行时间：" + between +" 毫秒");
		return o;
	}

	@Override
	public Object plugin(Object arg0) {
		return Plugin.wrap(arg0, this);
	}

	@Override
	public void setProperties(Properties properties) {

	}
}

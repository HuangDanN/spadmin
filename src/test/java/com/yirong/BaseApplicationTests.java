package com.yirong;

import com.yirong.framework.common.system.SystemParaUtil;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
//@Transactional //打开的话测试之后数据可自动回滚
public class BaseApplicationTests {

	@Autowired
	private SystemParaUtil systemParaUtil;

	@Test
	public void SystemParaUtilTest(){
		String adminPath = systemParaUtil.getAdminPath();
		System.out.println(adminPath);
		Assert.assertNotNull(adminPath);
	}
}

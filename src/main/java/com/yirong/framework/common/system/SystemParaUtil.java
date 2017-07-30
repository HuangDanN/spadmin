package com.yirong.framework.common.system;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 
* @ClassName: SystemPara  
* @Description: TODO(获取系统参数工具类)  
* @author hxn
* @date 2017年7月28日 上午10:07:36  
*
 */
@Component
@ConfigurationProperties(value = "system")
public class SystemParaUtil {

	private String webPath;
	
	private String adminPath;
	
	private String commonPath;
	
	private String jsPath;
	
	private String cssPath;
	
	private String imagePath;
	
	private String uploadPath;
	
	public  String getWebPath() {
		return webPath;
	}

	public String getAdminPath() {
		return adminPath;
	}

	public String getCommonPath() {
		return commonPath;
	}

	public String getJsPath() {
		return jsPath;
	}

	public String getCssPath() {
		return cssPath;
	}

	public String getImagePath() {
		return imagePath;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public void setAdminPath(String adminPath) {
		this.adminPath = adminPath;
	}

	public void setCommonPath(String commonPath) {
		this.commonPath = commonPath;
	}

	public void setJsPath(String jsPath) {
		this.jsPath = jsPath;
	}

	public void setCssPath(String cssPath) {
		this.cssPath = cssPath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
}

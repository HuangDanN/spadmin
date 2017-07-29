package com.yirong.framework.config.security.entity;

import java.io.Serializable;

/**
 * 
* @ClassName: AuthMetaDTO  
* @Description: TODO(权限角色 资源类)  
* @author hxn
* @date 2017年7月27日 下午2:07:04  
*
 */
public class AuthMetaData implements Serializable{

	private static final long serialVersionUID = -3497389148297115979L;
	/**
	 * 权限ID
	 */
	private Long authId;
	/**
	 * 权限编码
	 */
	private String authCode;
	/**
	 * 角色编码
	 */
	private String roleCode;
	/**
	 * 资源url
	 */
	private String url;
	public Long getAuthId() {
		return authId;
	}
	public void setAuthId(Long authId) {
		this.authId = authId;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "AuthMetaDTO [authId=" + authId + ", authCode=" + authCode
				+ ", roleCode=" + roleCode + ", url=" + url + "]";
	}
	
}

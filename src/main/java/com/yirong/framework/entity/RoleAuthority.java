package com.yirong.framework.entity;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author xn-h
 * @describe(用户角色与权限关系类)
 * @create 2017/7/22
 **/
public class RoleAuthority implements Serializable {
	private static final long serialVersionUID = -4792580880506952084L;

	//主键ID
	private java.lang.Long id;
	//角色ID
	@NotNull
	private java.lang.Long roleId;
	//权限ID
	@NotNull
	private java.lang.Long authId;
	//是否系统默认
	@NotNull
	private java.lang.Integer isSys;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getAuthId() {
		return authId;
	}

	public void setAuthId(Long authId) {
		this.authId = authId;
	}

	public Integer getIsSys() {
		return isSys;
	}

	public void setIsSys(Integer isSys) {
		this.isSys = isSys;
	}

	@Override
	public String toString() {
		return "RoleAuthority{" +
				"id=" + id +
				", roleId=" + roleId +
				", authId=" + authId +
				", isSys=" + isSys +
				'}';
	}
}

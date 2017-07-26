package com.yirong.framework.entity;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author xn-h
 * @describe(用户与角色关系类)
 * @create 2017/7/22
 **/
public class UserRole implements Serializable {
	private static final long serialVersionUID = 6592251999128455643L;

	//主键ID
	private java.lang.Long id;
	//用户ID
	@NotNull
	private java.lang.Long userId;
	//角色ID
	@NotNull
	private java.lang.Long roleId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "UserRole{" +
				"id=" + id +
				", userId=" + userId +
				", roleId=" + roleId +
				'}';
	}
}

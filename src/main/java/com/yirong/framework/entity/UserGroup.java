package com.yirong.framework.entity;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author xn-h
 * @describe(用户与所属组关系类)
 * @create 2017/7/22
 **/
public class UserGroup implements Serializable {
	private static final long serialVersionUID = 4531079347974523633L;

	//主键ID
	private java.lang.Long id;
	//所属组ID
	@NotNull
	private java.lang.Long groupId;
	//用户ID
	@NotNull
	private java.lang.Long userId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "UserGroup{" +
				"id=" + id +
				", groupId=" + groupId +
				", userId=" + userId +
				'}';
	}
}

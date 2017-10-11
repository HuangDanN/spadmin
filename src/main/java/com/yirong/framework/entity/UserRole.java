package com.yirong.framework.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户角色关系表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_USER_ROLE")
public class UserRole extends Model<UserRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户角色关系ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 角色ID
     */
	@TableField("ROLE_ID")
	private Long roleId;
    /**
     * 用户ID
     */
	@TableField("USER_ID")
	private Long userId;


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

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "UserRole{" +
			", id=" + id +
			", roleId=" + roleId +
			", userId=" + userId +
			"}";
	}
}

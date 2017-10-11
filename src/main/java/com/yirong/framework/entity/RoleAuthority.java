package com.yirong.framework.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 角色权限关系表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_ROLE_AUTHORITY")
public class RoleAuthority extends Model<RoleAuthority> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色权限关系ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 角色ID
     */
	@TableField("ROLE_ID")
	private Long roleId;
    /**
     * 权限ID
     */
	@TableField("AUTH_ID")
	private Long authId;
    /**
     * 若为系统内置不允许删除
     */
	@TableField("IS_SYS")
	private Long isSys;


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

	public Long getIsSys() {
		return isSys;
	}

	public void setIsSys(Long isSys) {
		this.isSys = isSys;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "RoleAuthority{" +
			", id=" + id +
			", roleId=" + roleId +
			", authId=" + authId +
			", isSys=" + isSys +
			"}";
	}
}

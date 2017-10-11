package com.yirong.framework.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户与组织机构关系表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_USER_GROUP")
public class UserGroup extends Model<UserGroup> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户与组织机构关系ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 组织机构ID
     */
	@TableField("GROUP_ID")
	private Long groupId;
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
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "UserGroup{" +
			", id=" + id +
			", groupId=" + groupId +
			", userId=" + userId +
			"}";
	}
}

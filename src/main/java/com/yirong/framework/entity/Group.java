package com.yirong.framework.entity;

import java.io.Serializable;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 组织机构表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_GROUP")
public class Group extends Model<Group> {

    private static final long serialVersionUID = 1L;

    /**
     * 组织机构ID
     */
    @TableId("GROUP_ID")
	private Long groupId;
    /**
     * 父类ID,当为顶级时PARENT_ID为0
     */
	@TableField("PARENT_ID")
	private Long parentId;
    /**
     * 组织机构名称
     */
	@TableField("GROUP_NAME")
	private String groupName;
    /**
     * 组织机构编码
     */
	@TableField("GROUP_CODE")
	private String groupCode;
    /**
     * 组织机构描述
     */
	@TableField("GROUP_DESC")
	private String groupDesc;
    /**
     * 是否删除
     */
	@TableField("IS_DEL")
	private Long isDel;
    /**
     * 是否启用
     */
	@TableField("IS_ENABLE")
	private Long isEnable;
    /**
     * 创建时间
     */
	@TableField("CREATE_DATE")
	private Date createDate;
    /**
     * 更新时间
     */
	@TableField("UPDATE_DATE")
	private Date updateDate;


	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupDesc() {
		return groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	public Long getIsDel() {
		return isDel;
	}

	public void setIsDel(Long isDel) {
		this.isDel = isDel;
	}

	public Long getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Long isEnable) {
		this.isEnable = isEnable;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	protected Serializable pkVal() {
		return this.groupId;
	}

	@Override
	public String toString() {
		return "Group{" +
			", groupId=" + groupId +
			", parentId=" + parentId +
			", groupName=" + groupName +
			", groupCode=" + groupCode +
			", groupDesc=" + groupDesc +
			", isDel=" + isDel +
			", isEnable=" + isEnable +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			"}";
	}
}

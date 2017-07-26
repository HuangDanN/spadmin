package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;
import java.util.Date;

/**
 * @author xn-h
 * @describe(用户所属组类)
 * @create 2017/7/22
 **/
public class Group implements Serializable {
	private static final long serialVersionUID = -6634190285103048705L;

	//主键ID
	private java.lang.Long groupId;

	@NotEmpty
	@Length(max=500)
	//组名称
	private java.lang.String groupName;

	@Length(max=500)
	//组编码
	private java.lang.String groupCode;

	@Length(max=2000)
	//组描述
	private java.lang.String groupDesc;

	//是否启用
	private java.lang.Integer isEnable;

	//是否删除
	private java.lang.Integer isDel;

	//创建时间
	private java.util.Date createDate;

	//更新时间
	private java.util.Date updateDate;

	//父ID
	private java.lang.Long parentId;

	//父组名称
	private java.lang.String parentGroupName;

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
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

	public Integer getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
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

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentGroupName() {
		return parentGroupName;
	}

	public void setParentGroupName(String parentGroupName) {
		this.parentGroupName = parentGroupName;
	}

	@Override
	public String toString() {
		return "Group{" +
				"groupId=" + groupId +
				", groupName='" + groupName + '\'' +
				", groupCode='" + groupCode + '\'' +
				", groupDesc='" + groupDesc + '\'' +
				", isEnable=" + isEnable +
				", isDel=" + isDel +
				", createDate=" + createDate +
				", updateDate=" + updateDate +
				", parentId=" + parentId +
				", parentGroupName='" + parentGroupName + '\'' +
				'}';
	}
}

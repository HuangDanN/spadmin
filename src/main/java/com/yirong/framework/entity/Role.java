package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * @author xn-h
 * @describe(用户角色类)
 * @create 2017/7/22
 **/
public class Role implements Serializable {

	private static final long serialVersionUID = 3383228538877055193L;
	//角色ID
	private java.lang.Long roleId;
	@NotEmpty(message = "角色名称不能为空")
	//角色名称
	private java.lang.String roleName;
	//角色编码
	@NotEmpty(message = "角色编码不能为空")
	@Pattern(regexp = "^(ROLE_)[A-Za-z_]+", message = "角色编码必须以[ ROLE_ ]开头")
	@Length(max = 200)
	private java.lang.String roleCode;
	//创建人
	private java.lang.Long createrId;
	//是否系统默认
	private java.lang.Integer isSys;
	//是否启用
	private java.lang.Integer enable;
	//备注
	@Length(max = 2000)
	private java.lang.String note;
	//创建时间
	private java.util.Date createDate;
	//更新时间
	private java.util.Date updateDate;
	//权限ID
	private java.lang.Long authId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public Long getCreaterId() {
		return createrId;
	}

	public void setCreaterId(Long createrId) {
		this.createrId = createrId;
	}

	public Integer getIsSys() {
		return isSys;
	}

	public void setIsSys(Integer isSys) {
		this.isSys = isSys;
	}

	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public Long getAuthId() {
		return authId;
	}

	public void setAuthId(Long authId) {
		this.authId = authId;
	}

	@Override
	public String toString() {
		return "Role{" +
				"roleId=" + roleId +
				", roleName='" + roleName + '\'' +
				", roleCode='" + roleCode + '\'' +
				", createrId=" + createrId +
				", isSys=" + isSys +
				", enable=" + enable +
				", note='" + note + '\'' +
				", createDate=" + createDate +
				", updateDate=" + updateDate +
				", authId=" + authId +
				'}';
	}
}

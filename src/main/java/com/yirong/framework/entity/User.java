package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;
import java.util.Date;

/**
 * @author xn-h
 * @describe(系统用户类)
 * @create 2017/7/21
 **/
public class User implements Serializable {

	private static final long serialVersionUID = -656450112405823500L;
	/** 主键 */
	private java.lang.Long userId;

	/** 1:系统预置 2:非系统预置 */
	private java.lang.Integer userType;

	@NotEmpty(message = "登入名不能为空")
	@Length(max = 200)
	/** 用户名 */
	private java.lang.String loginname;

	@NotEmpty(message = "密码不能为空")
	@Length(max = 255)
	/** 用户密码 */
	private java.lang.String password;

	@Length(max = 255)
	/** 真实姓名 */
	private java.lang.String realname;

	@Length(max = 100)
	/** 手机号码 */
	private java.lang.String mobile;

	/** 1:男 2:女 */
	private java.lang.Integer sex;

	@Length(max = 100)
	/** 地址 */
	private java.lang.String address;

	/** 是否启用 */
	private java.lang.Integer isEnable;

	/** 是否过期 */
	private java.lang.Integer isExpire;

	/** 是否密码过期 */
	private java.lang.Integer isPasswordExpire;

	/** 是否锁定 */
	private java.lang.Integer isLock;

	/** 创建时间 */
	private java.util.Date createDate;

	/** 更新时间 */
	private java.util.Date updateDate;

	@Length(max = 2000)
	/** 备注 */
	private java.lang.String note;

	private Role role;

	private Group group;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}

	public Integer getIsExpire() {
		return isExpire;
	}

	public void setIsExpire(Integer isExpire) {
		this.isExpire = isExpire;
	}

	public Integer getIsPasswordExpire() {
		return isPasswordExpire;
	}

	public void setIsPasswordExpire(Integer isPasswordExpire) {
		this.isPasswordExpire = isPasswordExpire;
	}

	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "User{" +
				"userId=" + userId +
				", userType=" + userType +
				", loginname='" + loginname + '\'' +
				", password='" + password + '\'' +
				", realname='" + realname + '\'' +
				", mobile='" + mobile + '\'' +
				", sex=" + sex +
				", address='" + address + '\'' +
				", isEnable=" + isEnable +
				", isExpire=" + isExpire +
				", isPasswordExpire=" + isPasswordExpire +
				", isLock=" + isLock +
				", createDate=" + createDate +
				", updateDate=" + updateDate +
				", note='" + note + '\'' +
				", role=" + role +
				", group=" + group +
				'}';
	}
}

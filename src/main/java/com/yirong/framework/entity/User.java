package com.yirong.framework.entity;

import java.io.Serializable;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableLogic;
import java.io.Serializable;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_USER")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户主键
     */
    @TableId("USER_ID")
	private Long userId;
    /**
     * 用户类型  1:系统预置 2:非系统预置
     */
	@TableField("USER_TYPE")
	private Long userType;
    /**
     * 用户名
     */
	@TableField("LOGINNAME")
	private String loginname;
    /**
     * 用户密码
     */
	@TableField("PASSWORD")
	private String password;
    /**
     * 真实姓名
     */
	@TableField("REALNAME")
	private String realname;
    /**
     * 手机号码
     */
	@TableField("MOBILE")
	private String mobile;
    /**
     * 性别 1:男  2:女
     */
	@TableField("SEX")
	private Long sex;
    /**
     * 地址
     */
	@TableField("ADDRESS")
	private String address;
    /**
     * 是否启用
     */
	@TableField("IS_ENABLE")
	private Long isEnable;
    /**
     * 是否过期
     */
	@TableField("IS_EXPIRE")
	private Long isExpire;
    /**
     * 是否密码过期
     */
	@TableField("IS_PASSWORD_EXPIRE")
	private Long isPasswordExpire;
    /**
     * 是否锁定
     */
	@TableField("IS_LOCK")
	private Long isLock;
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
    /**
     * 备注
     */
	@TableField("NOTE")
	private String note;
    /**
     * 删除标志
     */
	@TableField("NDELETE")
    @TableLogic
	private Long ndelete;


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserType() {
		return userType;
	}

	public void setUserType(Long userType) {
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

	public Long getSex() {
		return sex;
	}

	public void setSex(Long sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Long isEnable) {
		this.isEnable = isEnable;
	}

	public Long getIsExpire() {
		return isExpire;
	}

	public void setIsExpire(Long isExpire) {
		this.isExpire = isExpire;
	}

	public Long getIsPasswordExpire() {
		return isPasswordExpire;
	}

	public void setIsPasswordExpire(Long isPasswordExpire) {
		this.isPasswordExpire = isPasswordExpire;
	}

	public Long getIsLock() {
		return isLock;
	}

	public void setIsLock(Long isLock) {
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

	public Long getNdelete() {
		return ndelete;
	}

	public void setNdelete(Long ndelete) {
		this.ndelete = ndelete;
	}

	@Override
	protected Serializable pkVal() {
		return this.userId;
	}

	@Override
	public String toString() {
		return "User{" +
			", userId=" + userId +
			", userType=" + userType +
			", loginname=" + loginname +
			", password=" + password +
			", realname=" + realname +
			", mobile=" + mobile +
			", sex=" + sex +
			", address=" + address +
			", isEnable=" + isEnable +
			", isExpire=" + isExpire +
			", isPasswordExpire=" + isPasswordExpire +
			", isLock=" + isLock +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			", note=" + note +
			", ndelete=" + ndelete +
			"}";
	}
}

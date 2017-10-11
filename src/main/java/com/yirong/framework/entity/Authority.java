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
 * 权限表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_AUTHORITY")
public class Authority extends Model<Authority> {

    private static final long serialVersionUID = 1L;

    /**
     * 权限ID
     */
    @TableId("AUTH_ID")
	private Long authId;
    /**
     * 菜单ID
     */
	@TableField("MENU_ID")
	private Long menuId;
    /**
     * 权限类型  1:菜单  2:自定义URL
     */
	@TableField("AUTH_TYPE")
	private Long authType;
    /**
     * 权限名称
     */
	@TableField("AUTH_NAME")
	private String authName;
    /**
     * 权限编码
     */
	@TableField("AUTH_CODE")
	private String authCode;
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
    /**
     * 备注
     */
	@TableField("NOTE")
	private String note;


	public Long getAuthId() {
		return authId;
	}

	public void setAuthId(Long authId) {
		this.authId = authId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getAuthType() {
		return authType;
	}

	public void setAuthType(Long authType) {
		this.authType = authType;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	protected Serializable pkVal() {
		return this.authId;
	}

	@Override
	public String toString() {
		return "Authority{" +
			", authId=" + authId +
			", menuId=" + menuId +
			", authType=" + authType +
			", authName=" + authName +
			", authCode=" + authCode +
			", isEnable=" + isEnable +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			", note=" + note +
			"}";
	}
}

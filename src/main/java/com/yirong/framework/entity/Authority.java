package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author xn-h
 * @describe(权限类)
 * @create 2017/7/22
 **/
public class Authority implements Serializable {
	private static final long serialVersionUID = -5262361312752809818L;
	//权限ID
	private java.lang.Long authId;
	//菜单ID
	private java.lang.Long menuId;

	@NotNull(message = "权限类型不能为空")
	private java.lang.Integer authType;
	@NotEmpty(message = "权限名称不能为空")
	@Length(max = 200)
	private java.lang.String authName;
	@NotEmpty(message = "权限编码不能为空")
	@Length(max = 200)
	private java.lang.String authCode;
	//是否启用
	private java.lang.Integer isEnable;
	//创建时间
	private java.util.Date createDate;
	//更新时间
	private java.util.Date updateDate;
	@Length(max = 5000)
	private java.lang.String note;
	//菜单
	private Menu menu;
	//资源
	private List<Resources> resources;

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

	public Integer getAuthType() {
		return authType;
	}

	public void setAuthType(Integer authType) {
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

	public Integer getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Integer isEnable) {
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

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<Resources> getResources() {
		return resources;
	}

	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}

	@Override
	public String toString() {
		return "Authority{" +
				"authId=" + authId +
				", menuId=" + menuId +
				", authType=" + authType +
				", authName='" + authName + '\'' +
				", authCode='" + authCode + '\'' +
				", isEnable=" + isEnable +
				", createDate=" + createDate +
				", updateDate=" + updateDate +
				", note='" + note + '\'' +
				", menu=" + menu +
				", resources=" + resources +
				'}';
	}
}

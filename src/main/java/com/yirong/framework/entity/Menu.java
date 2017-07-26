package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author xn-h
 * @describe(菜单类)
 * @create 2017/7/22
 **/
public class Menu implements Serializable {
	private static final long serialVersionUID = 8549518070399098165L;

	//菜单ID
	private java.lang.Long menuId;
	@NotEmpty(message="菜单名称不能为空")
	@Length(max = 100)
	private java.lang.String menuName;
	@NotEmpty(message="当前菜单不存在父类菜单")
	private java.lang.Long parentId;
	@Length(max = 100)
	private java.lang.String parentName;
	@NotNull(message="当前菜单级别不存在")
	private java.lang.Integer menuLevel;
	//菜单URL
	@Length(max = 255)
	private java.lang.String menuUrl;
	//菜单类型
	private java.lang.Integer menuType;
	//开启菜单icon
	@Length(max = 255)
	private java.lang.String openIcon;
	//关闭菜单icon
	@Length(max = 255)
	private java.lang.String closeIcon;
	//创建时间
	private java.util.Date createDate;
	//更新时间
	private java.util.Date updateDate;
	//是否启用 默认启用
	private java.lang.Integer idEnable=1;
	//备注
	@Length(max = 500)
	private java.lang.String note;
	//打开类型
	@Length(max = 255)
	private java.lang.String openType;
	@NotNull(message="菜单排序不能为空")
	private java.lang.Long orderNo;
	//tab菜单ID
	private java.lang.Long tabMenuId;
	//子菜单
	private List<Menu> subMenus;

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public Integer getMenuType() {
		return menuType;
	}

	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	public String getOpenIcon() {
		return openIcon;
	}

	public void setOpenIcon(String openIcon) {
		this.openIcon = openIcon;
	}

	public String getCloseIcon() {
		return closeIcon;
	}

	public void setCloseIcon(String closeIcon) {
		this.closeIcon = closeIcon;
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

	public Integer getIdEnable() {
		return idEnable;
	}

	public void setIdEnable(Integer idEnable) {
		this.idEnable = idEnable;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getOpenType() {
		return openType;
	}

	public void setOpenType(String openType) {
		this.openType = openType;
	}

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Long getTabMenuId() {
		return tabMenuId;
	}

	public void setTabMenuId(Long tabMenuId) {
		this.tabMenuId = tabMenuId;
	}

	public List<Menu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}

	@Override
	public String toString() {
		return "Menu{" +
				"menuId=" + menuId +
				", menuName='" + menuName + '\'' +
				", parentId=" + parentId +
				", parentName='" + parentName + '\'' +
				", menuLevel=" + menuLevel +
				", menuUrl='" + menuUrl + '\'' +
				", menuType=" + menuType +
				", openIcon='" + openIcon + '\'' +
				", closeIcon='" + closeIcon + '\'' +
				", createDate=" + createDate +
				", updateDate=" + updateDate +
				", idEnable=" + idEnable +
				", note='" + note + '\'' +
				", openType='" + openType + '\'' +
				", orderNo=" + orderNo +
				", tabMenuId=" + tabMenuId +
				", subMenus=" + subMenus +
				'}';
	}
}

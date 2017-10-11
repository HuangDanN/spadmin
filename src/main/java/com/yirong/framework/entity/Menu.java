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
 * 后台菜单管理
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_MENU")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单ID
     */
    @TableId("MENU_ID")
	private Long menuId;
    /**
     * 菜单名称
     */
	@TableField("MENU_NAME")
	private String menuName;
    /**
     * 默认顶级 菜单父类ID：0
     */
	@TableField("PARENT_ID")
	private Long parentId;
    /**
     * 父类菜单名称
     */
	@TableField("PARENT_NAME")
	private String parentName;
    /**
     * 菜单级别
     */
	@TableField("MENU_LEVEL")
	private Long menuLevel;
    /**
     * 菜单地址
     */
	@TableField("MENU_URL")
	private String menuUrl;
    /**
     * 菜单类型  1:TAB  2:文件夹  3:URL
     */
	@TableField("MENU_TYPE")
	private Long menuType;
    /**
     * 打开图标
     */
	@TableField("OPEN_ICON")
	private String openIcon;
    /**
     * 关闭图标
     */
	@TableField("CLOSE_ICON")
	private String closeIcon;
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
     * 是否启用
     */
	@TableField("ENABLE")
	private Long enable;
    /**
     * 备注
     */
	@TableField("NOTE")
	private String note;
    /**
     * 打开方式  1:内部窗口打开  2:外部新窗口打开
     */
	@TableField("OPEN_TYPE")
	private Long openType;
    /**
     * 排序
     */
	@TableField("ORDER_NO")
	private Long orderNo;
    /**
     * 标签菜单ID
     */
	@TableField("TAB_MENU_ID")
	private Long tabMenuId;


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

	public Long getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Long menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public Long getMenuType() {
		return menuType;
	}

	public void setMenuType(Long menuType) {
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

	public Long getEnable() {
		return enable;
	}

	public void setEnable(Long enable) {
		this.enable = enable;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Long getOpenType() {
		return openType;
	}

	public void setOpenType(Long openType) {
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

	@Override
	protected Serializable pkVal() {
		return this.menuId;
	}

	@Override
	public String toString() {
		return "Menu{" +
			", menuId=" + menuId +
			", menuName=" + menuName +
			", parentId=" + parentId +
			", parentName=" + parentName +
			", menuLevel=" + menuLevel +
			", menuUrl=" + menuUrl +
			", menuType=" + menuType +
			", openIcon=" + openIcon +
			", closeIcon=" + closeIcon +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			", enable=" + enable +
			", note=" + note +
			", openType=" + openType +
			", orderNo=" + orderNo +
			", tabMenuId=" + tabMenuId +
			"}";
	}
}

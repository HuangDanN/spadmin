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
 * 
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_USER_FAVOUR_MENU")
public class UserFavourMenu extends Model<UserFavourMenu> {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏菜单ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 菜单ID, 只能为URL类型菜单
     */
	@TableField("MENU_ID")
	private Long menuId;
    /**
     * 用户ID
     */
	@TableField("USER_ID")
	private Long userId;
    /**
     * 排列顺序
     */
	@TableField("ORDER_NO")
	private Long orderNo;
    /**
     * 创建时间
     */
	@TableField("GEN_TIME")
	private Date genTime;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Date getGenTime() {
		return genTime;
	}

	public void setGenTime(Date genTime) {
		this.genTime = genTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "UserFavourMenu{" +
			", id=" + id +
			", menuId=" + menuId +
			", userId=" + userId +
			", orderNo=" + orderNo +
			", genTime=" + genTime +
			"}";
	}
}

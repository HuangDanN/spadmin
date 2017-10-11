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
 * 用户角色表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_ROLE")
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    @TableId("ROLE_ID")
	private Long roleId;
    /**
     * 角色名称
     */
	@TableField("ROLE_NAME")
	private String roleName;
    /**
     * 角色编码
     */
	@TableField("ROLE_CODE")
	private String roleCode;
    /**
     * 创建者ID
     */
	@TableField("CREATER_ID")
	private Long createrId;
    /**
     * 是否系统内置
     */
	@TableField("IS_SYS")
	private Long isSys;
    /**
     * 是否有效
     */
	@TableField("ENABLE")
	private Long enable;
    /**
     * 备注
     */
	@TableField("NOTE")
	private String note;
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

	public Long getIsSys() {
		return isSys;
	}

	public void setIsSys(Long isSys) {
		this.isSys = isSys;
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
		return this.roleId;
	}

	@Override
	public String toString() {
		return "Role{" +
			", roleId=" + roleId +
			", roleName=" + roleName +
			", roleCode=" + roleCode +
			", createrId=" + createrId +
			", isSys=" + isSys +
			", enable=" + enable +
			", note=" + note +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			"}";
	}
}

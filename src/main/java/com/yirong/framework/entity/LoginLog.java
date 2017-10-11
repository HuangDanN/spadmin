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
 * 用户登录记录表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TB_LOGIN_LOG")
public class LoginLog extends Model<LoginLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId("NID")
	private Long nid;
    /**
     * 用户账号
     */
	@TableField("SUID")
	private String suid;
    /**
     * 登录IP
     */
	@TableField("SLOGINIP")
	private String sloginip;
    /**
     * 登录时间
     */
	@TableField("DSTART")
	private Date dstart;
    /**
     * 退出时间
     */
	@TableField("DEND")
	private Date dend;
    /**
     * 所属系统
     */
	@TableField("SSYS")
	private String ssys;


	public Long getNid() {
		return nid;
	}

	public void setNid(Long nid) {
		this.nid = nid;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
	}

	public String getSloginip() {
		return sloginip;
	}

	public void setSloginip(String sloginip) {
		this.sloginip = sloginip;
	}

	public Date getDstart() {
		return dstart;
	}

	public void setDstart(Date dstart) {
		this.dstart = dstart;
	}

	public Date getDend() {
		return dend;
	}

	public void setDend(Date dend) {
		this.dend = dend;
	}

	public String getSsys() {
		return ssys;
	}

	public void setSsys(String ssys) {
		this.ssys = ssys;
	}

	@Override
	protected Serializable pkVal() {
		return this.nid;
	}

	@Override
	public String toString() {
		return "LoginLog{" +
			", nid=" + nid +
			", suid=" + suid +
			", sloginip=" + sloginip +
			", dstart=" + dstart +
			", dend=" + dend +
			", ssys=" + ssys +
			"}";
	}
}

package com.yirong.framework.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 权限资源表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_RESOURCES")
public class Resources extends Model<Resources> {

    private static final long serialVersionUID = 1L;

    /**
     * 资源ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 权限ID
     */
	@TableField("AUTH_ID")
	private Long authId;
    /**
     * 资源URL
     */
	@TableField("URL")
	private String url;
    /**
     * 备注
     */
	@TableField("NOTE")
	private String note;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAuthId() {
		return authId;
	}

	public void setAuthId(Long authId) {
		this.authId = authId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Resources{" +
			", id=" + id +
			", authId=" + authId +
			", url=" + url +
			", note=" + note +
			"}";
	}
}

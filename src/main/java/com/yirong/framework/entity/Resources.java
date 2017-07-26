package com.yirong.framework.entity;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author xn-h
 * @describe(资源类)
 * @create 2017/7/22
 **/
public class Resources implements Serializable {
	private static final long serialVersionUID = 1513253034447218111L;

	//主键ID
	private java.lang.Long id;
	//权限ID
	@NotNull
	private java.lang.Long authId;
	//资源URL
	@Length(max=255)
	private java.lang.String url;
	//备注
	@Length(max=5000)
	private java.lang.String note;

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
	public String toString() {
		return "Resources{" +
				"id=" + id +
				", authId=" + authId +
				", url='" + url + '\'' +
				", note='" + note + '\'' +
				'}';
	}
}

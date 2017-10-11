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
 * 操作日志
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_OPER_LOGS")
public class OperLogs extends Model<OperLogs> {

    private static final long serialVersionUID = 1L;

    /**
     * 操作日志ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 操作用户
     */
	@TableField("USER_NAME")
	private String userName;
    /**
     * 操作时间
     */
	@TableField("OPEA_TIME")
	private Date opeaTime;
    /**
     * JAVA类
     */
	@TableField("CLAZZ")
	private String clazz;
    /**
     * JAVA方法
     */
	@TableField("METHOD")
	private String method;
    /**
     * IP地址
     */
	@TableField("IP")
	private String ip;
    /**
     * 操作内容
     */
	@TableField("CONTENT")
	private String content;
    /**
     * 模块编码
     */
	@TableField("MODEL_CODE")
	private String modelCode;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getOpeaTime() {
		return opeaTime;
	}

	public void setOpeaTime(Date opeaTime) {
		this.opeaTime = opeaTime;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getModelCode() {
		return modelCode;
	}

	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "OperLogs{" +
			", id=" + id +
			", userName=" + userName +
			", opeaTime=" + opeaTime +
			", clazz=" + clazz +
			", method=" + method +
			", ip=" + ip +
			", content=" + content +
			", modelCode=" + modelCode +
			"}";
	}
}

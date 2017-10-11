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
 * 字典表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_DICT")
public class Dict extends Model<Dict> {

    private static final long serialVersionUID = 1L;

    @TableId("DICT_ID")
	private Long dictId;
    /**
     * 字典名称
     */
	@TableField("DICT_NAME")
	private String dictName;
    /**
     * 字典编码
     */
	@TableField("DICT_CODE")
	private String dictCode;
    /**
     * 字典类型  1:系统字典，2:业务字典
     */
	@TableField("DICT_TYPE")
	private Long dictType;
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


	public Long getDictId() {
		return dictId;
	}

	public void setDictId(Long dictId) {
		this.dictId = dictId;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getDictCode() {
		return dictCode;
	}

	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}

	public Long getDictType() {
		return dictType;
	}

	public void setDictType(Long dictType) {
		this.dictType = dictType;
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
		return this.dictId;
	}

	@Override
	public String toString() {
		return "Dict{" +
			", dictId=" + dictId +
			", dictName=" + dictName +
			", dictCode=" + dictCode +
			", dictType=" + dictType +
			", isEnable=" + isEnable +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			", note=" + note +
			"}";
	}
}

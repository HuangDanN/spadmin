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
 * 字典元素表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_DICT_ITEM")
public class DictItem extends Model<DictItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 元素ID
     */
    @TableId("ITEM_ID")
	private Long itemId;
    /**
     * 字典ID
     */
	@TableField("DICT_ID")
	private Long dictId;
    /**
     * 元素名称
     */
	@TableField("ITEM_NAME")
	private String itemName;
    /**
     * 元素编码
     */
	@TableField("ITEM_CODE")
	private String itemCode;
    /**
     * 元素值
     */
	@TableField("ITEM_VALUE")
	private String itemValue;
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


	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getDictId() {
		return dictId;
	}

	public void setDictId(Long dictId) {
		this.dictId = dictId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemValue() {
		return itemValue;
	}

	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
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
		return this.itemId;
	}

	@Override
	public String toString() {
		return "DictItem{" +
			", itemId=" + itemId +
			", dictId=" + dictId +
			", itemName=" + itemName +
			", itemCode=" + itemCode +
			", itemValue=" + itemValue +
			", isEnable=" + isEnable +
			", createDate=" + createDate +
			", updateDate=" + updateDate +
			", note=" + note +
			"}";
	}
}

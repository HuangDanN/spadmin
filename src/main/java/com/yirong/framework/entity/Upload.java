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
 * 上传文件/图片表
 * </p>
 *
 * @author xn-h
 * @since 2017-10-03
 */
@TableName("TSYS_UPLOAD")
public class Upload extends Model<Upload> {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId("ID")
	private Long id;
    /**
     * 文件名称
     */
	@TableField("FILE_NAME")
	private String fileName;
    /**
     * 文件后缀
     */
	@TableField("FILE_SUFFIX")
	private String fileSuffix;
    /**
     * 文件真实名称
     */
	@TableField("FILE_REAL_NAME")
	private String fileRealName;
    /**
     * 文件类型
     */
	@TableField("FILE_TYPE")
	private String fileType;
    /**
     * 文件大小
     */
	@TableField("FILE_SIZE")
	private Long fileSize;
    /**
     * 文件相对路径
     */
	@TableField("FILE_PATH")
	private String filePath;
    /**
     * 文件绝对路径
     */
	@TableField("AFFIX_PATH")
	private String affixPath;
    /**
     * 创建人
     */
	@TableField("CREATOR")
	private String creator;
    /**
     * 创建时间
     */
	@TableField("CREATE_DATE")
	private Date createDate;
    /**
     * 图片宽度
     */
	@TableField("WIDTH")
	private Long width;
    /**
     * 保存方式 DISK|FTP
     */
	@TableField("SAVE_WAY")
	private String saveWay;
    /**
     * 图片高度
     */
	@TableField("HEIGHT")
	private Long height;
    /**
     * 开发人员扩张字段
     */
	@TableField("EXT_COLUMN")
	private String extColumn;
    /**
     * tag控件上传的标志，用于区分接口的实现类是否处理业务
     */
	@TableField("MARK")
	private String mark;
    /**
     * 文件基于地址的全路径
     */
	@TableField("FULL_URL")
	private String fullUrl;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSuffix() {
		return fileSuffix;
	}

	public void setFileSuffix(String fileSuffix) {
		this.fileSuffix = fileSuffix;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getAffixPath() {
		return affixPath;
	}

	public void setAffixPath(String affixPath) {
		this.affixPath = affixPath;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Long getWidth() {
		return width;
	}

	public void setWidth(Long width) {
		this.width = width;
	}

	public String getSaveWay() {
		return saveWay;
	}

	public void setSaveWay(String saveWay) {
		this.saveWay = saveWay;
	}

	public Long getHeight() {
		return height;
	}

	public void setHeight(Long height) {
		this.height = height;
	}

	public String getExtColumn() {
		return extColumn;
	}

	public void setExtColumn(String extColumn) {
		this.extColumn = extColumn;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getFullUrl() {
		return fullUrl;
	}

	public void setFullUrl(String fullUrl) {
		this.fullUrl = fullUrl;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Upload{" +
			", id=" + id +
			", fileName=" + fileName +
			", fileSuffix=" + fileSuffix +
			", fileRealName=" + fileRealName +
			", fileType=" + fileType +
			", fileSize=" + fileSize +
			", filePath=" + filePath +
			", affixPath=" + affixPath +
			", creator=" + creator +
			", createDate=" + createDate +
			", width=" + width +
			", saveWay=" + saveWay +
			", height=" + height +
			", extColumn=" + extColumn +
			", mark=" + mark +
			", fullUrl=" + fullUrl +
			"}";
	}
}

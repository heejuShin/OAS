package com.walab.oas.DTO;

import java.sql.Date;

public class Field {
	private int id;
	private int form_id;
	private String fieldType;
	private String fieldName;
	private String fileName;
	private int isEssential;
	private int index;
	private Date regDate;
	private String key;
	private int isDelete;
	

	@Override
	public String toString() {
		return "Field [id=" + id + ", form_id=" + form_id + ", fieldType=" + fieldType + ", fieldName=" + fieldName
				+ ", fileName=" + fileName + ", isEssential=" + isEssential + ", index=" + index + ", regDate="
				+ regDate + ", key=" + key + ", isDelete=" + isDelete + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getForm_id() {
		return form_id;
	}

	public void setForm_id(int form_id) {
		this.form_id = form_id;
	}

	

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getIsEssential() {
		return isEssential;
	}

	public void setIsEssential(int isEssential) {
		this.isEssential = isEssential;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	
}
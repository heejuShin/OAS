package com.walab.oas.DTO;


public class ReadResult {
	
	private int id;
	private int form_id;
	private int user_id;
	private String fieldType;
	private String fieldName;
	private String fileName;
	private String fileRealName;
	private int isEssential;
	private int index;
	private String regDate;
	private String editDate;
	private String key;
	private int field_id;
	private int file_id;
	private String content;
	@Override
	public String toString() {
		return "ReadResult [id=" + id + ", form_id=" + form_id + ", user_id=" + user_id + ", fieldType=" + fieldType
				+ ", fieldName=" + fieldName + ", file_id=" + file_id+ ", fileName=" + fileName + ", fileRealName=" + fileRealName + ", isEssential=" + isEssential + ", index="
				+ index + ", regDate=" + regDate + ", editDate=" + editDate + ", key=" + key + ", field_id=" + field_id
				+ ", content=" + content + "]";
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getFile_id() {
		return id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
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
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getField_id() {
		return field_id;
	}
	public void setField_id(int field_id) {
		this.field_id = field_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}

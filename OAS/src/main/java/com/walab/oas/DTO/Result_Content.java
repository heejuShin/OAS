package com.walab.oas.DTO;

import java.sql.Date;

public class Result_Content {
	private int id;
	private int result_id;
	private int field_id;
	private String content;
	private Date regDate;
	private Date editDate;
	private int file_id;
	@Override
	public String toString() {
		return "Result_Content [id=" + id + ", result_id=" + result_id + ", field_id=" + field_id + ", content="
				+ content + ", regDate=" + regDate + ", editDate=" + editDate + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getEditDate() {
		return editDate;
	}
	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}
	
}
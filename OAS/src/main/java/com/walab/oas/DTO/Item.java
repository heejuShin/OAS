package com.walab.oas.DTO;

import java.sql.Date;

public class Item {
	private int id;
	private int field_id;
	private String content;
	private int isDefault;
	private Date regDate;
	@Override
	public String toString() {
		return "Item [id=" + id + ", field_id=" + field_id + ", content=" + content + ", isDefault=" + isDefault
				+ ", regDate=" + regDate + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}

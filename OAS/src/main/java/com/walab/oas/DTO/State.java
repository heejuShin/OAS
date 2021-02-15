package com.walab.oas.DTO;

import java.sql.Date;


public class State {
	private int id;
	private int form_id;
	private String stateName;
	private int isDefault;
	private Date regDate;
	
	

	@Override
	public String toString() {
		return "State [id=" + id + ", form_id=" + form_id + ", stateName=" + stateName + ", isDefault=" + isDefault
				+ ", regDate=" + regDate + "]";
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

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefualt(int isDefault) {
		this.isDefault = isDefault;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
package com.walab.oas.DTO;

import java.sql.Date;


public class State {
	private int id;
	private int form_id;
	private String stateName;
	private Date regDate;
	
	@Override
	public String toString() {
		return "State [id=" + id + ", form_id=" + form_id + ", stateName=" + stateName + ", regDate=" + regDate + "]";
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
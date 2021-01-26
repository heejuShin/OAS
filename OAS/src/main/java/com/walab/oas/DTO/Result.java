package com.walab.oas.DTO;

import java.sql.Date;

public class Result {	
	private int id;
	private int form_id;
	private int user_id;
	private int state_id;
	private Date regDate;
	private Date editDate;
	private int isDelete;
	
	@Override
	public String toString() {
		return "Result [id=" + id + ", form_id=" + form_id + ", user_id=" + user_id + ", state_id=" + state_id
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", isDelete=" + isDelete + "]";
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

	public int getState_id() {
		return state_id;
	}

	public void setState_id(int state_id) {
		this.state_id = state_id;
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

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
}
package com.walab.oas.DTO;

import java.sql.Date;

public class Form {
	private int id;
	private int category_id;
	private int user_id;
	private String formName;
	private String explanation;
	private String url;
	private int isAvailable;
	private int isUserEdit;
	private int plusPoint;
	private int minusPoint;
	private Date startDate;
	private Date endDate;
	private Date regDate;
	private Date editDate;
	
	@Override
	public String toString() {
		return "Form [id=" + id + ", category_id=" + category_id + ", user_id=" + user_id + ", formName=" + formName
				+ ", explanation=" + explanation + ", url=" + url + ", isAvailable=" + isAvailable + ", isUserEdit="
				+ isUserEdit + ", plusPoint=" + plusPoint + ", minusPoint=" + minusPoint + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", regDate=" + regDate + ", editDate=" + editDate + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}

	public int getIsUserEdit() {
		return isUserEdit;
	}

	public void setIsUserEdit(int isUserEdit) {
		this.isUserEdit = isUserEdit;
	}

	public int getPlusPoint() {
		return plusPoint;
	}

	public void setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
	}

	public int getMinusPoint() {
		return minusPoint;
	}

	public void setMinusPoint(int minusPoint) {
		this.minusPoint = minusPoint;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

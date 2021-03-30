package com.walab.oas.DTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

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
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp regDate;
	private Timestamp editDate;
	
	private String userName;
	private String categoryName;
	private String stateName;
	private int state_id;
	
	private String start;
	private String end;
	

	@Override
	public String toString() {
		return "Form [id=" + id + ", category_id=" + category_id + ", user_id=" + user_id + ", formName=" + formName
				+ ", explanation=" + explanation + ", url=" + url + ", isAvailable=" + isAvailable + ", isUserEdit="
				+ isUserEdit + ", plusPoint=" + plusPoint + ", minusPoint=" + minusPoint + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", regDate=" + regDate + ", editDate=" + editDate + ", userName=" + userName
				+ ", categoryName=" + categoryName + ", stateName=" + stateName + ", state_id=" + state_id + ", start="
				+ start + ", end=" + end + "]";
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
		//explanation = explanation.replaceAll("<br>", "\n");
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

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	

	public int getState_id() {
		return state_id;
	}

	public void setState_id(int state_id) {
		this.state_id = state_id;
	}

	public Timestamp getEditDate() {
		return editDate;
	}

	public void setEditDate(Timestamp editDate) {
		this.editDate = editDate;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}	
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getStartDateKor() {
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREAN);
				String regDate1 = fm.format(startDate);		
		return regDate1;
	}
	public String getEndDateKor() {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREAN);
		String regDate1 = fm.format(endDate);		
		return regDate1;
	}
	
}

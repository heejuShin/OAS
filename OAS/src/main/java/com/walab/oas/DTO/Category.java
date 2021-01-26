package com.walab.oas.DTO;

import java.sql.Date;

public class Category {
	private int id;
	private String categoryName;
	private Date regDate;
	
	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", regDate=" + regDate + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	

}
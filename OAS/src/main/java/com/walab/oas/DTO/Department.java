package com.walab.oas.DTO;

import java.sql.Date;
import java.sql.Timestamp;


public class Department {
	private int id;
	private String name;
	private Timestamp regDate;
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", regDate=" + regDate + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}
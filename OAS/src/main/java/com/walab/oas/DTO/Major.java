package com.walab.oas.DTO;

import java.sql.Date;
import java.sql.Timestamp;


public class Major {
	private int id;
	private String name;
	private int department_id;
	private String department_name;
	private Timestamp regDate;
	@Override
	public String toString() {
		return "Major [id=" + id + ", name=" + name + ", department_id=" + department_id + ", department_name="
				+ department_name + ", regDate=" + regDate + "]";
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
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}
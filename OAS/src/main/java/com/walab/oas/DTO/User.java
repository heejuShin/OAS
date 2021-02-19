package com.walab.oas.DTO;

import java.sql.Date;

public class User {
	private int id;
	private String userName;
	private int admin;
	private String email;
	private String studentId;
	private String phoneNum;
	private String department;
	private String major;
	private String grade;
	private String semester;
	private int point;
	private int isDelete;
	private Date regDate;
	private Date deleteDate;
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", admin=" + admin + ", email=" + email + ", studentId="
				+ studentId + ", phoneNum=" + phoneNum + ", department=" + department + ", major=" + major + ", grade="
				+ grade + ", semester=" + semester + ", point=" + point + ", isDelete=" + isDelete + ", regDate="
				+ regDate + ", deleteDate=" + deleteDate + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}
	
	
}
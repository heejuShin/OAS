package com.walab.oas.DTO;

import java.text.SimpleDateFormat;
import java.util.Date;//제출&수정 날짜와 시간 모두 보여주기 위해서 변경
import java.util.Locale;

public class Result {	
	private int id;
	private int form_id;
	private int user_id;
	private int state_id;
	private Date regDate;
	private Date editDate;
	private int isDelete;
	
	private String userName;
	private String department;
	private String studentId;
	private String email;
	

	@Override
	public String toString() {
		return "Result [id=" + id + ", form_id=" + form_id + ", user_id=" + user_id + ", state_id=" + state_id
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", isDelete=" + isDelete + ", userName="
				+ userName + ", department=" + department + ", studentId=" + studentId + ", email=" + email + "]";
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
	
	//제출 시간 개별보기에서 보여주기 위해 추가
	public String getRegDateKor() {
		//Fri Jan 29 10:06:29 KST 2021
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREAN);
				//String strReg = fm.format(regDate);
				//SimpleDateFormat formatTime = new SimpleDateFormat(strReg,Locale.KOREAN);
				String regDate1 = fm.format(regDate);
				System.out.println("*************************");
				System.out.println(regDate1);
		
		return regDate1;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getEditDate() {
		return editDate;
	}
	
	//수정 시간 개별보기에서 보여주기 위해 추가
	public String getEditDateKor() {
		//Fri Jan 29 10:06:29 KST 2021
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREAN);
				String editDate1 = fm.format(editDate);
				System.out.println("*************************");
				System.out.println(editDate1);
		
		return editDate1;
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

	
	//새로 추가한 부분
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}

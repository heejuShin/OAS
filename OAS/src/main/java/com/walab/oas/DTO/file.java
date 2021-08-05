package com.walab.oas.DTO;

import java.sql.Timestamp;

public class file {
	private int id;
	private String fileName;
	private String fileRealName;
	private Timestamp regDate;
	
	@Override
	public String toString() {
		return "file [id=" + id + ", fileName=" + fileName + ", fileRealName=" + fileRealName + ", regDate=" + regDate
				+ "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	

}

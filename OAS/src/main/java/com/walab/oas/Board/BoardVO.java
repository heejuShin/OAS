package com.walab.oas.Board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	public int seq;
	private String category;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int cnt;
	private String photo;
	

	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", category=" + category + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", regdate=" + regdate + ", cnt=" + cnt + ", photo=" + photo + "]";
	}
	public int getBno() {
		// TODO Auto-generated method stub
		return seq;
	}


}
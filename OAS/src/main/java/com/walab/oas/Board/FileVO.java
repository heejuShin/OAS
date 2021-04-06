package com.walab.oas.Board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
  
  private int f_no; //파일번호
  private int b_no; //게시판 번호와 동기화
  private String filename;  //저장할 때
  private String fileoriginname;  //받아올 때 파일 이름
  private String fileurl;   //저장 및 불러올 경로
public int getF_no() {
	return f_no;
}
public void setF_no(int f_no) {
	this.f_no = f_no;
}
public int getB_no() {
	return b_no;
}
public void setB_no(int b_no) {
	this.b_no = b_no;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public String getFileoriginname() {
	return fileoriginname;
}
public void setFileoriginname(String fileoriginname) {
	this.fileoriginname = fileoriginname;
}
public String getFileurl() {
	return fileurl;
}
public void setFileurl(String fileurl) {
	this.fileurl = fileurl;
}

}
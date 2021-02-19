package com.walab.oas.Board.domain;

import org.springframework.beans.factory.annotation.Autowired;

import com.walab.oas.Board.BoardVO;

public class FileVO {
	private int fno;
    private int bno;
    private String fileName;     //저장할 파일
    private String fileOriName;  //실제 파일
    private String fileUrl;
    
    @Autowired
    BoardVO vo = new BoardVO();
 
    
    public int getFno() {
        return fno;
    }
 
    public void setFno(int fno) {
        this.fno = fno;
    }
 
    public int getBno() {
        return vo.getSeq();
    }
 
    public void setBno(int bno) {
        this.bno = bno; //next: bno
    }
 
    public String getFileName() {
        return fileName;
    }
 
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
 
    public String getFileOriName() {
        return fileOriName;
    }
 
    public void setFileOriName(String fileOriName) {
        this.fileOriName = fileOriName;
    }
 
    public String getFileUrl() {
        return fileUrl;
    }
 
    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
}

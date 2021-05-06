package com.walab.oas.DTO;

import lombok.Data;

@Data
public class AttachFileDTO {
	private int f_id;
	private String fileName;  //파일 이름
	private String fileRealName;  //원본파일 이름
	private int rc_id;
	private int result_id;
	private int field_id;
	private String content;

}
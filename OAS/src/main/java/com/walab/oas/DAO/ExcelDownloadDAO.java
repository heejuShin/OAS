package com.walab.oas.DAO;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ExcelDownloadDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	public SXSSFWorkbook makeWorkbook(HttpServletResponse response, ArrayList<String> fq, ArrayList<String> fa, ArrayList<String> q, ArrayList<ArrayList<String>> a ) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		SXSSFSheet sheet = workbook.createSheet("설문지 제목");
		
        sheet.setColumnWidth(0, 19*256);
        sheet.setColumnWidth(1, 19*256);
        sheet.setColumnWidth(2, 10*256);
        sheet.setColumnWidth(3, 10*256);
        sheet.setColumnWidth(4, 22*256);
        sheet.setColumnWidth(5, 15*256);
        sheet.setColumnWidth(6, 15*256);
        for(int i=0; i<q.size(); i++) {
        	sheet.setColumnWidth(9+i, 25*256);
        }
		
		//FQ
		Row fqr = sheet.createRow(0);
		for(int i=0; i<fq.size(); i++){
			Cell fqc = fqr.createCell(i);
			fqc.setCellValue(fq.get(i));
		}
		//FA
		Row far = sheet.createRow(1);
		for(int i=0; i<fa.size(); i++){
			Cell fac = far.createCell(i);
			fac.setCellValue(fa.get(i));
		}
		
		//Q
		Row qr = sheet.createRow(3);
		for(int i=0; i<q.size(); i++){
			Cell qc = qr.createCell(i);
			qc.setCellValue(q.get(i));
		}
		//A
		Row ar = null;
	    for(int i=0; i<a.size(); i++) {
	    	ar = sheet.createRow(4+i);
	    	for(int j=0; j<a.get(i).size(); j++) {
	    		Cell ac = ar.createCell(j);
				ac.setCellValue(a.get(i).get(j));
	    	}
	    }
        
        response.setContentType("ms-vnd/excel");
        SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
        Date time = new Date();
        String nametime = format.format(time);
        
        try {
			response.setHeader("Content-Disposition", "attachment;filename="+new String(fa.get(1).getBytes("utf-8"),"8859_1")+"_"+nametime.substring(2)+".xls");
		} catch (UnsupportedEncodingException e1) {
			response.setHeader("Content-Disposition", "attachment;filename=formResult.xls");
		}
        try {
			workbook.write(response.getOutputStream());
	        workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return workbook;
	}

}

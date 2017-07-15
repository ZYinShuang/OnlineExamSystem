package com.jereh.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;


/**
 * 
 * @author yaobin
 * @return List<String[]> ����Excle�ϴ������� list����  string��������
 * 
 * 
 */

@Service
public class UploadExcleUtil {
	
	// ��¼��������Ϣ-
			Log log = LogFactory.getLog(UploadExcleUtil.class);
			// ��ȡExcel�ĵ���·��-
			// .xlsx�ļ���XSSFWorkbook .xlx �õ�HSSFWorkbook
			//public static String filepath = "D://demoExcel.xlsx";

			public  List<String[]> start(String filepath) {
				// ������excel������������
				XSSFWorkbook wookbook;
				List rowList = new ArrayList();
				try {
					wookbook = new XSSFWorkbook(new FileInputStream(filepath));
					// ��Execl�ĵ��У���һ�Ź������ȱʡ������0
					 XSSFSheet sheet=wookbook.getSheetAt(0);
					//XSSFSheet sheet = wookbook.getSheet("Sheet1");
					// ��ȡ��Execl�ļ��е���������-
					int rows = sheet.getPhysicalNumberOfRows();
					
					
					// ������
					for (int i = 1; i < rows; i++) {
						// ��ȡ���϶˵�Ԫ��
						XSSFRow row = sheet.getRow(i);
						// �в��ܿ�
						if (row != null) {
							// ��ȡ�����е���-
							int cells = row.getPhysicalNumberOfCells();
							String value = "";
							// ������-
							for (int j = 0; j < cells; j++) {
								// ��ȡ�е�ֵ
								XSSFCell cell = row.getCell(j);
								if (cell != null) {
									switch (cell.getCellType()) {
									// ��������ǣ���ʽ
									// Excel����ġ���ʽ����������cell.getNumericCellValue();
									// ����á��������Ҳ���ǡ���ʽ������֮��Ľ��
									case HSSFCell.CELL_TYPE_FORMULA:
										break;
									// ��������ǣ�����
									case HSSFCell.CELL_TYPE_NUMERIC:
										value += cell.getNumericCellValue() + "####";
										break;
									case HSSFCell.CELL_TYPE_STRING:
										value += cell.getStringCellValue() + "####";
										break;
									default:
										value += 0;
									}
								}
							}
							String[] val = new String[cells];
							val = value.split("####");
							rowList.add(val);
						}
					}
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    return rowList;
			}
}

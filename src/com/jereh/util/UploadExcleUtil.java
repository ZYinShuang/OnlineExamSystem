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
 * @return List<String[]> 返回Excle上传的内容 list是行  string数组是列
 * 
 * 
 */

@Service
public class UploadExcleUtil {
	
	// 记录类的输出信息-
			Log log = LogFactory.getLog(UploadExcleUtil.class);
			// 获取Excel文档的路径-
			// .xlsx文件用XSSFWorkbook .xlx 用的HSSFWorkbook
			//public static String filepath = "D://demoExcel.xlsx";

			public  List<String[]> start(String filepath) {
				// 创建对excel工作簿的引用
				XSSFWorkbook wookbook;
				List rowList = new ArrayList();
				try {
					wookbook = new XSSFWorkbook(new FileInputStream(filepath));
					// 在Execl文档中，第一张工作表的缺省索引是0
					 XSSFSheet sheet=wookbook.getSheetAt(0);
					//XSSFSheet sheet = wookbook.getSheet("Sheet1");
					// 获取到Execl文件中的所有行数-
					int rows = sheet.getPhysicalNumberOfRows();
					
					
					// 遍历行
					for (int i = 1; i < rows; i++) {
						// 读取左上端单元格
						XSSFRow row = sheet.getRow(i);
						// 行不能空
						if (row != null) {
							// 获取到所有的列-
							int cells = row.getPhysicalNumberOfCells();
							String value = "";
							// 遍历列-
							for (int j = 0; j < cells; j++) {
								// 获取列的值
								XSSFCell cell = row.getCell(j);
								if (cell != null) {
									switch (cell.getCellType()) {
									// 这个类型是：公式
									// Excel里面的“公式”，可以用cell.getNumericCellValue();
									// 来获得“结果”，也就是“公式”计算之后的结果
									case HSSFCell.CELL_TYPE_FORMULA:
										break;
									// 这个类型是：数字
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

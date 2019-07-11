package com.zut.wl.utils.excel;

import com.zut.wl.bean.ResultExcelEntity;
import com.zut.wl.pojo.Student;
import lombok.Data;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/7/11 19:59
 */
@Data
public class CreateExcel {

    //各个专业分流的信息
    private List<ResultExcelEntity> resultExcelEntityList;

    public CreateExcel() {
    }

    public CreateExcel(List<ResultExcelEntity> resultExcelEntityList) {
        this.resultExcelEntityList = resultExcelEntityList;
    }

    /**
     * 生成一个excel表
     */
    public HSSFWorkbook createResultExcrel(){
        ResultExcelEntity resultExcelEntity = resultExcelEntityList.get(0);
        //创建一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        for (int i = 0; i < resultExcelEntityList.size(); i++) {
            Sheet sheet = createSheet(resultExcelEntityList.get(i).getMajorName() + "分流结果",workbook,resultExcelEntityList.get(i));
        }
        return workbook;
    }

    /**
     * 生成页sheet
     * @return
     */
    public Sheet createSheet(String sheetName,HSSFWorkbook workbook,ResultExcelEntity resultExcelEntity){
        //创建一个sheet页
        Sheet sheet = workbook.createSheet(sheetName);
        sheet.setDefaultColumnWidth(20);
        //创建第一行
        Row row = sheet.createRow(0);
        // 设置表头样式
        HSSFCellStyle headStyle = createHeadStyle(workbook.createCellStyle(),workbook.createFont());
        //设置单元格样式
        HSSFCellStyle contentStyle = createContentStyle(workbook.createCellStyle(),workbook.createFont());
        //创建第一个列
        Cell cell1 = row.createCell(0);
        cell1.setCellValue("学号");
        cell1.setCellStyle(headStyle);
        Cell cell2 = row.createCell(1);
        cell2.setCellValue("姓名");
        cell2.setCellStyle(headStyle);
        Cell cell3 = row.createCell(2);
        cell3.setCellValue("班级");
        cell3.setCellStyle(headStyle);
        //创建单元格
        List<Student> studentList = resultExcelEntity.getStudentList();
        for (int i = 0; i < studentList.size(); i++) {
            row = sheet.createRow(i+1);
            cell1 = row.createCell(0);
            cell1.setCellValue(studentList.get(i).getStuId());
            cell1.setCellStyle(contentStyle);
            cell2 = row.createCell(1);
            cell2.setCellValue(studentList.get(i).getStuName());
            cell2.setCellStyle(contentStyle);
            cell2 = row.createCell(2);
            cell2.setCellValue(studentList.get(i).getClazz());
            cell2.setCellStyle(contentStyle);
        }
        return sheet;
    }

    /**
     * 设置表头样式
     * @return
     */
    public HSSFCellStyle createHeadStyle(HSSFCellStyle headStyle,HSSFFont headFont){
        //设置字体样式
        headFont.setFontHeightInPoints((short) 11);// 字号
        headFont.setBold(true);// 加粗
        headStyle.setFont(headFont);
        headStyle.setAlignment(HorizontalAlignment.CENTER); // 创建一个居中格式
        return headStyle;
    }
    /**
     * 设置表头样式
     * @return
     */
    public HSSFCellStyle createContentStyle(HSSFCellStyle contentStyle ,HSSFFont contentFont){
        //设置字体样式
        contentFont.setFontHeightInPoints((short) 11);// 字号
        contentStyle.setFont(contentFont);
        contentStyle.setAlignment(HorizontalAlignment.CENTER); // 创建一个居中格式
        return contentStyle;
    }

}

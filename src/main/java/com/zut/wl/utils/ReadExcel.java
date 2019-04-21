package com.zut.wl.utils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/4/16 17:29
 */
public class ReadExcel {
    private String relativePath;      //文件的相对路径
    private String fileName;          //文件全名
    private String fileSuffix;        //文件后缀名
    private String absoluteFilePath;  //文件的绝对路径
    private Workbook workbook;        //excel的工作薄
    private Sheet sheet;              //工作簿中的第一个表格
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * 通过文件流读取excel表，需要传入一个文件名
     * @param inputStream
     * @param fileName
     */
    public ReadExcel(InputStream inputStream, String fileName) {
        this.fileName = fileName;
        String[] fileSuffixTemp = fileName.split("\\.");
        this.fileSuffix = fileSuffixTemp[1];
        this.workbook = getWorkbook(inputStream);
        this.sheet = workbook.getSheetAt(0);
    }

    /**
     * 根据绝对路径创建对象
     * @param absoluteFilePath  绝对路径
     */
    public ReadExcel(String absoluteFilePath) {
        this.absoluteFilePath = absoluteFilePath;
        //分离全路径中的“\\”获取文件名
        String fileNameTemp = absoluteFilePath.substring(absoluteFilePath.lastIndexOf("\\"));
        this.fileName = fileNameTemp.replace("\\", "");
        String[] fileSuffixTemp = fileName.split("\\.");
        this.fileSuffix = fileSuffixTemp[1];
        this.workbook = getWorkbook();
        this.sheet = workbook.getSheetAt(0);
    }
    /**
     * 获取绝对路径中的文件名（以“\\”右斜杠作为分隔符的绝对路径）
     * @param absolutePath 绝对路径
     * @return  文件名
     */
    public static String getFileNameInWondows(String absolutePath) {
        String string = absolutePath.substring(absolutePath.lastIndexOf("\\"));
        string = string.replace("\\", "");
        return string;
    }
    /**
     * 获取绝对路径中的文件名（以“/”左斜杠作为分隔符的绝对路径）
     * @param absolutePath 绝对路径
     * @return  文件名
     */
    public static String getFileNameInLinux(String absolutePath) {
        String string = absolutePath.substring(absolutePath.lastIndexOf("/"));
        string = string.replace("/", "");
        return string;
    }
    /**
     * 获取文件名的后缀
     * @param fileName 文件名
     * @return   返回文件的前后缀
     */
    public static String getPrefixAndSuffix(String fileName) {
        String[] file = fileName.split("\\.");
        return file[1];
    }

    /**
     * 获取表中有多少列
     * @return
     */
    public int columnNumber(){
        return sheet.getRow(0).getPhysicalNumberOfCells();
    }
    /**
     * 获取表中有多少行
     * @return
     */
    public int rowNumber(){
        return sheet.getLastRowNum();
    }

    /**
     * 获取工作簿的对象workbook
     * @return
     */
    private Workbook getWorkbook(){
        FileInputStream inputStream = null;
        Workbook workbook = null;
        try {
            inputStream = new FileInputStream(absoluteFilePath);
            switch (fileSuffix) {
                case "xlsx":
                    workbook = new XSSFWorkbook(inputStream);
                    break;
                case "xls":
                    workbook = new HSSFWorkbook(inputStream);
                    break;
            }
            inputStream.close();

        } catch (FileNotFoundException e) {
            System.out.println("文件找不到");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {

        }
        return workbook;
    }

    /**
     * 根据文件流获取工作簿
     * @param inputStream
     * @return
     */
    private Workbook getWorkbook(InputStream inputStream){
        Workbook workbook = null;
        try {
            switch (this.fileSuffix) {
                case "xlsx":
                    workbook = new XSSFWorkbook(inputStream);
                    break;
                case "xls":
                    workbook = new HSSFWorkbook(inputStream);
                    break;
            }
            inputStream.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        return workbook;
    }

    /**
     * 读取Excel表头的数据
     * @return
     */
    public String[] readExcelTitle(){
        String[] excelTitle = null;
        Sheet sheet = workbook.getSheetAt(0);
        Row row = sheet.getRow(0);
        int rowNumber = row.getLastCellNum();
        excelTitle = new String[rowNumber];
        for (int i = 0; i < rowNumber; i++) {
            Cell cell = row.getCell(i);
            switch (cell.getCellType()) {
                case STRING:
                    excelTitle[i] = cell.getStringCellValue();
                    break;
                case NUMERIC:
                    break;
                case BLANK:
                    excelTitle[i] = "";
                    break;
                case _NONE:
                    excelTitle[i] = "未知类型";
                    break;
                case BOOLEAN:
                    break;
                case FORMULA:
                    excelTitle[i] = cell.getCellFormula();
                    break;
                case ERROR:
                    excelTitle[i] = cell.getColumnIndex()+"单元格错误";
                    break;
            }
        }
        return excelTitle;
    }

    /**
     * double类型小数位过多，四舍五入进一位
     * @param number
     * @return
     */
    private Double getPreciseValue(Double number){
        Double preciseNumber = number;
        String stringTemp = number+"";
        String temp[] = stringTemp.split("\\.");
        int count = temp[1].length();
        if (count>=5){
            number = number * Math.pow(10,count-1);
            number = (double)Math.round(number);
            preciseNumber = number/100000;
        }
        return preciseNumber;
    }

    /**
     * 判断单元格数据类型并返回该数据
     * @param cell
     * @return
     */
    private Object getCellValue(Cell cell){
        Object object = null;
        switch (cell.getCellType()) {
            case STRING:
                String stringValue = cell.getStringCellValue();
                object = stringValue;
                break;
            case NUMERIC:
                Double doubleValue = cell.getNumericCellValue();
                object =  getPreciseValue(doubleValue);
                break;
            case BLANK:
                break;
            case _NONE:
                object =  "未知类型";
                break;
            case BOOLEAN:
                object =  cell.getBooleanCellValue();
                break;
            case FORMULA:
                object =  cell.getCellFormula();
                break;
            case ERROR:
                object =  cell.getColumnIndex()+"单元格错误";
                break;
        }
        return object;
    }


    /**
     * 读取表格（除表格头之外）内容
     * 返回值为Map<Integer,Object[]>类型
     * 键表示第几行，值表示这一行的数据，值的下标表示第几列
     * @return
     */
    public Map<Integer,Object[]> readExcelContent(){
        int columnNumber = columnNumber();
        int rowNumber = rowNumber();
        Cell cell = null;
        Row row = null;
        Object[] rowString = null;
        Map<Integer,Object[]> map = new HashMap<>();
        for (int i = 1; i < rowNumber; i++) {
            row = this.sheet.getRow(i);
            rowString = new Object[rowNumber];
            for (int i1 = 0; i1 < columnNumber; i1++) {
                cell = row.getCell(i1);
                rowString[i1] = getCellValue(cell);
            }
            map.put(i,rowString);
        }
        return map;
    }

}

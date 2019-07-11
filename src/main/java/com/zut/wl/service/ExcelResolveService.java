package com.zut.wl.service;

import com.zut.wl.utils.excel.ExcelResolve;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:43
 */
public interface ExcelResolveService {
    void insertData(ExcelResolve excelResolve);

    /**
     * 获取生成的excel表
     * @return
     */
    HSSFWorkbook createResultExcel();
}

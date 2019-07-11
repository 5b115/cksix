package com.zut.wl.controller;

import com.zut.wl.service.ExcelResolveService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @Author xiumu
 * @Date 2019/4/19 17:04
 */
@Controller
public class FileUploadController {

    @Autowired
    private ExcelResolveService excelResolveService;

    @GetMapping("/upload")
    public String updateData(){
        return "success";
    }

    @GetMapping("/downloadExcel")
    public void downloadExcel(HttpServletResponse response) throws UnsupportedEncodingException {
        response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode("专业分流结果","UTF-8")+".xls");
        response.setContentType("application/msexcel");
        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        HSSFWorkbook resultExcel = excelResolveService.createResultExcel();
        try {
            resultExcel.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                outputStream.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }








    /*
    @PostMapping("/upload")
    public String uploadGradeFile(MultipartFile file, Map map){
        String originalFilename = file.getOriginalFilename();
        String fileName = originalFilename.substring(originalFilename.lastIndexOf("\\")+1);;
        String filePath = Admin.filePath+fileName;
        File fileTemp = new File(filePath);
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),fileTemp);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ReadExcel readExcel = null;
        try {
            readExcel = new ReadExcel(file.getInputStream(),fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ExcelResolve excelResolve = new ExcelResolve(readExcel.readExcelTitle(),readExcel.readExcelContent());
//        excelResolveService.insertData(excelResolve);
        return "success";
    }  */
}

package com.zut.wl.controller;

import com.zut.wl.service.ExcelResolveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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

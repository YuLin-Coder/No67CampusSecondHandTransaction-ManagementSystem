package com.daowen.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.util.SingleFileUpload;


@Controller
public class UploadController {

    @RequestMapping("/admin/uploadmanager.do")
	public String execute(HttpServletRequest request,HttpServletResponse response){
		
    	SingleFileUpload upload = new SingleFileUpload();  
        try {  
            upload.parseRequest(request);  
        } catch (UnsupportedEncodingException e1) {  
              
            e1.printStackTrace();  
        } 
        String temp =request.getSession().getServletContext().getRealPath("/") + "upload\\temp\\"; //临时目录    
        System.out.print("上传路径："+temp);
        String loadpath = request.getSession().getServletContext().getRealPath("/") + "upload\\"; //上传文件存放目录    
        File file = new File(temp);    
        if(!file.exists())
        	file.mkdirs();
        try {  
            upload.upload(file); 
            response.getWriter().write(upload.getFileItem().getName());
        }  
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){              
            // 文件大小超出最大值   
            e.printStackTrace();  
        }catch (Exception e){  
            e.printStackTrace();  
        }  
        return null;  
		
	}
	
	
}

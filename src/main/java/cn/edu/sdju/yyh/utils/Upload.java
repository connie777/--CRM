package cn.edu.sdju.yyh.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @ClassName Upload
 * @Description 图片上传工具类
 * @Author Silence
 * @Date 2019/3/6 17:31
 * @Version 1.0
 **/
public class Upload {
    //返回数据库中图片地址
    public static String upload(MultipartFile imageFile,String path){
        //数据库存储的路径
        String dbPath = null;
        if(!imageFile.isEmpty()){
            /*//定义图片保存的本地路径
            String localPath="D:\\upload\\";*/
            //定义文件名
            String filename=null;
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=imageFile.getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=uuid+"."+suffixName;
            //封装上传的文件（全路径 = 本地路径 + 文件名）
            File file = new File(path + "/"+filename);
            //进行上传操作
            try {
                imageFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            /*dbPath="upload/"+filename;*/
            dbPath=filename;
        }
        return dbPath;
    }
}

package com.jk.controller;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.UUID;

@RequestMapping("/good")
@Controller
public class GoodController {

    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping("togoodshow")
    public String toIndex(){
        return "jsp/goodshow";
    }

    @RequestMapping("toAddGood")
    public String toAddGood(){
        return "jsp/addGood";
    }

    @RequestMapping("toUpdateGood")
    public String toUpdateGood(){
        return "jsp/updateGood";
    }

    /*
    * 商品上传图片
    * */
    @RequestMapping("ImgUplod")
    @ResponseBody
    public HashMap<String, Object> ImgUplod(@RequestParam(value = "book_Img", required = false) MultipartFile file,
                                            HttpServletRequest request, HttpServletResponse response){

        String originalFilename = file.getOriginalFilename();
        GridFS gridFS = new GridFS(mongoTemplate.getDb());
        String uuid = UUID.randomUUID().toString();
        HashMap<String, Object> hashMap = new  HashMap<>();
        GridFSInputFile createFile;
        try {
            createFile = gridFS.createFile(file.getInputStream());
            createFile.setId(uuid);
            createFile.setFilename(originalFilename);
            createFile.put("fileName", originalFilename);
            createFile.save();
            hashMap.put("imgId", uuid);
            hashMap.put("fileName", originalFilename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return hashMap;
    }

    @RequestMapping("querybookimg")
    public void queryImg(String id, HttpServletRequest request,HttpServletResponse response){
        GridFSDBFile file = findImgById(id);
        try {
            if (file != null) {
                OutputStream sos;
                sos = response.getOutputStream();
                response.setContentType("application/octet-stream");
                // 向客户端输出文件
                file.writeTo(sos);
                sos.flush();
                sos.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public GridFSDBFile findImgById(String id) {
        DBObject query  = new BasicDBObject("_id", id);
        GridFS gridFS = new GridFS(mongoTemplate.getDb());
        GridFSDBFile gridFSDBFile = gridFS.findOne(query);
        return  gridFSDBFile;
    }
}

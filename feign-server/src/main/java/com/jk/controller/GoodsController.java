package com.jk.controller;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.Goods;
import com.jk.service.GoodsService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    /*
    * 查询商品
    * */
    @RequestMapping("/queryGoods")
    @ResponseBody
    public String queryGoods(@RequestParam("callback") String callback, Integer start, Integer pageSize,Goods goods){
        HashMap<String,Object> map = goodsService.queryGoods(start,pageSize,goods);
        String jsonString = JSONObject.toJSONString(map);
        String aa= callback+"("+jsonString+")";
        return aa;
    }
    /*
     * 删除商品
     * */
    @RequestMapping("/delGoods")
    @ResponseBody
    public boolean delGoods(String goodId){
        boolean isOk=false;
        isOk=goodsService.delGoods(goodId);
        return isOk;
    }

    /*
     * 新增商品
     * */
    @RequestMapping("/addGoods")
    @ResponseBody
    public boolean addGoods(String goodName,Goods goods){
        boolean isOk=false;
        isOk = goodsService.addGoods(goods);
        return isOk;
    }
    /*
    * 修改回显
    * */
    @RequestMapping("queryGoodsById")
    @ResponseBody
    public String queryGoodsById(@RequestParam("callback") String callback,String goodId){
        List<Goods> list = goodsService.queryGoodsById(goodId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("aa",list);
        String jsonString = JSONObject.toJSONString(map);
        String aa= callback+"("+jsonString+")";
        return aa;
    }
}

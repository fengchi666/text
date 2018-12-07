package com.jk.controller;

import com.jk.model.Goods;
import com.jk.service.GoodsService;
import com.jk.untils.getUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@EnableEurekaClient
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    /*
     * 查询商品数据
     * */
    @RequestMapping("/queryGoods")
    @ResponseBody
    public HashMap<String,Object> queryGoods(Integer start, Integer pageSize,@RequestBody Goods goods){
        HashMap<String,Object>map = goodsService.queryGoods(start,pageSize,goods);

        return map;

    }
    /*
     * 删除商品单条数据
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
    public boolean addGoods(@RequestBody Goods goods){
        boolean isOk=false;
        String goodId = getUUID.getUUid();
        goods.setGoodId(goodId);
        isOk = goodsService.addGoods(goods);
        return isOk;
    }

    /*
     * 修改回显
     * */
    @RequestMapping("queryGoodsById")
    @ResponseBody
    public List<Goods> queryGoodsById(String goodId){
        List<Goods> list = goodsService.queryGoodsById(goodId);
        return list;
    }


}

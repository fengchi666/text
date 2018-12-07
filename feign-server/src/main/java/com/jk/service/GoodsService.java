package com.jk.service;


import com.jk.model.Goods;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
@FeignClient(value = "service-client-goods")
public interface GoodsService {

    @RequestMapping(value = "/queryGoods",method = RequestMethod.GET)
    HashMap<String, Object> queryGoods(@RequestParam("start") Integer start, @RequestParam("pageSize") Integer pageSize,@RequestBody Goods goods);

    @RequestMapping(value = "/delGoods")
    boolean delGoods(@RequestParam("goodId") String goodId);

    @RequestMapping(value = "/addGoods")
    boolean addGoods(@RequestBody Goods goods);

    @RequestMapping(value = "/queryGoodsById",method = RequestMethod.GET)
    List<Goods> queryGoodsById(@RequestParam("goodId")String goodId);
}

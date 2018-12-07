package com.jk.service;

import com.jk.model.Goods;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;
import java.util.List;

public interface GoodsService {
    HashMap<String, Object> queryGoods(Integer start, Integer pageSize,@RequestBody Goods goods);

    boolean delGoods(String goodId);

    boolean addGoods(@RequestBody Goods goods);

    List<Goods> queryGoodsById(String goodId);
}

package com.jk.service;

import com.jk.mapper.GoodsMapper;
import com.jk.model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Override
    public HashMap<String, Object> queryGoods(Integer start, Integer pageSize,@RequestBody Goods goods)
    {
        HashMap<String, Object> map = new HashMap<>();
        List<Goods>list = goodsMapper.queryGoods(start,pageSize,goods);
        long count = goodsMapper.queryCountGood(goods);
        map.put("total",count);
        map.put("rows",list);
        return map;
    }

    @Override
    public boolean delGoods(String goodId) {
        return goodsMapper.delGoods(goodId);
    }

    @Override
    public boolean addGoods(@RequestBody Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public List<Goods> queryGoodsById(String goodId) {
        return goodsMapper.queryGoodsById(goodId);
    }
}

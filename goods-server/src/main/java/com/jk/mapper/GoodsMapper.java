package com.jk.mapper;

import com.jk.model.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface GoodsMapper {

    Long queryCountGood(@Param("goods") Goods goods);

    List<Goods> queryGoods(@Param("start") Integer start, @Param("pageSize") Integer pageSize,@Param("goods")Goods goods);

    boolean delGoods(@RequestParam(value="goodId") String goodId);

    boolean addGoods(@Param("goods") Goods goods);

    List<Goods> queryGoodsById(@Param(value="goodId") String goodId);
}

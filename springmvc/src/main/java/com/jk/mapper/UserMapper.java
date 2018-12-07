package com.jk.mapper;

import com.jk.model.login;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    void registered(@Param("l") login login);

    login loginUser(@Param("ls") login login);
}

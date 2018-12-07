package com.jk.service;

import com.jk.model.login;

public interface UserService {
    void registered(login login);

    String loginUser(login login);
}

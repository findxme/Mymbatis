package com.stu.mybatis.dao;

import com.stu.mybatis.model.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    List<Map<String,Object>> selectUserAll();
    int  adduser(User user);
}

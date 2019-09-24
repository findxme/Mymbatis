package com.stu.mybatis.dao;

import java.util.List;
import java.util.Map;


public interface DbSupermarketDao {

    List<Map<String,Object>> selectUserAllSupermarket();
}

package com.stu.mybatis.controller;


import com.stu.mybatis.dao.DbSupermarketDao;

import com.stu.mybatis.util.MybatisConfig;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class ShopController extends BaseController{

    public  List<Map<String, Object>> findShopAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SqlSession session=MybatisConfig.openMyBatis();
       DbSupermarketDao dbSupermarketDao = session.getMapper(DbSupermarketDao.class);
        List<Map<String , Object>> lists= dbSupermarketDao.selectUserAllSupermarket();
        return lists;

    }




}

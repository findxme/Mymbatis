package com.stu.mybatis.util;

import com.stu.mybatis.dao.UserDao;
import com.stu.mybatis.model.User;
import org.apache.ibatis.session.SqlSession;

public class test {
    public static void main(String[] args) {
//        MybatisConfig mybatisConfig =new MybatisConfig();
//        mybatisConfig.openMyBatis();

        SqlSession session = MybatisConfig.openMyBatis();
        UserDao userDao = session.getMapper(UserDao.class);
        User user = new User();
        user.setUaseName("1");
        user.setPassword("12222");
        System.out.println(userDao.adduser(user));
        session.commit();
    }
}

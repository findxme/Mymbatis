package com.stu.mybatis.controller;

import com.stu.mybatis.dao.UserDao;
import com.stu.mybatis.model.User;
import com.stu.mybatis.util.MybatisConfig;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class LoginServlet extends BaseController {


    public void LoginServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("跳转到LoginServlet");
        String name = request.getParameter("fAccount");
        String password =request.getParameter("fPassword");
//        MybatisConfig mybatisConfig = new MybatisConfig();

        SqlSession session=MybatisConfig.openMyBatis();
        UserDao userDao =session.getMapper(UserDao.class);

        List<Map<String, Object>> list = userDao.selectUserAll();


        for (Map<String, Object> map : list) {
            if (map.get("name").equals(name)&&map.get("password").equals(password)){
                request.setAttribute("msg","看见我就是登录成功");
                ShopController shopController = new ShopController();
                List<Map<String, Object>> list2= shopController.findShopAll(request,response);
                request.setAttribute("commodities",list2);
                System.out.println(list2);
//                MybatisConfig.closeMybatis(session);
                System.out.println("123456");
                MybatisConfig.closeMybatis(session);
               request.getRequestDispatcher("/WEB-INF/success.jsp").forward(request,response);

            }
        }
        request.setAttribute("msg","看见我就是登录失败，失败，失败，重要的事说三遍，滚回去改代码去");
        request.getRequestDispatcher("/WEB-INF/failure.jsp").forward(request,response);

    }
    public void SignUp(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("跳转至singup");
        User user = new User();
        user.setPassword("");
        String name= request.getParameter("username");
        String password = request.getParameter("password");
        user.setUaseName(name);
        user.setPassword(password);
        MybatisConfig mybatisConfig = new MybatisConfig();
        SqlSession session =mybatisConfig.openMyBatis();
        UserDao userDao =session.getMapper(UserDao.class);
        userDao.adduser(user);
//        System.out.println(i);
        mybatisConfig.closeMybatis(session);
        request.setAttribute("msg","成功了恭喜注册成功");
        request.getRequestDispatcher("index.jso").forward(request,response);

    }
}

package com.stu.mybatis.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MybatisConfig {
    public static SqlSession openMyBatis(){
        /*确定指令连接对象*/
        SqlSessionFactory sqlSessionFactory;
        /*sqlsession为指令执行对象*/
        SqlSession session=null;
        String resources= "mybatis.xml";
        try {
            InputStream inputStream = Resources.getResourceAsStream(resources);
            /*如果配置文件正常加载，就开始连接数据库*/
            sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream);
            /*sql指令执行环节session调用工具方法，实例化成功
             * 获取到dao层接口，并实例化*/
            session= sqlSessionFactory.openSession();

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("mybatis实例化失败");
        }
        return session;
    }
    public static void closeMybatis(SqlSession sqlSession){
        if (sqlSession!=null){
            sqlSession.close();
        }
    }
}

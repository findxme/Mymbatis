package com.stu.mybatis.model;

public class User {
    private  String uaseName;
    private  String password;

    public String getUaseName() {
        return uaseName;
    }

    public void setUaseName(String uaseName) {
        this.uaseName = uaseName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "uaseName='" + uaseName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}


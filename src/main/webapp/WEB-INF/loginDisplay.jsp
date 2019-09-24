<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-09-20
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--kkk${msg[0].password}//第一条的password--%>
123
<table class="table table-striped">
    <thead>
    <tr>
        <th>id</th>
        <th>商品名称</th>
        <th>价格</th>
    </tr>
    </thead>
    <tbody>


    <c:forEach var="list" items="${list2}">
        <tr>
            <form class="form-horizontal" action="updateEmp.do" method="post">
                <td class="col-md-1"><input type="text" class="form-control " placeholder="用户名" name="GID" readonly value="${list.GID}"></td>
                <td class="col-md-1"><input type="text" class="form-control " placeholder="姓名" name="GNAME"  value="${list.GNAME}"></td>
                <td class="col-md-1"><input type="text" class="form-control " placeholder="密码" name="GPRICE"  value="${list .GPRICE}"></td>

                <td>
                    <button type="submit" class="btn btn-default" >修改</button>
                    <a type="button" href="selectOne.do?GID=${dbSupermarket.GId}&name=${dbSupermarket.GNAME}" class="btn btn-default" >详情</a>
                    <a href="deleteEmp.do?deleteId=${dbSupermarket.GId}" class="btn btn-danger" type="button">删除</a>
                </td>
            </form>
        </tr>
    </c:forEach>

    

    </tbody>
</table>

</body>
</html>

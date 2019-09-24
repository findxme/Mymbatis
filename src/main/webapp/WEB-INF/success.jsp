<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/19 0019
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("ctx",request.getContextPath());
%>
<html>
<head>
    <title>查看所有1商品</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css"/>
    <script>
        var i = 0;
    </script>
</head>
<body>

<div class="modal fade" id="updateView" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="updateCommodity.do" method="post">
                    <div class="form-group">
                        <label for="commodityNo" class="col-sm-2 control-label">商品编号</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="commodityNo"  placeholder="商品编号" name="commodityNo" readonly >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="commodityName" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="commodityName"   placeholder="商品名称" name="commodityName" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="commodityPrice" class="col-sm-2 control-label">商品价格</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="commodityPrice"   placeholder="商品价格" name="commodityPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info">修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--商品详情--%>
<div class="modal fade" id="showView" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3>商品详情</h3>
            </div>
            <div class="modal-body">
                <div class="form-inline" style="display: inline" >
                    <label>商品编号：</label>
                    <div id="showNo" style="display: inline" ></div>
                </div>

                <div class="form-inline">
                    <label>商品名称：</label>
                    <div id="showName" style="display: inline"></div>
                </div>

                <div class="form-inline">
                    <label>商品价格：</label>
                    <div id="showPrice" style="display: inline" ></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="tab-content">
        <h3>商品信息</h3>
      <a href="${ctx}/2.jsp"> <button class="btn btn-group" id="add">新增</button></a>
        <table id="commodityInfo" class="table table-bordered">
            <thead>
            <tr>
                <th>商品编号</th>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="comData">
            <c:forEach var="item" items="${commodities}" >
                <tr>
                    <td>${item.GID}</td>
                    <td>${item.GNAME}</td>
                    <td>${item.GPRICE}</td>
                    <td>
                        <button class="btn btn-primary" id="update" onclick="update(this)" data-no="${item.GID}" data-name="${item.GNAME}" data-price="${item.GPRICE}">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <button class="btn btn-info" onclick="showView(this)"  data-no="${item.GID}" data-name="${item.GNAME}" data-price="${item.GPRICE}">
                            <span class="glyphicon glyphicon-text-width"></span>
                        </button>
                        <button class="btn btn-danger" onclick="deleteCom(this)" id="${item.GID}" >
                                    <span class="glyphicon glyphicon-trash">
                                    </span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
<%--    <script src="${ctx}/resources/static/bootstrap/js/bootstrap-table.min.js"></script>--%>
<script>

    function showView(e){

        console.log($(e).attr("data-no"))
        // $("#showNo").text("ads")
        $("#showNo").html($(e).attr("data-no"));
        $("#showName").html($(e).attr("data-name"));
        $("#showPrice").html($(e).attr("data-price"));
        $("#showView").modal("show");
    }


    function update(e) {


        $("#updateView").modal('show');
        $("#commodityNo").val($(e).attr("data-no"));
        $("#commodityName").val($(e).attr("data-name"));
        $("#commodityPrice").val($(e).attr("data-price"));
    }
    function deleteCom(e){
        var id = $(e).attr("id");
        $.ajax({
            url:"deleteCom.do",
            type:"post",
            data:{
                "id":id
            },
            success:function(data){
                if(data==1){
                    alert("成功")
                }else{
                    alert("失败")
                }
                window.location="findAll.do"
            }
        })
    }
    $(function () {

        $("#add").on("click",function () {
            $("#ModalAdd").modal('show');
        })
    });
</script>
</body>
</html>

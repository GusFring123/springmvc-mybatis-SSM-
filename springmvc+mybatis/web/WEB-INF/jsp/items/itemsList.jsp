<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询商品列表</title>
    <script type="text/javascript">
        function queryItems() {
            document.itemsForm.action = "${pageContext.request.contextPath}/items/queryItemsByName.action";
            document.itemsForm.submit();
        }

        function deleteItems() {
            //提交form
            document.itemsForm.action = "${pageContext.request.contextPath}/items/deleteItems.action";
            document.itemsForm.submit();
        }
    </script>
</head>
<body>
<c:if test="${username != null}">
    用户名：${username}
    <a href="${pageContext.request.contextPath}/user/logout.action">注销</a>
</c:if>
<form name="itemsForm" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td>商品名称</td>
            <td>商品类型
                <select name="itemsType">
                    <c:forEach items="${itemsTypes}" var="itemsType">
                        <option value="${itemsType.key}">${itemsType.value}</option>
                    </c:forEach>
                </select>
            </td>
            <td><input type="text" name="itemsCustom.name"></td>
            <td><input type="button" value="查询" onclick="queryItems()"/></td>
            <td><input type="button" value="批量删除" onclick="deleteItems()"/></td>
        </tr>
    </table>
    商品列表：
    <table width="100%" border=1>
        <tr>
            <td>选择</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${itemsList}" var="item">
            <tr>
                <td><input type="checkbox" name="items_id" value="${item.id}"></td>
                <td>${item.name }</td>
                <td>${item.price }</td>
                <td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${item.detail }</td>

                <td><a href="${pageContext.request.contextPath }/items/editItems.action?id=${item.id}">修改</a></td>

            </tr>
        </c:forEach>

    </table>
</form>
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: liudongyang
  Date: 2017/12/5
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%String path = request.getContextPath();%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="include/commonfile.jsp"/>
    <link href="${ctx}/static/source/css/style.css" rel='stylesheet' type='text/css' />
    <script type="text/javascript">
      function change(obj) {
            if(obj.innerHTML=="开启")

                obj.innerHTML = "关闭";
            else
                obj.innerHTML ="开启";
        }
    </script>
    <title>聊天室查询</title>
</head>
<jsp:include page="include/header.jsp"/>
<body>
<!--Begin Header Begin-->
    <%@ include file="include/searchBar.jsp" %>
<hr/>
<div class="chat_list am-u-sm-centered list ">
<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-thumbnails">
    <c:if test="${empty chatRoomList}">无答疑室</c:if>
<c:forEach items="${chatRoomList}" var="temp">
    <li><a href="${ctx}/chat/${temp.id}"><img class="am-thumbnail" src="http://s.amazeui.org/media/i/demos/bing-1.jpg" /></a> ${temp.chat_name} </br>  <img src="<%=path%>/static/source/img/zhujiangren.png"><font color="blue">${temp.speaker_name}</font>      &nbsp   &nbsp &nbsp &nbsp <span class="chat_status">&nbsp &nbsp &nbsp
        <c:choose>
            <c:when test="${temp.status==1}">
                &nbsp &nbsp  &nbsp &nbsp &nbsp <font color="red">答疑中</font>
            </c:when>
            <c:otherwise>
                &nbsp &nbsp &nbsp &nbsp &nbsp <font color="red">休息中</font>
            </c:otherwise>
        </c:choose>
    </span> <br>
        <button type="button" class="am-btn  am-round am-btn-secondary  btn_delete" ><a href="${ctx}/deleteChatRoom/${temp.id}/${userid}">删除</a></button> &nbsp &nbsp &nbsp
        <button type="button"  class="am-btn am-btn-success am-round btn_delete ">
            <a href="${ctx}/updateChatInfo/${temp.id}/${userid}">修改</a>
        </button>&nbsp &nbsp &nbsp &nbsp
        <button type="button"  class="am-btn am-btn-warning am-round .am-animation-scale-down btn_delete " >
            <c:if test="${temp.status==1}">
                <a href="${ctx}/changeStatus/${temp.id}/${userid}">关闭</a>
            </c:if>
            <c:if test="${temp.status==0}">
                <a href="${ctx}/changeStatus/${temp.id}/${userid}">开启</a>
            </c:if>
</button>
    </li>
</c:forEach>
</ul>
</div>

<ul class="am-pagination am-pagination-centered">
    <li class="am-disabled"><a href="#">&laquo;</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
</body>
</html>

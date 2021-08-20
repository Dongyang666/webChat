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
    <jsp:include page="stu-commonfile.jsp"/>
    <link href="${ctx}/static/source/css/style.css" rel='stylesheet' type='text/css' />
    <title>聊天室查询</title>
</head>
<jsp:include page="stu-header.jsp"/>
<body>
<!--Begin Header Begin-->
    <%@ include file="stu-searchBar.jsp" %>
<hr/>
<div class="chat_list am-u-sm-centered list ">
<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-thumbnails">
    <c:if test="${empty stuchatRoomList}"> 无答疑室开启，请电话咨询老师开启时间 </c:if>
    <c:forEach items="${stuchatRoomList}" var="temp">
    <li><a href="${ctx}/chat/${temp.id}"><img class="am-thumbnail" src="http://s.amazeui.org/media/i/demos/bing-1.jpg" /></a>
            ${temp.chat_name}
        </br>
        <img src="<%=path%>/static/source/img/zhujiangren.png"><font color="blue">${temp.speaker_name}</font>
        &nbsp   &nbsp &nbsp &nbsp
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

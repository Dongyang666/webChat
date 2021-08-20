<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    var contextPath = "${ctx}";
</script>

<div class="am-g top">
    <div class="am-u-sm-3 search am-u-sm-centered  ">
        <form action="/selectByName/${userid}" method="post" data-am-validator>
            <input type="text" value="${keyWord}" name="keyWord" id="keyWord" class="s_ipt">
            <input type="submit" value="搜索" class="s_btn">
        </form>
    </div>
    <div class="am-u-sm-1  am-fr i_car">
        <div class="">
            <a href="${ctx}/add-chat">创建答疑室</a>
        </div>
    </div>
</div>

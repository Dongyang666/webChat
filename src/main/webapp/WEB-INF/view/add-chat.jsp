<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>WebChat | 添加答疑室</title>
    <jsp:include page="include/commonfile.jsp"/>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<div class="am-cf admin-main">
    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加答疑室</strong> / <small>form</small></div>
        </div>

        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">基本信息</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                    <form class="am-form am-form-horizontal" id="information-form" action="${ctx}/insert-chat/${userid}" method="post" data-am-validator>
                        <div class="am-form-group">
                            <label for="chat_name" class="am-u-sm-2 am-form-label">答疑室名称</label>
                            <div class="am-u-sm-10">
                                <input type="text" id="chat_name" name="chat_name"  required placeholder="这里输入你的答疑室名称...">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="speaker_name" class="am-u-sm-2 am-form-label">主讲人</label>
                            <div class="am-u-sm-10">
                                <input type="text" id="speaker_name" name="speaker_name" value="${nickname}" disabled>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="profile" class="am-u-sm-2 am-form-label">答疑室简介</label>
                            <div class="am-u-sm-10">
                                <input type="text" id="profile" name="profile"  required placeholder="这里输入答疑室的简介...">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="status" class="am-u-sm-2 am-form-label">答疑室状态</label>
                            <div class="am-u-sm-10">
                                <select id="status" name="status" data-am-selected>
                                    <option selected></option>
                                    <option value="1">开启</option>
                                    <option value="0">关闭</option>
                                </select>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span> 提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- content end -->
</div>
<a href="#" class="am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}">
    <span class="am-icon-btn am-icon-th-list"></span>
</a>
</body>
</html>

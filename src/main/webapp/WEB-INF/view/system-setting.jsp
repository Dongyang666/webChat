<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>WebChat | 系统设置</title>
    <jsp:include page="include/commonfile.jsp"/>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<div class="am-cf admin-main">
    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统设置</strong> / <small>form</small></div>
        </div>

        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">系统设置</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                    <form class="am-form am-form-horizontal">
                        <div class="am-form-group">
                            <label class="am-u-sm-2 am-form-label">分页大小</label>
                            <div class="am-u-sm-10">
                                <div class="am-btn-group" data-am-button>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 5
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 10
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 15
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 20
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-2 am-form-label">好友进出提示</label>
                            <div class="am-u-sm-10">
                                <div class="am-btn-group" data-am-button>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 提示
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 不提示
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-2 am-form-label">在线人数显示</label>
                            <div class="am-u-sm-10">
                                <div class="am-btn-group" data-am-button>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 显示
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 不显示
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-2 am-form-label">我的信息</label>
                            <div class="am-u-sm-10">
                                <div class="am-btn-group" data-am-button>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 允许被查看
                                    </label>
                                    <label class="am-btn am-btn-secondary am-btn-sm">
                                        <input type="radio" name="options"> 不允许查看
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span> 提交</button>
                            </div>
                        </div>
                    </form>
                </div>

                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span> 提交修改</button>
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
<jsp:include page="include/footer.jsp"/>
</body>
</html>

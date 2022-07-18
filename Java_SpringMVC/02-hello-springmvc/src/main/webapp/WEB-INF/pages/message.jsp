<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <title>留言板</title>
    <jsp:include page="common/headFile.jsp"/>
    <style>

        a {
            text-decoration: none;
            color: #34383C !important;
        }

        a[href^='email']::before {
            content: ' ✉ ';
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<div class="container col-xl-6 col-sm-12 col-xs-12 col-xxl-4 px-10 py-10 mt-5">
    <%@ include file="./common/header.jsp" %>
    <c:if test="${requestScope.success==null}">
        <h3 class="mb-3">欢迎来到留言版！</h3>
    </c:if>
    <c:if test="${requestScope.success!=null}">
        <h3 class="text-success">${requestScope.success}</h3>
    </c:if>

    <div class="mb-2 mt-2">
        <span>您可以通过邮箱联系我</span><a href="email:+2191377759@qq.com">2191377759@qq.com</a>
        <span>或者通过留言板</span>
    </div>

    <form action="${pageContext.request.contextPath}/message/add" method="post">
        <div class="mb-2 mt-4">
            <label for="email" class="form-label">邮箱</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="xxx@xxx.com" required>
            <c:if test="${requestScope.email!=null}">
                <p class="text-danger">${requestScope.email}</p>
            </c:if>

        </div>
        <div class="mb-3">
            <label for="contentText" class="form-label">留言内容</label>
            <textarea class="form-control" id="contentText" rows="3" name="content" required minlength="2"
                      maxlength="500"></textarea>
            <c:if test="${requestScope.content!=null}">
                <p class="text-danger">${requestScope.content}</p>
            </c:if>
        </div>
        <div class="mb-3">
            <a class="btn btn-outline-primary btn-sm" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-primary btn-sm " type="submit">提交</button>
        </div>
    </form>
    <%@ include file="./common/footer.jsp" %>

</div>

</body>

</html>
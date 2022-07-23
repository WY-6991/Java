<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8">
    <title>分类</title>
    <jsp:include page="common/headFile.jsp"/>
    <style>
        .main span::before {
            content: ' 📂 ';
        }

        .main span:hover {
            text-decoration: underline !important;
        }

        li {
            list-style: none;
        }
    </style>
</head>

<body>

<div class="container col-xl-6 col-sm-12 col-xs-12 col-xxl-4 px-10 py-10 mt-5">
    <%@ include file="./common/header.jsp" %>
    <section class="col-12  main">
        <h2>${pageContext.request.contextPath}</h2>
        <ul>
            <c:choose>
                <c:when test="${requestScope.r.code == 200}">
                    <c:choose>
                        <c:when test="${requestScope.r.data.size()!=0}">
                            <c:forEach var="file" items="${requestScope.r.data}">
                                <li class="mb-1 mt-1">
                                        <%--                                    <a href="${pageContext.request.contextPath}/${file.url}" class="text-success text-decoration-none"--%>
                                        <%--                                       download="${file.name}">${file.name}</a>--%>

                                    <span class="text-success text-decoration-none"
                                          data-url="${file.url}">${file.name}</span>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3 class="text-dark">暂无内容！</h3>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <h3 class="text-danger">加载失败！</h3>
                </c:otherwise>
            </c:choose>

        </ul>
        <div class="dropdown-divider"></div>
    </section>
    <%@ include file="./common/footer.jsp" %>
</div>

<script>
    $(function () {
        $('ul li').on('click', function (e) {
            console.log($(this).children('span').attr('data-url'))
            var url = $(this).children('span').attr('data-url');
            $.ajax({
                url:'/file/download',
                type:'get',
                data:{'url':url},
                success:function (result) {
                    console.log(result)
                },
                error:function () {
                    console.log('文件下载失败！')
                }

            })
        })
    })
</script>

</body>

</html>
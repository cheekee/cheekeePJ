<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <script src="/resources/js/marked.js"></script>
        <%--<script type="text/javascript" src="//simonwaldherr.github.io/micromarkdown.js/dist/micromarkdown.min.js"></script>--%>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/highlight.js/8.7/styles/monokai_sublime.min.css">
        <script src="//cdn.jsdelivr.net/highlight.js/8.7/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
            <div class="blog-content">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginMember}">
                        <div id="writeMenu"><div id="writeModify">글수정</div><div id="writeDelete">글삭제</div></div>
                    </c:when>
                </c:choose>
            <form action="/blogList.do" id="blogRetrieveForm">
            <div id="content"></div>
            <input type="hidden" id="someText" value="<c:out value="${blogResult.blogDesc}"/>">
            <input type="hidden" name="searchCategory" value="<c:out value="${searchCategory}"/>">
            </form>
            </div>
        <div id="blog-footer"></div>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">
            var someText = $('#someText').val();
            var blogDesc = someText.replace(/(\r\n|\n|\r)/gm,"\n");
            document.getElementById('content').innerHTML = marked(blogDesc);

            // document.getElementById('content').innerHTML = micromarkdown.parse(blogDesc);

            // 1.코드 하이라이트 안되고, 2.와이드 줄이면 벗어남, 3. 긴글은 아래 하단 짤림

        </script>
    </layout:put>
</layout:extends>
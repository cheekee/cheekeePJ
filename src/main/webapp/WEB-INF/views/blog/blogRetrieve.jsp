<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <script src="/resources/js/marked.js"></script>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

            <div class="section-main-container">
            <form action="/blogList.do">
            <div id="content"></div>
            <input type="hidden" id="someText" value="<c:out value="${blogResult.blogDesc}"/>">
            <input type="hidden" name="searchCategory" value="<c:out value="${searchCategory}"/>">
            </form>
            </div>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">
            var someText = $('#someText').val();
            var blogDesc = someText.replace(/(\r\n|\n|\r)/gm,"\n");
            document.getElementById('content').innerHTML = marked(blogDesc);

            // 1.코드 하이라이트 안되고, 2.와이드 줄이면 벗어남, 3. 긴글은 아래 하단 짤림

        </script>
    </layout:put>
</layout:extends>
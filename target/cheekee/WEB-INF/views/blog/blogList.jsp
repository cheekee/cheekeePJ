<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">

        <section>
            <c:forEach items="${blogList}" var="blogList">
                ${blogList.blogIdx} <br/>
                ${blogList.blogDesc}<br/>
            </c:forEach>
        </section>

    </layout:put>
</layout:extends>
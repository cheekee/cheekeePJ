<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <meta name="description" content="admin 홈 화면입니다.">
        <style>

        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            관리자 홈

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">



        </script>
    </layout:put>
</layout:extends>
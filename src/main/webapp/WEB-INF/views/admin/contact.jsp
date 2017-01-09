<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <style>
            .contantDiv {
                margin: 0 auto;
                width: 90%;
                text-align: center;
                margin-bottom: 50px;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            <div class="contantDiv"><h3>NickName</h3> <span>Cheekee</span></div>
            <div class="contantDiv"><h3>Email</h3> <a href="mailto:songcheekee@gmail.com">songcheekee@gmail.com</a></div>
            <div class="contantDiv"><h3>Github</h3> <a href="https://github.com/cheekee"><span>https://github.com/cheekee</span></a></div>
            <div class="contantDiv"><h3>SNS</h3> <span>...</span></div>

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">



        </script>
    </layout:put>
</layout:extends>
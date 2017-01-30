<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <meta name="description" content="cheekee를 소개하는 화면입니다.">
        <style>

            .contantDiv {
                margin: 0 auto;
                width: 90%;
                text-align: center;
                margin-bottom: 50px;
                color: white;
            }
            #contactSection {
                width: 100%;
                background-image: url(/resources/image/computer.jpg);
                background-position: center;
                background-size: cover;
                height: 635px;
            }
            a {
                color: white;
            }
            a:hover {
                color: #fc754f;
            }

        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section id="contactSection">

            <div class="contantDiv"><h2>NickName</h2> <span>Cheekee</span></div>
            <div class="contantDiv"><h2>Email</h2> <a href="mailto:songcheekee@gmail.com">songcheekee@gmail.com</a></div>
            <div class="contantDiv"><h2>Github</h2> <a href="https://github.com/cheekee"><span>https://github.com/cheekee</span></a></div>
            <div class="contantDiv"><h2>SNS</h2> <span>...</span></div>

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">



        </script>
    </layout:put>
</layout:extends>
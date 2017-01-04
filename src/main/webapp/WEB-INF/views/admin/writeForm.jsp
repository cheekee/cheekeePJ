<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
        <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
        <style>

        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            <form id="writeFrom" action="/write.do" method="post">

                <textarea id="MyID" name="writeValue"></textarea>

            </form>

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            var simplemde = new SimpleMDE({ element: document.getElementById("MyID") });

        </script>
    </layout:put>
</layout:extends>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
        <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
        <style>
            #writeBtn {
                background-color: #26519e;
                width: 100px;
                height: 30px;
                text-align: center;
                margin: 0 auto;
                margin-top: 10px;
                margin-bottom: 10px;
                vertical-align: middle;
                font-size: 24px;
                color: white;
                cursor: pointer;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            <form id="writeFrom" action="/write.do" method="post">
                <div id="writeBtn">
                    글쓰기
                </div>
                <table>
                    <tr>
                        <td>
                            DIVISION :
                        </td>
                        <td>
                            <select name="division">
                                <option value="blog">BLOG</option>
                                <option value="idea">IDEA</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CATEGORY :
                        </td>
                        <td>
                            <input type="text" name="blogCategory"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            TITLE :
                        </td>
                        <td>
                            <input type="text" name="blogTitle" style="width: 260px">
                        </td>
                    </tr>
                </table>

                <textarea id="MyID" name="blogDesc"></textarea>

            </form>

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            var simplemde = new SimpleMDE({ element: document.getElementById("MyID") });

            $(document).ready(function(){
               $('#writeBtn').click(function(){
                    $('#writeFrom').submit();
               }) ;
            });

        </script>
    </layout:put>
</layout:extends>
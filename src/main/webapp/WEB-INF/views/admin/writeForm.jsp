<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <meta name="description" content="블로그, 아이디어를 작성하는 화면입니다.">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
        <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
        <style>
            #writeBtn {
                margin: 0 auto;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            #writeFrom {
                margin-bottom: 50px;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            <form id="writeFrom" action="/write.do" method="post">
                <div id="writeBtn" class="btn">
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
                            <input type="text" name="blogTitle" class="titleInput">
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
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
        <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
    <section>

        <div class="blog-content">
            <c:choose>
                <c:when test="${not empty sessionScope.loginMember}">
                    <div id="writeMenu">
                        <div id="writeModify" class="btn">수정</div>
                        <div id="writeDelete" class="btn"><a style="color: white;" href="<c:url value="/blogRetrieve.do?searchBlogIdx=${blogResult.blogIdx}" />">취소</a></div>
                    </div>
                </c:when>
            </c:choose>
            <form action="/blogModify.do" id="blogModifyForm">
                <div id="content"></div>
                <table>
                    <tr>
                        <td>
                            DIVISION :
                        </td>
                        <td>
                            <select name="division" id="divisionSelect">
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
                            <input type="text" name="blogCategory" value="${blogResult.blogCategory}"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            TITLE :
                        </td>
                        <td>
                            <input type="text" name="blogTitle" value="${blogResult.blogTitle}" class="titleInput">
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="blogIdx" id="blogIdx" value="${blogResult.blogIdx}">

                <textarea id="MyID" name="blogDesc">${blogResult.blogDesc}</textarea>
            </form>
        </div>
        <div id="blog-footer"></div>

    </section>
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            var simplemde = new SimpleMDE({ element: document.getElementById("MyID") });

            $(document).ready(function(){

                // division pre select
                $('#divisionSelect option').each(function(){
                    if($(this).val()=="${blogResult.division}"){
                        $(this).attr("selected","selected"); // attr적용안될경우 prop으로
                    }
                });

                // 블로그 수정 처리
                $('#writeModify').click(function(){
                    $('#blogModifyForm').submit();
                }) ;

            });

        </script>
    </layout:put>
</layout:extends>
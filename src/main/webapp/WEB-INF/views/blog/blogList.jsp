<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">

        <section>
            <div class="blog-category-wrap">
                <c:forEach items="${blogCategoryList}" var="blogCategoryList">
                    <div class="blog-category">${blogCategoryList}</div>
                </c:forEach>
            </div>
            <div id="section-content-wrap">

            </div>
        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
    <script type="text/javascript">

        $(document).ready(function(){

            ajaxBlogList();

            $(document).scroll(function() {
                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                    if(blogCount > pageNumber){
                        pageNumber += 5;
                        ajaxBlogList();
                    }
                }
            })

        });


        // 리스트 쿼리 - 시작숫자
        var pageNumber = 0;
        // 리스트 쿼리 - 끝숫자
        var pageEndNumber = 5;
        // blogList 총 건수
        var blogCount = 0;

        // 블로그 리스트 불러오기
        function ajaxBlogList(){
            $.ajax({
                url : "<c:url value='/ajaxBlogList.do'/>",
                type : 'get', // get, post
                data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                dataType : 'json', //text, json, html, xml, script
                success : function(data) {
                    $(data).each(function(index, item) {
                        var html = "<div class='section-content-item'>"+item.blogDt+" | "+item.blogCategory+"<a class='blog-item-title' href='<c:url value="/blogRetrieve.do?blogIdx?blogIdx=" />'>"+item.blogTitle+"</a></div>"
                        $('#section-content-wrap').append(html);
                        blogCount = item.blogCount;
                    });
                },
                error : function() {
                    alert("실패");
                }
            });
        };

    </script>
    </layout:put>
</layout:extends>
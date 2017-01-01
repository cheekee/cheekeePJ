<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">

        <section>
            <div class="blog-category-wrap">
                <c:forEach items="${blogCategoryList}" var="blogCategoryList">
                    <div class="blog-category">
                        <span>${blogCategoryList}</span>
                    </div>
                    <input type="hidden" value="${blogCategoryList}">
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
                        if(searchCategory==null){
                            ajaxBlogList();
                        }else{
                            ajaxSearchBlogList(searchCategory);
                        }
                    }
                }
            });

            $('.blog-category').on("click", function(){
                pageNumber = 0;
                searchCategory = $(this).children('span').text();
                $('#section-content-wrap').children().remove();
                ajaxSearchBlogList(searchCategory);
            });

            // 이거는 동적html 생성된것이다 그래서 on 문법 그 클릭되는 아이디 이름인가 넣어야함
            $('.section-content-item').on("click", function(){

            });

        });


        // 리스트 쿼리 - 시작숫자
        var pageNumber = 0;
        // 리스트 쿼리 - 끝숫자
        var pageEndNumber = 5;
        // blogList 총 건수
        var blogCount = 0;
        // 블로그 검색 키워드
        var searchCategory = null;

        // 블로그 리스트 불러오기
        function ajaxBlogList(){
            $.ajax({
                url : "<c:url value='/ajaxBlogList.do'/>",
                type : 'get', // get, post
                data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                dataType : 'json', //text, json, html, xml, script
                success : function(data) {
                    $(data).each(function(index, item) {
                        var html = "<div class='section-content-item'>"+item.blogDt+" | "+item.blogCategory+"<br><span class='blog-item-title'>"+item.blogTitle+"</span></div>"
                        $('#section-content-wrap').append(html);
                        blogCount = item.blogCount;
                    });
                },
                error : function() {
                    alert("실패");
                }
            });
        };

        // 블로그 카테고리 검색 리스트 불러오기
        function ajaxSearchBlogList(searchCategory){
            var searchCategory = searchCategory;
            $.ajax({
                url : "<c:url value='/ajaxBlogList.do'/>",
                type : 'get', // get, post
                data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber, "searchCategory":searchCategory}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                dataType : 'json', //text, json, html, xml, script
                success : function(data) {
                    $(data).each(function(index, item) {
                        var html = "<div class='section-content-item'>"+item.blogDt+" | "+item.blogCategory+"<br><span class='blog-item-title'>"+item.blogTitle+"</span></div>"
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
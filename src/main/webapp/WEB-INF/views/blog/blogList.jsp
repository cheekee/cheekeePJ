<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <meta name="description" content="블로그, 아이디어 리스트 화면입니다.">
    </layout:put>
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
            <input type="hidden" id="division" value="${division}">
        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            $(document).ready(function(){

                $(window).on('popstate',function(event){
                    var state = event.originalEvent.state;
                    console.log("popstate:", state );
                });

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

                // 블로그 상세보기 클릭
                $(document).on("click", ".section-content-item", function(){
                    var searchBlogIdx = $(this).children("input").val();
                    blogRetrieve(searchBlogIdx);
                });

                $(document).on("vclick", ".section-content-item", function(){
                    var searchBlogIdx = $(this).children("input").val();
                    blogRetrieve(searchBlogIdx);
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
            // division : 블로그, 아이디어 구분
            var division = $('#division').val();
            // 블로그 리스트 불러오기
            function ajaxBlogList(){
                $.ajax({
                    url : "<c:url value='/ajaxBlogList.do'/>",
                    type : 'get', // get, post
                    data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber, "division":division}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                    dataType : 'json', //text, json, html, xml, script
                    success : function(data) {
                        $(data).each(function(index, item) {
                            var html = "<div class='section-content-item'>"+item.blogCategory+"  |  "+item.blogDt+"<br><br><span class='blog-item-title'>"+item.blogTitle+"</span><input type='hidden' value="+item.blogIdx+"></div>"
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
                    data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber, "searchCategory":searchCategory, "division":division}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                    dataType : 'json', //text, json, html, xml, script
                    success : function(data) {
                        $(data).each(function(index, item) {
                            var html = "<div class='section-content-item'>"+item.blogCategory+"  |  "+item.blogDt+"<br><br><span class='blog-item-title'>"+item.blogTitle+"</span><input type='hidden' value="+item.blogIdx+"></div>"
                            $('#section-content-wrap').append(html);
                            blogCount = item.blogCount;
                        });
                    },
                    error : function() {
                        alert("실패");
                    }
                });
            };

            // 블로그 상세조회
            function blogRetrieve(searchBlogIdx){
                var searchBlogIdx = searchBlogIdx;
                location.href="<c:url value='/blogRetrieve.do?searchBlogIdx="+searchBlogIdx+"'/>"
            }

            if(typeof(history.pushState) == 'function')
            {
                var division = $('#division').val();
                var renewURL = location.href;
                var state = { 'division' : division, 'searchCategory' : searchCategory};
                renewURL = renewURL.replace(/\&page=([0-9]+)/ig,'');
                history.pushState(state, null, renewURL);
            }

        </script>
    </layout:put>
</layout:extends>
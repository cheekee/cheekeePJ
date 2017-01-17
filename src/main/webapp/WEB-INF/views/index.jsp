<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <title>치키의 개발 블로그</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
    <section>
        <!-- Main content area -->
        <div id="section-main">
            <div id="section-main-wrap">
            <div class="section-main-container">
                <div class="main-list-top">
                    B L O G
                </div>
                <div class="main-list-wrap" id="blog">
                </div>
            </div>
            <div class="section-main-container">
                <div class="main-list-top">
                    I D E A
                </div>
                <div class="main-list-wrap" id="idea">
                </div>
            </div>
            </div>
        </div>
    </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            // 리스트 쿼리 - 시작숫자
            var pageNumber = 0;
            // 리스트 쿼리 - 끝숫자
            var pageEndNumber = 5;
            var division = "";

            // 블로그 리스트 불러오기 (blog)
            function ajaxBlogList1(){
                division = "blog";
                $.ajax({
                    url : "<c:url value='/ajaxBlogList.do'/>",
                    type : 'get', // get, post
                    data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber, "division":division}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                    dataType : 'json', //text, json, html, xml, script
                    success : function(data) {
                        $(data).each(function(index, item) {
                            var html = "<div class='main-list-row'><span>"+item.division+" | "+item.blogDt+"</span><h4 class='main4'>"+item.blogTitle+"</h4><input type='hidden' value="+item.blogIdx+"></div>"
                            $('#blog').append(html);
                        });
                    },
                    error : function() {
                        alert("실패");
                    }
                });
            };

            // 블로그 리스트 불러오기 (idea)
            function ajaxBlogList2(){
                division = "idea";
                $.ajax({
                    url : "<c:url value='/ajaxBlogList.do'/>",
                    type : 'get', // get, post
                    data : {"pageNumber":pageNumber, "pageEndNumber":pageEndNumber, "division":division}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                    dataType : 'json', //text, json, html, xml, script
                    success : function(data) {
                        $(data).each(function(index, item) {
                            var html = "<div class='main-list-row'><span>"+item.division+" | "+item.blogDt+"</span><h4 class='main4'>"+item.blogTitle+"</h4><input type='hidden' value="+item.blogIdx+"></div>"
                            $('#idea').append(html);
                        });
                    },
                    error : function() {
                        alert("실패");
                    }
                });
            };


            $(document).ready(function () {
                ajaxBlogList1();
                ajaxBlogList2();
            });

            // 블로그 상세보기 클릭
            $(document).on("click", ".main-list-row", function(){
                var searchBlogIdx = $(this).children("input").val();
                blogRetrieve(searchBlogIdx);
            });

            $(document).on("vclick", ".main-list-row", function(){
                var searchBlogIdx = $(this).children("input").val();
                blogRetrieve(searchBlogIdx);
            });

            // 블로그 상세조회
            function blogRetrieve(searchBlogIdx){
                var searchBlogIdx = searchBlogIdx;
                location.href="<c:url value='/blogRetrieve.do?searchBlogIdx="+searchBlogIdx+"'/>"
            }

        </script>
    </layout:put>
</layout:extends>
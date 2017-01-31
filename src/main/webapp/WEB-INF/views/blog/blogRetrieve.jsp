<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <meta name="description" content="블로그, 아이디어 조회 화면입니다.">
        <script src="/resources/js/marked.js"></script>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/highlight.js/8.7/styles/monokai_sublime.min.css">
        <script src="//cdn.jsdelivr.net/highlight.js/8.7/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <style>
            #backBtn {
                text-align: center;
            }
            #backBtn:hover {
                color: #26519e;
                cursor: pointer;
            }
            a {
                color: #f9724d;
            }
            img{
                display: block;
                margin: 0 auto;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
            <div class="blog-content">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginMember}">
                        <div id="writeMenu">
                            <div id="writeModify" class="btn">글수정<input type='hidden' value="${blogResult.blogIdx}"></div>
                            <div id="writeDelete" class="btn">글삭제<input type='hidden' value="${blogResult.blogIdx}"></div>
                            <div id="writeCancel" class="btn"><a style="color: white;" href="<c:url value="/blogList.do?division=${blogResult.division}" />">취소</a></div>
                        </div>
                    </c:when>
                </c:choose>
            <form action="/blogList.do" id="blogRetrieveForm">
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- content top -->
                <ins class="adsbygoogle"
                     style="display:block"
                     data-ad-client="ca-pub-8056199978184432"
                     data-ad-slot="5151705905"
                     data-ad-format="auto"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            <div id="content">
            </div>
            <input type="hidden" id="someText" value="<c:out value="${blogResult.blogDesc}"/>">
            <input type="hidden" name="searchCategory" value="<c:out value="${searchCategory}"/>">
            </form>
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 으덜덜1 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-8056199978184432"
     data-ad-slot="7622651103"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
            </div>
        <div id="backBtn"><i class="fa fa-arrow-left fa-2x" aria-hidden="true"></i></div>
        <div id="disqus_thread"></div>
        <div id="blog-footer"></div>
        <script id="dsq-count-scr" src="//cheekee.disqus.com/count.js" async></script>
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">
            var someText = $('#someText').val();
            var blogDesc = someText.replace(/(\r\n|\n|\r)/gm,"\n");
            document.getElementById('content').innerHTML = marked(blogDesc);

            $('#backBtn').click(function () {
                javascript:history.back(-1);
            });

            // 블로그 수정 화면 버튼 클릭
            $(document).on("click", "#writeModify", function(){
                var searchBlogIdx = $(this).children("input").val();
                blogModifyForm(searchBlogIdx);
            });

            // 블로그 삭제
            $(document).on("click", "#writeDelete", function(){
                if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                    var searchBlogIdx = $(this).children("input").val();
                    location.href="<c:url value='/blogDelete.do?searchBlogIdx="+searchBlogIdx+"'/>"
                }else{   //취소
                    return;
                }
            });

            // 블로그 수정 화면 이동 함수
            function blogModifyForm(searchBlogIdx){
                var searchBlogIdx = searchBlogIdx;
                location.href="<c:url value='/blogModifyForm.do?searchBlogIdx="+searchBlogIdx+"'/>"
            }

            /**
             *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
             *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
            /*
             var disqus_config = function () {
             this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
             this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
             };
             */
            (function() { // DON'T EDIT BELOW THIS LINE
                var d = document, s = d.createElement('script');
                s.src = '//cheekee.disqus.com/embed.js';
                s.setAttribute('data-timestamp', +new Date());
                (d.head || d.body).appendChild(s);
            })();

        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </layout:put>
</layout:extends>
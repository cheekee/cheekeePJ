<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">

        <section>
            <div id="section-content-wrap">

            </div>
        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
    <script type="text/javascript">

        $(document).ready(function(){
            $(document).scroll(function() {
                var maxHeight = $(document).height();
                var currentScroll = $(window).scrollTop() + $(window).height();

                if (maxHeight <= currentScroll + 100) {
                    $.ajax({
                        url : "<c:url value='/ajaxBlogList.do'/>",
                        type : 'get', // get, post
                        data : {
                        }, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
                        dataType : 'json', //text, json, html, xml, script
                        success : function(data) {
                            $(data).each(function(index, item) {
                                var html = "<div class='section-content-item'>"+item.blogCategory+"</div>"
                                $('#section-content-wrap').append(html);
                            })
                        },
                        error : function() {
                            alert("실패");
                        }
                    });
                }
            })


        });

    </script>
    </layout:put>
</layout:extends>
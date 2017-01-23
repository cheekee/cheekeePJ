<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" uri="http://kwonnam.pe.kr/jsp/template-inheritance"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://u1.linnk.it/qc8sbw/usr/apps/textsync/upload/jquery-mobile-touch.value.js " ></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet">
<meta name="google-site-verification" content="jCuWO-3ArJ4jNuyFUewyrlBcCp2fYbEsBqVrWj9HLV4" />
<layout:block name="import">
</layout:block>
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>

  <layout:block name="header">

      <nav>
          <!-- Navigation -->
          <div id="nav-main-logo"><a href="<c:url value="/" />">CHEEKEE's PLACE</a></div>
          <ul>
              <%--<li><a href="<c:url value="/geustbookList.do" />">GEUSTBOOK</a></li>--%>
              <li><a href="<c:url value="/contact.do" />">CONTACT</a></li>
              <li><a href="<c:url value="/blogList.do?division=idea" />">IDEA</a></li>
              <li><a href="<c:url value="/blogList.do?division=blog" />">BLOG</a></li>
              <c:choose>
                  <c:when test="${not empty sessionScope.loginMember}">
                      <li><a href="<c:url value="/writeForm.do" />">WRITE</a></li>
                      <li><a href="<c:url value="/adminHome.do" />">ADMIN</a></li>
                      <li><a href="<c:url value="/logout.do" />">LOGOUT</a></li>
                  </c:when>
              </c:choose>
          </ul>
          <i id="menubar" class="fa fa-bars" aria-hidden="true"></i>
      </nav>
      <section>
          <ul id="side-menu">
              <li><a href="<c:url value="/blogList.do?division=blog" />">BLOG</a></li>
              <li><a href="<c:url value="/blogList.do?division=idea" />">IDEA</a></li>
              <li><a href="<c:url value="/contact.do" />">CONTACT</a></li>
              <%--<li><a href="<c:url value="/geustbookList.do" />">GEUSTBOOK</a></li>--%>
              <c:choose>
                  <c:when test="${not empty sessionScope.loginMember}">
                      <li><a href="<c:url value="/writeForm.do" />">WRITE</a></li>
                      <li><a href="<c:url value="/adminHome.do" />">ADMIN</a></li>
                      <li><a href="<c:url value="/logout.do" />">LOGOUT</a></li>
                  </c:when>
              </c:choose>
          </ul>
          <!-- Introduction -->
          <div id="section-top">
              <div id="section-top-main">
                  <h1>CHEEKEE's PLACE에 오신것을 환영합니다</h1>
                  <h3>한 개발자의 일상을 담은 사이트입니다</h3>
                  <div id="searchDiv"><input id='myTitle' type='text'><span id="searchBtn">      해당글보기</span></div>
              </div>
          </div>
      </section>

  </layout:block>

  <layout:block name="contents">
  </layout:block>

  <layout:block name="footer">
      <footer>
          <!-- Footer -->
          copyright © 2016 <a href="https://github.com/cheekee" target="_blank">Cheekee</a><br/>
          이 사이트는 크롬 브라우저에 최적화 되어 있습니다
      </footer>
  </layout:block>
  
  <layout:block name="scripts">
  </layout:block>
  
<layout:block name="default-script">
<script type="text/javascript">
    $(document).ready(function(){
        $('#myTitle').val('');
        ajaxSearchTitle();

        $('#menubar').click(function(){
            $('#side-menu').toggle("slow");
        });

        $('#searchBtn').click(function(){
            var searchValue = $.trim($(this).prev('input').val());
            if(searchValue == ''){
                alert("포스팅 제목을 선택하세요!");
                $('#myTitle').val('');
            }else{
                if(postTitle.indexOf(searchValue) != -1){
                    var searchIndexPre = $.inArray(searchValue, postTitle) -1;
                    var searchIndex = postTitle[searchIndexPre];
                    blogRetrieve(searchIndex);
                }else{
                    alert("포스팅 제목을 선택하세요!");
                }
            }
        });

    });

    var postTitle = [];

    // 검색 자동 완성을 위한 post title 데이터 가져오자!
    function ajaxSearchTitle(){
        $.ajax({
            url : "<c:url value='/ajaxSearchTitle.do'/>",
            type : 'get', // get, post
            data : {}, // form을 통채로 넘길때, {'name':'홍길동', 'age':'20'}
            dataType : 'json', //text, json, html, xml, script
            success : function(data) {
                $(data).each(function(index, item) {
                    postTitle.push(item.blogIdx);
                    postTitle.push(item.blogTitle);
                });
            },
            error : function() {
                alert("실패");
            }
        });
    };
    $(function() {

        $( "#myTitle" ).autocomplete({
            source: postTitle
        });
    });
    function blogRetrieve(searchBlogIdx){
        var searchBlogIdx = searchBlogIdx;
        location.href="<c:url value='/blogRetrieve.do?searchBlogIdx="+searchBlogIdx+"'/>"
    }

</script>
</layout:block>
</body>
</html>
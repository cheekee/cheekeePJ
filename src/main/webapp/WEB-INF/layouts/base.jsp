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
<script src="http://u1.linnk.it/qc8sbw/usr/apps/textsync/upload/jquery-mobile-touch.value.js " ></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet">
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
        $('#menubar').click(function(){
            $('#side-menu').toggle("slow");
        });
    });
</script> 
</layout:block>
</body>
</html>
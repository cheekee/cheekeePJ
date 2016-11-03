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
<script src="/resources/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
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
          <ul>
              <li><a href="#">Geustbook</a></li>
              <li><a href="#">Lab</a></li>
              <li><a href="#">Idea</a></li>
              <li><a href="#">Blog</a></li>
          </ul>
      </nav>
      <section>
          <!-- Introduction -->
          <div id="section-top">
              <img id="section-top-img" src="/resources/image/test.jpg">
          </div>
      </section>

  </layout:block>

  <layout:block name="contents">
  </layout:block>

  <layout:block name="footer">
      <footer>
          <!-- Footer -->
          copyright © 2016 <a href="https://github.com/cheekee" target="_blank">Cheekee</a>
      </footer>
  </layout:block>
  
  <layout:block name="scripts">
  </layout:block>
  
<layout:block name="default-script">
<script type="text/javascript">

</script> 
</layout:block>
</body>
</html>
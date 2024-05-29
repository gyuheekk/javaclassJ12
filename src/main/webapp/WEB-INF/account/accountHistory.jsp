<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>accountHistory.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
		body {
        margin: 0;
        padding: 0;
    }
   .container {
        position: relative; /* 자식의 absolute 위치 기준 */
        padding: 20px; /* div 안쪽에 여백 추가 */
    }
    .top-left-image {
        position: absolute;
        top: 10px;  /* 상단에서 10px 내려오도록 설정 */
        left: 10px;  /* 왼쪽에서 10px 떨어지도록 설정 */
        width: 200px;  /* 이미지 너비를 50px로 설정 */
        height: auto;  /* 이미지 비율을 유지하도록 설정 */
        margin-bottom: 30px;  /* 이미지 아래에 20px 여백 추가 */
    }
    .move-right {
    position: relative;
  }
	</style>
	<script>
		'use strict';
		
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<img id="img" src="${pageContext.request.contextPath}/images/1.png" class="top-left-image move-right">
  <form name="myform" method="post" action="AccountOk.acc">
        <h3>거래내역조회</h3>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>main.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file = "/include/bs4.jsp" %>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .container {
        text-align: center;
    }
  .box-container {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 20px;
      margin-bottom: 40px; /* footer와의 간격을 위해 추가 */
  }
  .box {
		  width: 300px; /* 네모의 너비를 더 크게 설정 */
      height: 400px; /* 네모의 높이를 더 크게 설정 */
      background-color: #f0f0f0;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 8px;
      transition: background-color 0.3s, transform 0.3s;
      text-decoration: none;
      color: black;
  }
  .box:hover {
      background-color: #dcdcdc;
      transform: translateY(-5px);
  }
   .container h4 {
      text-align: left; /* h4 요소를 왼쪽으로 정렬 */
      margin-left: 90px; /* 오른쪽으로 약간 이동 */
	}
	 body {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
} 
	
  </style>
</head>

<body>

<%@ include file = "/include/header.jsp" %>

<!-- 메뉴바(Nav) -->
<%@ include file = "/include/nav.jsp" %>

<div class="container">
	<h4>GH은행의 추천상품을 확인해보세요</h4>
		<div class="box-container">
	    <a href="#" class="box">상품 1</a>
	    <a href="#" class="box">상품 2</a>
	    <a href="#" class="box">상품 3</a>
		</div>
</div>

<%@ include file = "../../include/footer.jsp" %>
</body>
</html>

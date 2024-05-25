<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<style>
  body {
      font-family: Arial, sans-serif;
  }
  #header {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100px; /* 필요에 따라 높이 조정 */
      margin-bottom: 0;
      background-color: white;
  }
  .hnavbar {
      display: flex;
      justify-content: flex-end; /* 오른쪽 정렬 */
      align-items: center; /* 수직 방향 가운데 정렬 */
      background-color: white; /* 네비바 배경 색상 */
      padding: 0; /* 상하 여백 제거 */
      height: 50px; /* 높이 줄이기 */
  }
  .hnavbar a {
      color: black; /* 앵커 태그 글씨 색상 */
      text-align: center; /* 텍스트 가운데 정렬 */
      padding: 10px 15px; /* 여백 줄이기 */
      text-decoration: none; /* 밑줄 제거 */
      font-size: 15px; /* 글씨 크기 */
      height: 100%; /* 앵커 태그 높이 */
      display: flex;
      align-items: center; /* 앵커 태그 내부 텍스트 수직 가운데 정렬 */
  }
  .hnavbar a:hover {
      background-color: #ddd; /* 호버시 배경 색상 */
      color: black; /* 호버시 글씨 색상 */
      padding: 10px 15px; /* 호버 시 여백 줄이기 */
  }
</style>
</head>
<body>
    <div class="hnavbar">
        <c:if test="${empty sMid}"><a href="${ctp}/MemberLogin.mem">로그인</a>
        <a href="${ctp}/MemberJoin.mem">회원가입</a></c:if>
        <c:if test="${!empty sMid}"><a href="${ctp}/MemberLogout.mem">로그아웃</a></c:if>
    </div>
<div id="header" class="jumbotron text-center" style="margin-bottom:0; background-color: white;">
  <img src="${pageContext.request.contextPath}/images/1.png" class="centered-image">
</div>
<script>
	$(function() {
		$("#header").on("click",function(){
			location.href = "http://192.168.50.60:9090/javaclassJ12/Main";
		});
	});
</script>
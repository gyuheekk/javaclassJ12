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
  </style>
</head>

<%@ include file = "/include/header.jsp" %>

<!-- 메뉴바(Nav) -->
<%@ include file = "/include/nav.jsp" %>

<!-- 여기서부터 메인화면 만들기 -->

<div class="container">
	<h4>GH은행의 추천상품을 확인해보세요</h4>
		<div class="box-container">
	    <a href="#" class="box">상품 1</a>
	    <a href="#" class="box">상품 2</a>
	    <a href="#" class="box">상품 3</a>
		</div>
</div>

<!-- 메인화면 만들기 끝 -->

<%-- <div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h5 class="mb-4">로그인 중인 회원 : ${sName}</h5>
      <h6 class="text-right">최근 가입한 회원</h6>
      <div class="fakeimg">
      	<table class="table table-striped table-hover text-center">
      	  <tr class="thead-dark">
      	    <th>아이디</th>
      	    <th>성명</th>
      	    <th>지역</th>
      	  </tr>
	        <c:forEach var="vo" items="${recentVos}">
	          <tr>
	            <td>${vo.mid}</td>
	            <td>${vo.name}</td>
	            <td>${vo.address}</td>
	          </tr>
	        </c:forEach>
        </table>
      </div>
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      <h3>Some Links</h3>
      <p>Lorem ipsum dolor sit ame.</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class="fakeimg">
      	<c:forEach var="vo" items="${vos}">
      		${vo.idx} / ${vo.name}<br/>
      	</c:forEach>
      </div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      <br>
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div> --%>
<%@ include file = "../../include/footer.jsp" %>
</body>
</html>

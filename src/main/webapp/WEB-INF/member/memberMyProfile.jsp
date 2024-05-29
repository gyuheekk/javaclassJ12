<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMyProfile.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
<style>
  body {
    font-family: Arial, sans-serif;
  }
  .form-group label {
    font-weight: bold;
    color: #333333;
  }
  .form-control, .custom-select, .btn {
    border-radius: 5px;
  }
  .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
  }
  .btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
  }
  .input-group-text {
    background-color: #e9ecef;
  }
  .form-check-input:checked {
    background-color: #007bff;
    border-color: #007bff;
  }
  .mb-1, .mb-3, .mb-4 {
    margin-bottom: 1rem !important;
  }
  .mb-3 {
    margin-bottom: 1.5rem !important;
  }
  .mb-4 {
    margin-bottom: 2rem !important;
  }
  h3 {
    border: 2px solid black; /* 테두리 스타일, 두께, 색상 설정 */
    padding: 10px; /* 텍스트와 테두리 사이 여백 설정 */
    display: inline-block; /* h2 요소가 블록 요소처럼 동작하도록 설정 */
  }
</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
<h3>My Profile</h3>
  <form name="myform" method="post" action="${ctp}/MemberJoinOk.mem" class="was-validated">
    <br/>
    <div class="form-group">
      <label for="name">아이디 </label>
      <input type="text" class="form-control" value="${sMid}" disabled />
    </div>
    <div class="form-group">
      <label for="name">성명 </label>
      <input type="text" class="form-control" value="${sName}" disabled />
    </div>
    <div class="form-group">
      <label for="name">계좌번호 </label>
      <input type="text" class="form-control" value="${vo.accountNumber}" disabled />
    </div>
    <div class="form-group">
      <label for="email1">Email address</label>
        <div class="form-row">
        	<div class="col">
	          <input type="text" class="form-control" value="${vo.email}" disabled/>
        	</div>
        </div>
    </div>
    
    <div class="form-group">
      <label for="name">성별 </label>
      <input type="text" class="form-control" value="${vo.gender}" disabled />
    </div>
    <div class="form-group">
      <label for="birth">생년월일</label>
      <input type="date" value="${fn:substring(vo.birth, 0, 10)}" class="form-control" disabled/>
    </div>
     <div class="form-group">
      <label for="name">전화번호 </label>
      <input type="text" class="form-control" value="${vo.tel}" disabled />
    </div>
     <div class="form-group">
      <label for="name">직업 </label>
      <input type="text" class="form-control" value="${vo.job}" disabled />
    </div>
     <div class="form-group">
      <label for="name">주소 </label>
      <input type="text" class="form-control" value="${vo.address}" disabled />
    </div>
     <div class="form-group">
      <label for="name">회원등급 </label>
      <input type="text" class="form-control" value="${strLevel}" disabled />
    </div>
     <div class="form-group">
      <label for="name">메세지 허용여부 </label>
      <input type="text" class="form-control" value="${vo.message}" disabled />
    </div>
    
    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberMain.mem';">돌아가기</button>
    
    <input type="hidden" name="email" />
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
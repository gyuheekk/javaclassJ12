<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	// 로그인창에 아이디 체크 유무에 대한 처리
	// 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberLogin.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
<style>
  body{
  	margin: 0 auto;
    font-family: Arial, sans-serif;
  }
  .move-right {
    position: relative;
    right: -170px;
   /* -a(-값이 커질수록 오른쪽으로 이동) */
  }
</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">
  	<div class="text-center">
      <table class="table table-bordered" style="width:600px; margin:0 auto">
	      <tr>
		    	<td>
			      <input type="text" name="mid" value="admin" placeholder="아이디 입력" autofocus required class="form-control mt-3 mb-3"/>
			      <input type="password" name="pwd" value="1234" placeholder="비밀번호 입력" required class="form-control mb-3"/>
		    	</td>
		    	<td rowspan="2">
			      <button type="submit" class="btn btn-primary mt-2" style="width: 100%; height: 100px;">로그인</button>
		    	</td>
	  		</tr>
      </table>
    </div>
    <div class="text-center mt-3">
			<a href="${ctp}/MemberFindId.mem">아이디찾기</a> |
			<a href="#">비밀번호 재설정</a>
		</div>
    <div class="text-center mt-4 move-right">
		  아직 회원이 아니신가요?<a href="${ctp}/MemberJoin.mem"> 회원가입</a>
		</div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
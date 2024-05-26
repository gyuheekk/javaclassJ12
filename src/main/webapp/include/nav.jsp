<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<style>
	body {
    font-family: Arial, sans-serif;
}

.navbar {
    display: flex;
    justify-content: center; /* 수평 방향 중앙 정렬 */
    align-items: center; /* 수직 방향 가운데 정렬 */
    background-color: #eee; /* 네비바 배경 색상 */
    padding: 0; /* 상하 여백 제거 */
    height: 70px; /* 네비게이션 바 높이 */
}

.navbar a {
    color: black; /* 앵커 태그 글씨 색상 */
    text-align: center; /* 텍스트 가운데 정렬 */
    padding: 14px 20px; /* 여백 */
    text-decoration: none; /* 밑줄 제거 */
    font-size: 20px; /* 글씨 크기 */
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
}

.navbar a:hover {
    background-color: #ddd; /* 호버시 배경 색상 */
    color: black; /* 호버시 글씨 색상 */
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropbtn {
    background-color: inherit;
    color: black;
    padding: 14px 20px;
    font-size: 20px;
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
    height: 70px; /* 네비게이션 바 높이와 맞춤 */
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    font-size: 17px;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #ddd;
}
.dropbtn i.icon-spacing {
    margin-left: 8px; /* 글씨와 아이콘 사이의 여백 설정 */
}
</style>
<script>
	'use scrict';
	
	function notLogin() {
		alert("로그인이 필요한 서비스입니다.");
		location.href = "${ctp}/MemberLogin.mem";
	}
</script>
<div class="navbar">

	<a href="${empty sMid ? 'javascript:notLogin()' : '#'}">예금</a>
	<a href="${empty sMid ? 'javascript:notLogin()' : '#'}">출금</a>
	
	<div class="dropdown">
  	<button class="dropbtn">대출<i class="fa-solid fa-caret-down icon-spacing"></i></button>
    	<div class="dropdown-content">
		  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">대출 상품 소개</a>
		  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">대출 신청</a>
		  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">내 대출 확인</a>
      </div>
  	</div>
  	
	<div class="dropdown">
  	<button class="dropbtn">카드발급<i class="fa-solid fa-caret-down icon-spacing"></i></button>
    	<div class="dropdown-content">
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">카드 종류 소개</a>
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">카드 신청</a>
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">내 카드 확인</a>
      </div>
 	</div>
  
    <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">계좌관리</a>
    <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">게시판</a>
	
	<div class="dropdown">
  	<button class="dropbtn">마이페이지<i class="fa-solid fa-caret-down icon-spacing"></i></button>
    	<div class="dropdown-content">
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">내 프로필</a>
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '#'}">설정</a>
    	  <a href="${empty sMid ? 'javascript:notLogin()' : '${ctp}/MemberLogout.mem'}">로그아웃</a>
      </div>
    </div>
  
</div>

	<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="http://192.168.50.60:9090/javaclassJ12/Main">Home</a> -->
 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
      	<a class="nav-link" href="${ctp}/GuestList">Guest</a>
      </li>
      <c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="BoardList.bo">Board</a>
	      </li>
	    </c:if>
   	 	<c:if test="${level <= 4 && (level > 1 || level == 0)}">
	      <li class="nav-item">
	        <a class="nav-link" href="PdsList.pds">PDS</a>
	      </li>    
	      <li class="nav-item mr-2">
				  <div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">Study1</button>
				      <div class="dropdown-menu">
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex2_GuGuDan.jsp">구구단계산</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
				        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage연습</a>
				        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex1_Login.jsp">아이디저장연습</a>
				        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
				        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp?jumsu=85&code=K">JSTL연습</a>
				        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_Filter.jsp">Filter한글연습</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_Certification.jsp">인증코드발행(관리자)</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t03_init.jsp">초기값확인</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿 생명주기</a>
					      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스 연습</a>
				      </div>
				    </div>
	        </li>
         	<li class="nav-item mr-2">
			    <div class="dropdown">
			      <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">Study2</button>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호암호화</a>
				      <a class="dropdown-item" href="${ctp}/mapping/test1">디렉토리 매핑연습</a>
				      <a class="dropdown-item" href="${ctp}/mapping/test2.do">확장자 매핑연습</a>
				      <a class="dropdown-item" href="${ctp}/mapping/test3.do3">확장자 매핑연습3</a>
				      <a class="dropdown-item" href="${ctp}/mapping/test4.do4">확장자 매핑연습4</a>
				      <a class="dropdown-item" href="${ctp}/mapping/test5.do5">확장자 매핑연습5</a>
				      <a class="dropdown-item" href="${ctp}/ajaxTest1.st">AJAX연습(일반)</a>
				      <a class="dropdown-item" href="${ctp}/ajaxTest2.st">AJAX연습(응용)</a>
				      <a class="dropdown-item" href="${ctp}/ajaxTest3.st">AJAX연습(회원관리)</a>
				      <a class="dropdown-item" href="${ctp}/uuidForm.st">UUID연습</a>
				      <a class="dropdown-item" href="${ctp}/study/database/login.jsp">로그인연습</a>
				      <a class="dropdown-item" href="Modal1.st">모달연습1</a>
				      <a class="dropdown-item" href="Modal2.st">모달연습2</a>
				      <a class="dropdown-item" href="FileUpload.st">파일업로드</a>
			      </div>
			    </div>
	      </li>
      </c:if>
      <c:if test="${level <= 4}">
      	<li class="nav-item mr-2">
      		<div class="dropdown">
				 	   <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">MyPage</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="MemberMain.mem">회원메인방</a>
				      <c:if test="${level <= 4 && (level > 1 || level == 0)}">
					      <a class="dropdown-item" href="#">일정관리</a>
					      <a class="dropdown-item" href="#">메세지관리</a>
				      	<a class="dropdown-item" href="MemberList.mem">회원리스트</a>
				      </c:if>
				      <a class="dropdown-item" href="MemberPwdCheck.mem">회원정보수정</a>
				      <a class="dropdown-item" href="MemberDelete.mem">회원탈퇴</a>
				      <c:if test="${sLevel == 0}"><a class="dropdown-item" href="AdminMain.ad">관리자메뉴</a></c:if>
				    </div>
				  </div>
				 </li>
				</c:if>
      <li class="nav-item">                                                                                                                                                                                                                 
     		<c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/MemberLogout.mem">Logout</a></c:if>  
     		<c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberLogin.mem">Login</a></c:if>  
     	</li>  
     	<li class="nav-item">                                                                                                                                                                                                                
     		<c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberJoin.mem">Join</a></c:if>
     	</li>  
    </ul>
  </div>  
</nav>
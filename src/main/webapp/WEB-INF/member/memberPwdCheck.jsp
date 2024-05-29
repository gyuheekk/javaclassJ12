<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberPwdCheck.jsp</title>
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
    .btn-right {
        margin-left: 270px; /* 버튼을 오른쪽으로 20px 이동 */
        margin-top: 5px;
    }
  </style>
  <script>
    'use strict';
    
    $(function(){
    	$("#pwdDemo").hide();
    });
    
    function pwdReCheck() {
    	let pwd = $("#pwd").val().trim();
    	if(pwd == "") {
    		alert("현재 비밀번호를 입력하세요!");
    		$("#pwd").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "MemberPwdCheckAjax.mem",
    		type : "post",
    		data : {pwd : pwd},
    		success:function(res) {
    			if(res != "0") $("#pwdDemo").show();
    			else alert("비밀번호가 틀립니다. 확인해주세요");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    function pwdChangeCheck() {
    	let pwdCheck = $("#pwdCheck").val();
    	let pwdCheckRe = $("#pwdCheckRe").val();
    	
    	if(pwdCheck.trim() == "" || pwdCheckRe.trim() == "") {
    		alert("변경할 비밀번호를 입력하세요");
    		$("#pwdCheck").focus();
    		return false;
    	}
    	else if(pwdCheck.trim() != pwdCheckRe.trim()) {
    		alert("새로 입력한 비밀번호가 틀립니다. 확인하세요");
    		$("#pwdCheck").focus();
    		return false;
    	}
    	else {
    		pwdForm.submit();
    	}
    }
    
    $(function() {
		$("#img").on("click",function(){
			location.href = "http://192.168.50.60:9090/javaclassJ12/Main";
		});
	});
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
<img id="img" src="${pageContext.request.contextPath}/images/1.png" class="top-left-image move-right">
  <form name="myform" method="post" action="MemberPwdCheckOk.mem">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2">
          <h3>비밀번호 확인</h3>
          <div>(회원 정보 수정을 하기위해 현재 비밀번호를 확인합니다.)</div>
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" class="form-control" autofocus required /></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="비밀번호변경" onclick="pwdReCheck()" class="btn btn-secondary mr-2"/>
          <input type="submit" value="회원정보변경" class="btn btn-secondary mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-secondary mr-2"/>
          <input type="button" value="돌아가기" onclick="location.href='MemberMain.mem';" class="btn btn-secondary mr-2"/>
        </td>
      </tr>
    </table>
    <br/>
  </form>
  <div id="pwdDemo">
    <form name="pwdForm" method="post" action="MemberPwdChangeCheck.mem">
      <table>
        <tr>
          <td>변경할 비밀번호</td>
          <td><input type="password" name="pwdCheck" id="pwdCheck" class="form-control"/></td>
        </tr>
        <tr>
          <td>비밀번호 확인</td>
          <td><input type="password" name="pwdCheckRe" id="pwdCheckRe" class="form-control" /></td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type="button" value="비밀번호변경하기" onclick="pwdChangeCheck()" class="btn btn-secondary btn-right"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>accountTransfer.jsp</title>
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
   .form-control {
      display: inline-block;
  }
  .currency-input {
      display: flex;
      align-items: center;
  }
  .currency-input span {
    margin-left: 10px; /* 텍스트 박스와 "원" 사이의 간격 */
  }
	</style>
	<script>
		'use strict';
		
		$(function(){
			if('${param.accountFlag}'=='accountInput') $("#accountInputBtn").click();			
		});
		
		function depositCheck() {
			let money = $("#money").val().trim();
			let content = $("#content").val().trim();
			let accountNumber = $("#accountNumber").val();
			if(accountNumber == "") {
				alert("이체할 계좌번호를 입력하세요");
				$("#accountNumber").focus();
			}
			else if(money == "") {
				alert("이체할 금액을 입력하세요");
				$("#money").focus();
			}
			else if(content == "") {
				alert("적요를 입력하세요");
				$("#content").focus();
			}
			else {
				let ans = confirm("입력하신 금액 "+money+"원을 이체하시겠습니까?");
				if(ans) myform.submit();
			}
		}
		
		$(function() {
			$("#img").on("click",function(){
				location.href = "http://192.168.50.60:9090/javaclassJ12/Main";
			});
		});
		
		function accountInputCheck() {
			accountForm.submit();
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<img id="img" src="${pageContext.request.contextPath}/images/1.png" class="top-left-image move-right">
  <form name="myform" method="post" action="AccountOk.acc">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2">
          <h3>계좌이체</h3>
        </td>
      </tr>
      <tr>
        <th>거래자 성명</th>
        	<td class="currency-input">
        		<input type="text" name="name" id="name" value="${sName}" class="form-control" readonly />
      		</td>
      </tr>
      <!-- 이체할 계좌번호는 데이터베이스 안에있는 계좌번호에서만 가능(계좌번호 불러오는 콤보박스 만들기) -->
      <tr>
        <th>이체 할 계좌번호</th>
        	<td class="currency-input">
        	  <div class="input-group">
        			<input type="text" name="accountNumber" id="accountNumber" value="${param.accountNumber}" class="form-control" />
        			<div class="input-group-append">
        			  <a href="#" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">즐겨찾기 계좌 조회</a>
        			</div>
        		</div>
      		</td>
      </tr>
      
      <tr>
        <th>이체할 금액</th>
        	<td class="currency-input">
        		<input type="number" name="money" id="money" class="form-control" autofocus required/><span>원</span>
      		</td>
      </tr>
      <tr>
        <th>적요</th>
        	<td class="currency-input">
        		<input type="text" name="content" id="content" class="form-control" autofocus required/>
      		</td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="이전" onclick="location.href='MemberMain.mem';" class="btn btn-secondary mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-secondary mr-2"/>
          <input type="button" value="다음" onclick="depositCheck()" class="btn btn-secondary mr-2"/>
          <input type="button" value="계좌등록" id="accountInputBtn" class="btn btn-secondary mr-2" data-toggle="modal" data-target="#myModal2"/>
        </td>
      </tr>
    </table>
    <br/>
    <input type="hidden" name="mid" value="${sMid}"/>
    <input type="hidden" name="flagSw" value="E"/>
  </form>
</div>
<p><br/></p>
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">즐겨찾기 계좌 목록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <table class="table table-hover">
          	<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>계좌번호</th>
          	</tr>
          	<c:if test="${fn:length(vos) != 0}">
	          	<c:forEach var="vo" items="${vos}" varStatus="st">
	          		<tr>
	          			<td>${st.count}</td>
	          			<td><a href="AccountTransfer.acc?accountNumber=${vo.accountNumber}">${vo.youId}</a></td>
	          			<td><a href="AccountTransfer.acc?accountNumber=${vo.accountNumber}">${vo.accountNumber}</a></td>
	          		</tr>
	          	</c:forEach>
          	</c:if>
          	<c:if test="${fn:length(vos) == 0}">
          		<tr>
          			<td colspan="3" class="text-center">즐겨찾기 계좌가 없습니다.</td>
          		</tr>
          	</c:if>
          	<tr><td colspan="3" class="m-0 p-0"></td></tr>
          </table>
        </div>
        
        <!-- Modal footer -->
        <!-- <div class="modal-footer"> -->
          <div class="row">
            <div class="col text-left"><button type="button" onclick="location.href='AccountTransfer.acc?accountFlag=accountInput';" class="btn btn-secondary m-3" data-dismiss="modal">즐겨찾기계좌등록</button></div>
          	<div class="col text-right"><button type="button" class="btn btn-secondary m-3" data-dismiss="modal">Close</button></div>
          </div>
        <!-- </div> -->
        
      </div>
    </div>
  </div>
  
  <!-- The Modal2 -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <form name="accountForm" method="post" action="AccountInputOk.acc">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">즐겨찾기 계좌 등록</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <table class="table table-hover">
	          	<tr>
								<th>아이디</th>
								<td><input type="text" name="mid" class="form-control"/></td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td><input type="text" name="accountNumber" class="form-control"/></td>
	          	</tr>
	          </table>
	        </div>
	        
	        <!-- Modal footer -->
	        <!-- <div class="modal-footer"> -->
	          <div class="row">
	            <!-- <div class="col text-left"><button type="submit" class="btn btn-secondary m-3" data-dismiss="modal">계좌등록</button></div> -->
	            <div class="col text-left"><button type="button" onclick="accountInputCheck()" class="btn btn-secondary m-3" data-dismiss="modal">계좌등록</button></div>
	          	<div class="col text-right"><button type="button" class="btn btn-secondary m-3" data-dismiss="modal">Close</button></div>
	          </div>
	        <!-- </div> -->
        </form>
      </div>
    </div>
  </div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
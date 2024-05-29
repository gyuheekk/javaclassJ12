<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>accountFavorite.jsp</title>
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
		
		// 즐겨찾기 계좌 등록
		function favoriteAcc() {
			
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
  <form name="myform" method="post" action="#.acc">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2">
          <h3>즐겨찾는 계좌 등록</h3>
        </td>
      </tr>
      <tr>
        <th>등록할 계좌번호</th>
        	<td class="currency-input">
        		<input type="text" name="accountNumber" id="accountNumber" class="form-control" autofocus required/>
      		</td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <div class="row">
            <div class="col">
		          <input type="button" value="이전" onclick="location.href='AccountTransfer.acc';" class="btn btn-secondary mr-2"/>
		          <input type="reset" value="다시입력" class="btn btn-secondary mr-2"/>
	          </div>
            <div class="col text-right">
		          <input type="button" value="등록" onclick="favoriteAcc()" class="btn btn-secondary mr-2"/>
	          </div>
          </div>
        </td>
      </tr>
    </table>
    <br/>
    <input type="hidden" name="mid" value="${sMid}"/>
    <input type="hidden" name="flagSw" value="I"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
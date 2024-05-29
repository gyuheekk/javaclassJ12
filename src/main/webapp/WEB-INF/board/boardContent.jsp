<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>boardContent.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
	  .icon {
	    margin-right: 10px; /* 아이콘 간의 간격 */
	  }
	
	  .icon i {
	    font-size: 1.5em; /* 아이콘 크기 */
	  }
	  .top-left-image {
        position: absolute;
        top: 10px;  /* 상단에서 10px 내려오도록 설정 */
        left: 10px;  /* 왼쪽에서 10px 떨어지도록 설정 */
        width: 200px;  /* 이미지 너비를 50px로 설정 */
        height: auto;  /* 이미지 비율을 유지하도록 설정 */
    }
    .move-right {
    position: relative;
  }
   .icon-space {
            margin-right: 5px; /* 원하는 간격으로 조정 */
        }
  </style>
  <script>
    'use strict';
    
    function boardDelete() {
    	let ans = confirm("현재 게시글을 삭제 하시겠습니까?");
    	if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}";
    }
    
    // 댓글달기
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요");
    		return false;
    	}
    	let query = {
    			boardIdx 	: ${vo.idx},
    			mid				: '${sMid}',
    			content		: content
    	}
    	
    	$.ajax({
    		url  : "BoardReplyInput.bo",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else alert("댓글 입력 실패~~");
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
    }
    
    // 댓글 삭제하기
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url : "BoardReplyDelete.bo",
    		type : "post",
    		data : {idx : idx},
    		success : function(res) {
    			if(res != "0") {
    				alert("댓글이 삭제되었습니다.");
    				location.reload();
    			}
    			else alert("삭제 실패");
    		},
    		error : function() {
    			alert("전송 오류");
    		}
    	});
    }
    
    // 본인이 쓴 댓글이 아니면 경고 창 띄우기
    function limit() {
    	alert("본인이 쓴 댓글이 아니면 수정/삭제 할 수 없습니다.");
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
  <h1 class="text-center mb-4">GH BANK Board</h1>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.mid}</td>
    </tr>
    <tr>
    	<th>글쓴날짜</th>
      <td colspan="3">${fn:substring(vo.wDate, 0, 16)}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:200px">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
      <td colspan="4">
        <div class="row">
	        <div class="col">
	        	<c:if test="${empty flag}"><input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning" /></c:if>
	        	<c:if test="${!empty flag}"><input type="button" value="돌아가기" onclick="location.href='BoardSearchList.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-warning" /></c:if>
	        </div>
        </div>
      </td>
    </tr>
  </table>
  <hr/>
  <!-- 이전글/ 다음글 출력하기 -->
  <table class="table table-borderless">
    <tr>
      <td>
        <c:if test="${!empty nextVo.title}">
          <i class="fa-regular fa-square-caret-up icon-space"></i><a href="BoardContent.bo?idx=${nextVo.idx}">다음글 : ${nextVo.title}</a><br/>
        </c:if>
        <c:if test="${!empty preVo.title}">
        	<i class="fa-regular fa-square-caret-down icon-space"></i><a href="BoardContent.bo?idx=${preVo.idx}">이전글 : ${preVo.title}</a><br/>
        </c:if>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>

<!-- 댓글 처리(리스트/입력) -->
<div class="container">
	<!-- 댓글 리스트 보여주기 -->
	<table class="table table-hover text-center">
	  <tr>
	    <th>작성자</th>
	    <th>댓글내용</th>
	    <th>댓글일자</th>
    	<th>댓글수정/삭제</th>
	  </tr>
	  <c:forEach var="replyVo" items="${replyVos}" varStatus="st">
	    <tr>
	      <td>${replyVo.mid}</td>
	      <td class="text-left">${fn:replace(replyVo.content, newLine, "<br/>")}</td>
	      <td>${fn:substring(replyVo.wDate, 0, 10)}</td>
        <td>
       		<c:if test="${sMid == replyVo.mid || sLevel == 0}"> 
       			<a href="javascript:replyUpdate(${replyVo.idx})" class="icon"><i class="fa-solid fa-pen-to-square"></i></a>
       		</c:if>
       		<c:if test="${sMid != replyVo.mid && sLevel != 0}">
       			<a href="javascript:limit()" class="icon"><i class="fa-solid fa-comment-slash"></i></a>
       		</c:if>
       		<c:if test="${sMid == replyVo.mid || sLevel == 0}">
          	<a href="javascript:replyDelete(${replyVo.idx})" class="icon"><i class="fa-solid fa-trash"></i></a>
       		</c:if>
       		<c:if test="${sMid != replyVo.mid && sLevel != 0}"></c:if>
      	</td>
	    </tr>
	  </c:forEach>
	  <tr><td colspan="4" class='m-0 p-0'></td></tr>
	</table>
	
	<!-- 댓글 입력창 -->
	<form name="replyForm">
	  <table class="table table-center">
	    <tr>
	      <td style="width:85%" class="text-left">
	        글내용 :
	        <textarea rows="4" name="content" id="content" class="form-control"></textarea>
	      </td>
	      <td style="width:15%">
	        <br/>
	        <p>작성자 : ${sNickName}</p>
	        <p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
	      </td>
	    </tr>
	  </table>
	</form>
	<br/>
</div>
<!-- 댓글 처리 -->

<jsp:include page="/include/footer.jsp" />
</body>
</html>
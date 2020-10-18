<%@page import="com.kh.petever.reviewBoard.model.vo.ReviewAttach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review-board.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<style>
	tr[data-board-no] {
		cursor: pointer;
	}
	</style>
 <script>
$(function(){

	$("tr[data-board-no]").click(function(){
		var no = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no=" + no;
	});

	$("#search").on("change", function() {
		var $search = $("#search").val();
		var $query = $("#query");

		if($search == "rewBoContent")
			$query.attr("name", "rewBoContent");
		else
			$query.attr("name", "rewBoTitle");
	});
	
});


function searchFunc() {
	var formData = $("#searchFrm").serialize();
	//var formData = $("form[name=searchFrm]").serialize();
	console.log(formData);
	$.ajax({
		url: '${pageContext.request.contextPath}/reviewBoard/search.do',
		dataType: 'json',
		method: 'post',
		data: formData,
		success: function(data) {
			console.log(data);
			var $post = $('.post-wrap');	
			var html = '';
			html += '<tr><th>No</th><th>Title</th><th>UserId</th><th>Date</th><th>File</th></tr>';
			if(data.boardList == null || data.boardList.length == 0) {
				html += '<p align="center">조회된 게시물이 없습니다.</p>';		
			}
			else {
				console.log(data);
				//console.log(data.attachList);
				for(var i in data.boardList){
					var b = data.boardList[i];
					html += '<tr><td>'+ b.rewBoId +'</td>';
					html += '<td>'+ b.rewBoTitle +'</td>';
					html += '<td>'+ b.userId +'</td>';
					html += '<td>'+b.rewBoRegDate.substring(0, 10).replaceAll('-', '.')+'</td></tr>';
				}
				$table.html(html);
			}
			
		},
		error: function(xhr, status, err) {
			console.log("처리실패", xhr, status, err);
		}
	});
}
</script> 
	 <div id="main-wrap">
	        <section class="main">
	
	        </section>
	        <section class="content-wrap">            
	        <h1>입양후기 게시판</h1>
	        <p>동물을 입양한 사람들이 사진과 후기를 남기는 게시판입니다.</p>
	         <div class="content">
                <div class="border">
			
   <section id="board-container" class="container" align="center">
 	
 	<p>총 ${totalContents}건의 게시물이 있습니다.</p> 
    <li><a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoard.do">목록으로 보기</a></li>
    <li><a href="${pageContext.request.contextPath}/reviewBoard/reviewBoardPhoto.do">썸네일로 보기</a></li> 

  	 <hr style="height: 1px; border:none; background-color: lightgray; width: 1000px; margin: 30px 50px;">

	 <div class="post-wrap">
			<c:forEach items="${ list }" var="b">
				<div class="post">
	<a href="${ pageContext.request.contextPath }/reviewBoard/reviewBoardView.do?no=${b.rewBoId}">
                  <%--    <tr data-board-no="${ b.rewBoId }"> 	  --%>	
						<c:forEach items="${attachList}" var="a">
							  <c:if test="${ a.rewBoId.equals(b.rewBoId)}">
							     <img src="${pageContext.request.contextPath}/resources/editor/multiupload/${a.rewAtRenamedName}">
							  </c:if>
						</c:forEach>
	<!-- 조건 : 이미지가 없으면 지정한기본이미지 보여지게 하기
			if(a.rewAtRenamedName!=null){
							  }else{ <img src="${pageContext.request.contextPath}/기본이미지}"> -->							
						
			<br>
			<p> ${ b.rewBoTitle}</p>	
			<p>
		        <fmt:parseDate value="${b.rewBoRegDate}" var="regDate" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/>
					</p>		
						</tr>
					</a>
				</div>
				</tr>
			
			</c:forEach>
		</div>
				

</section> 
   
	                    <hr style="height: 1px; border:none; background-color: lightgray; width: 860px; margin: 35px 50px 10px 50px;">
	                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/reviewBoard/reviewBoardFrm'" class="write-btn">글쓰기</button>
	               <form id="searchFrm">
	                    <div class="search-wrap">
	                        <select name="search" id="search">
	                            <option value="rewBoTitle">제목</option>
	                            <option value="rewBoContent">내용</option>
	                        </select>
	                        <input type="text" name="rewBoTitle" id="query">
	                        <button type="button" id="bottom-search-btn" onclick="searchFunc();">검색</button>
		                </div>
                    </form>
					<div class="pageBar">
					${ pageBar }
					</div>
                </div>
            </div>
            
        </section>
    </div>
    
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
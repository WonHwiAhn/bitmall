<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin_member.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/paging.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	
	<script>
		var render = function(mode, vo){
			/* console.log(vo.length);
			console.log(vo);
			console.log(vo[0].id); */
			
			var auth;
			
			if(vo.auth == 5){
				auth = '회원';
			}else if(vo.auth == 1){
				auth = '관리자';
			}
			
			var html = 
					"<tr class='member-tr-second'>"+
					"<td class='member-td-first'>"+vo.id+"</td>"+
					"<td class='member-td-first'>"+vo.name+"</td>"+
					"<td class='member-td-first'>"+vo.telNo+"</td>"+
					"<td class='member-td-first'>"+vo.phoneNo+"</td>"+
					"<td class='member-td-second'>"+vo.email+"</td>"+
					"<td class='member-td-first'>"+auth+"</td>"+
					"<td class='member-td-first'>"+
					"<a href='${pageContext.servletContext.contextPath }/user/member_modify/"+vo.id+"'>수정</a>/"+
					"<a href='#' class='member-delete' id='"+vo.no+"'>삭제</a>"+
					"</td>"+
					"</tr>";
			// href을 #처리해놓으면 스크롤이 밑으로 내려갔을 때 맨 위로 올라가는 현상이 발생한다.
			// 그래서 #으로 걸어놨을 경우 맨위로 안가게 click이벤트에서 막아줘야된다.32번째줄 참고
			// 그럼에도 불구하고 href를 사용하는 이유는 의미상 사용하는 것
			
			if(mode==false){
				$(".member-table-second > tbody").prepend(html);
			}else{
				$('.member-table-second > tbody').append(html);
			}
			
			
			// --> 연관배열로 사용가능
			// $("#list-guestbook")[mode ? "prepend":"append"](html);
		}
		
		$(function(){
			// member-delete 버튼 클릭시
			$(document).on("click", ".member-delete", function(){
					event.preventDefault();
					
					var no = $(this)[0].id;
					console.log(no);
					var type = $('#searchType').val();
					var keyword = $('#keyword').val();
					
					var data = {
							"keyword":keyword,
							"searchType":type,
							"no" : no
					}
					
					$.ajax({
						url:"${pageContext.servletContext.contextPath}/api/admin/member_delete",
						type:"post",
						data:data,
						success:function(response){
							$('.member-table-second > tbody').empty();
							$.each(response.data.list, function(idx, val){
								render(true, val);
							});
							
							$('.member-count').html('회원수 : <font>' + response.data.count + '<font>');
						},
						error:function(){
							alert('failed');
						}
					}); // end ajax
			});
			// submit button 클릭시 submit 할려고 함.
			$('#submit-data').click(function(){
				var type = $('#searchType').val();
				var keyword = $('#keyword').val();
				var page = $('#page-value').val();
				
				console.log(type);
				console.log(keyword);
				
				var data = {
						"keyword":keyword,
						"searchType":type,
						"page":page
				};
				
				$.ajax({
					url:"/bitmall/api/admin/member_list",
					type:"post",
					dataType:"json",
					//contentType:"application/json",
					data:data,
					success:function(response){
						if(response.data != 'nodata'){
							console.log(response.data.length);
							// map 이용할 때 
							console.log(response.data.count);
							console.log(response.data.list[0]);
							
							$('.member-table-second > tbody').empty();
							//console.log('${test}');
							// map을 이용하지 않을 때 $.each(response.data, function(idx, val){
							$.each(response.data.list, function(idx, val){
								//console.log(val);
								render(true, val);
							});
							
							$('.member-count').html('회원수 : <font>' + response.data.count + '<font>');
							
						}
					},
					error:function(){
						alert('failed');
					}
				}); // end ajax
			});
		});
	</script>
</head>
<body>
	<input type="hidden" name="no" value="${authUser.no}">
	<br>
	<jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
	<hr>
	<table class="first-table">
		<!-- <form name="form1" method="get" action=""> -->
			<tr>
				<td class="member-count">회원수 : 
					<font>${count }</font>
				</td>
				<td class="member-space"></td>
				<td class="select-form">
					<select id="searchType" name="searchType" class="combo1">
							<option value="name">이름</option>
							<option value="id">아이디</option>
							<option value="ni">이름+아이디</option>
					</select>
					<input id="keyword" type="text" name="keyword" value="">
				</td>
				<td class="search-td">
					<input type="submit" id="submit-data" value="검색">
				</td>
			</tr>
			<!-- <tr>
				<td height="5" colspan="4"></td>
			</tr> -->
		<!-- </form> -->
	</table>
	<table class="member-table-second">
		<thead>
			<tr class="first">
				<td class="member-td-first">ID</td>
				<td class="member-td-first">이름</td>
				<td class="member-td-first">전화</td>
				<td class="member-td-first">핸드폰</td>
				<td class="member-td-second">E-Mail</td>
				<td class="member-td-first">회원구분</td>
				<td class="member-td-first">수정/삭제</td>
			</tr>
		</thead>

		
			<!-- <tr class="member-tr-second">
				<td class="member-td-first"> id1</td>
				<td class="member-td-first"> 홍길동</td>
				<td class="member-td-first"> 02 -123-1234</td>
				<td class="member-td-first"> 011-123-1234</td>
				<td class="member-td-second"> abcd@abcd.com</td>
				<td class="member-td-first">회원</td>
				<td class="member-td-first"><a href="#">수정</a>/ <a href="#">삭제</a>
				</td>
			</tr> -->
		
		<tbody>
			<c:forEach var="vo" items="${list }" varStatus="status">
	
				<tr bgcolor="#F2F2F2" height="23">
					<td width="100">${vo.id }</td>
					<td width="100">${vo.name }</td>
					<td width="100">${vo.telNo }</td>
					<td width="100">${vo.phoneNo }</td>
					<td width="200">${vo.email }</td>
					<c:if test="${vo.auth eq 1}">
						<td width="100" align="center">관리자</td>
					</c:if>
					<c:if test="${vo.auth eq 5}">
						<td width="100" align="center">회원</td>
					</c:if>
					<td width="100" align="center">
						<a href="${pageContext.servletContext.contextPath }/user/member_modify/${vo.id}">수정</a>/ 
						<a href="#" class="member-delete" id="${vo.no }">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<table class="last-table">
		<tr>
			<td class="cmfont">
				<!-- 페이지 값을 가지고 있는 hidden input 삽입 -->
				<input type="hidden" id="page-value" value="0">
				<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif"> 
				<font class="on">1</font>&nbsp;
				<a href="product.jsp?page=2&sel1=&sel2=&sel3=&sel4=&text1="><font class="off">[2]</font></a>&nbsp;
				<a href="product.jsp?page=3&sel1=&sel2=&sel3=&sel4=&text1="><font class="off">[3]</font></a>&nbsp;
				<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif">
			</td>
		</tr>
	</table>
</body>
</html>
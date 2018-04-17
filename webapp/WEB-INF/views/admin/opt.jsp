<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin_option.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	
	<script>
	$(function(){
		
		
		/* $(document).on("click", ".delete-option", function(){
			
		}); */
		
		var render = function(idx, vo){
			var html = 
				"<tr bgcolor='#F2F2F2' height='20'>"+
				"<td class='second-td-1'>"+idx+
				"</td>"+
				"<td class='second-td-2'>"+vo.name +"</td>"+
				"<td class='second-td-3'>"+
				"<a href='opt_edit?no="+vo.no+"'>수정</a>/"+
				"<a href='#' class='delete-option' id="+vo.no+">삭제</a>"+
				"</td>"+
				"<td class='second-td-3'><a href='${pageContext.servletContext.contextPath }/admin/opts?no="+vo.no+"'>소옵션편집</a></td>"+
				"</tr>";
				
				$('.opt-table-second > tbody').append(html);
		}
		
		$(document).on("click", ".delete-option", function(){
		//$('.delete-option').click(function(){
			//event.preventDefault();
			console.log($(this)[0].id);
			var no = $(this)[0].id;
			console.log(no);
			var data = {
					"no" : no
			}
			
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/api/admin/opt_delete",
				type:"post",
				data:data,
				success:function(response){
					$('.opt-table-second > tbody').empty();
					$.each(response.data, function(idx, val){
						//console.log(val);
						render(idx, val);
					});
					
				},
				error:function(){
					alert('소옵션이 존재하여 삭제가 불가능합니다.');
				}
				}); // end ajax
 			});
		//});
	});
		
	</script>
</head>
<body>
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr>
<table class="opt-table-first">
	<tr>
		<td class="first-td-1"> 옵션수 :
			<font>${totalCount}</font>
		</td>
		<td class="first-td-2">
			<a href="${pageContext.servletContext.contextPath }/admin/opt_new"><input type="button" value="신규입력"></a> &nbsp
		</td>
	</tr>
	<tr><td height="1" colspan="2"></td></tr>
</table>

<table class="opt-table-second">
	<thead>
		<tr class="second-th-1"> 
			<td class="second-td-1"><font>번호</font></td>
			<td class="second-td-2"><font>옵션명</font></td>
			<td class="second-td-3"><font>수정/삭제</font></td>
			<td class="second-td-3"><font>소옵션편집</font></td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" begin="0" step="1" var="vo" varStatus="status">
			<tr bgcolor="#F2F2F2" height="20">	
				<td class="second-td-1">
					${status.index}
				</td>
				<td class="second-td-2">${vo.name }</td>
				<td class="second-td-3">
					<a href="opt_edit?no=${vo.no }">수정</a>/
					<a href="#" class="delete-option" id="${vo.no}">삭제</a>
				</td>
				<td class="second-td-3"><a href="${pageContext.servletContext.contextPath }/admin/opts?no=${vo.no }">소옵션편집</a></td>
			</tr>
		</c:forEach>
	</tbody>
	<!-- <tr bgcolor="#F2F2F2" height="20">
		<td width="50"  align="center">2</td>
		<td width="200" align="left">색상</td>
		<td width="100" align="center">
			<a href="opt_edit.jsp?no1=2">수정</a>/
			<a href="#">삭제</a>
		</td>
		<td width="100"  align="center"><a href="opts.jsp?no1=2">소옵션편집</a></td>
	</tr> -->
</table>
<br>
<%-- <jsp:include page="/WEB-INF/views/include/paging.jsp"/> --%>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	
	<script>
	$(function(){
		
		
		/* $(document).on("click", ".delete-option", function(){
			
		}); */
		
		var render = function(idx, vo){
			var html = 
					"<tr bgcolor='#F2F2F2' height='20'>"+
					"<td width='100' align='center'>"+vo.no+"</td>"+
					"<td width='200' align='left'>"+vo.name+"</td>"+
					"<td width='200' align='center'>"+vo.optionNo+"</td>"+
					"<td width='100' align='center'>"+
					"<a href='${pageContext.servletContext.contextPath }/admin/opts_edit?optionNo="+vo.optionNo+"&no="+vo.no+"'>수정</a>/"+
					"<a href='#' class='delete-smalloption' id='"+vo.no+"'>삭제</a>"+
					"</td>"+
					"</tr>";
				
				$('.opts-table-second > tbody').append(html);
		}
		
		$(document).on("click", ".delete-smalloption", function(){
			console.log($(this)[0].id);
			var no = $(this)[0].id;
			console.log(no);
			var data = {
					"no" : no
			}
			
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/api/admin/opts_delete",
				type:"post",
				data:data,
				success:function(response){
					$('.opts-table-second > tbody').empty();
					$.each(response.data, function(idx, val){
						//console.log(val);
						render(idx, val);
					});
					
				},
				error:function(){
					alert('failed');
				}
			}); // end ajax
		});
		});
	//});
	
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table align="center" width="450" border="0" cellspacing="0" cellpadding="0">
	<tr height="50">
		<td align="left"  width="300" valign="bottom"><font color="#0457A2"></font></td>
		<td align="right" width="200" valign="bottom">
			<a href="${pageContext.servletContext.contextPath }/admin/opts_new?optionNo=${no}"><input type="button" value="신규입력" id="add-smalloption"></a> &nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="2"></td></tr>
</table>

<table align="center" class="opts-table-second" width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<thead>
		<tr bgcolor="#CCCCCC" height="20"> 
			<td width="100" align="center"><font color="#142712">소옵션번호</font></td>
			<td width="200" align="center"><font color="#142712">소옵션명</font></td>
			<td width="200" align="center"><font color="#142712">옵션번호</font></td>
			<td width="100" align="center"><font color="#142712">수정/삭제</font></td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" begin="0" step="1" var="vo" varStatus="status">
			<tr bgcolor="#F2F2F2" height="20">	
				<td width="100" align="center">${vo.no }</td>
				<td width="200" align="left">${vo.name }</td>
				<td width="200" align="center">${vo.optionNo }</td>
				<td width="100" align="center">
					<a href="${pageContext.servletContext.contextPath }/admin/opts_edit?optionNo=${vo.optionNo}&no=${vo.no}">수정</a>/
					<a href="#" class="delete-smalloption" id="${vo.no}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>
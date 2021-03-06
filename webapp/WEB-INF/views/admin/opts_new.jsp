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
			$('#form1').submit(function(){
				var name = $('#smalloption-name').val();
				var no = '${no}';
				var data = {
								"name":name,
								"optionNo": no
							};
				console.log(no);
				
				// 옵션 등록하기
				$.ajax({
					url:"${pageContext.servletContext.contextPath}/api/admin/addSmallOption",
					type:"post",
					data:data,
					//contentType:"application/json",
					success:function(response){
						
						if(response.data != 'not exist'){
							alert('데이터 추가 성공');
							window.location.replace('/bitmall/admin/opts?no=${no}');
						}
					},
					error:function(){
						alert('error');
					}
					
				}); // end ajax
			});
		});
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form id="form1" name="form1" method="post">

<table align="center" width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">옵션번호</font>
		</td>
	
		<td width="400" height="20"  bgcolor="#F2F2F2">
			${no }
		</td>
	</tr>
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">새 옵션명</font>
		</td>
	
		<td width="400" height="20"  bgcolor="#F2F2F2">
			<input type="text" id="smalloption-name" name="name" size="20" maxlength="20">
		</td>
	</tr>
</table>
<br>
<table align="center" width="500" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="등 록 하 기"> &nbsp;&nbsp
			<a href="opt.jsp"><input type="button" value="이 전 화 면"></a>
		</td>
	</tr>
</table>

</form>
</body>
</html>

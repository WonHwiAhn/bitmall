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
			$('#backbutton').click(function(){
				//window.location.replace('${pageContext.request.contextPath }/admin/opt');
				 event.preventDefault();
				 history.back(1);
			});
		});
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form name="form1" method="post" action="${pageContext.servletContext.contextPath}/admin/opt_update?no=${vo.no}">
<table align="center" width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">옵션번호</font>
		</td>
		<td width="400" height="20"  bgcolor="#F2F2F2">${vo.no }</td>
	</tr>
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">옵션명</font>
		</td>
		<td width="400" height="20"  bgcolor="#F2F2F2">
			<input value=${vo.name } type="text" name="name" value="사이즈" size="20" maxlength="20">
		</td>
	</tr>
</table>
<br>
<table align="center" width="500" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="수 정 하 기"> &nbsp;&nbsp
			<a href="opt.jsp"><input id="backbutton" type="button" value="이 전 화 면"></a>
		</td>
	</tr>
</table>

</form>
</body>
</html>

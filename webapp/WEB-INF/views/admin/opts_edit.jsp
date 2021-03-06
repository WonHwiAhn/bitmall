<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form name="form1" method="post" action="${pageContext.servletContext.contextPath }/admin/opts_update">
<!-- <input type="hidden" name="optionNo" value="1">
<input type="hidden" name="no" value="1"> -->

<table align="center" width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">소옵션번호</font>
		</td>
		<td width="400" height="20"  bgcolor="#F2F2F2">
			${vo.no}
			<input type="hidden" name="no" value="${vo.no }">
			<input type="hidden" name="optionNo" value="${vo.optionNo }">
		</td>
	</tr>
	<tr> 
		<td width="100" height="20" bgcolor="#CCCCCC" align="center">
			<font color="#142712">소옵션명</font>
		</td>
		<td width="400" height="20"  bgcolor="#F2F2F2">
			<input type="text" name="name" size="20" maxlength="20" value="${vo.name }">
		</td>
	</tr>
</table>
<br>
<table align="center" width="500" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="수 정 하 기"> &nbsp;&nbsp
			<a href="/bitmall/admin/opts"><input type="button" value="이 전 화 면"></a>
		</td>
	</tr>
</table>

</form>
</body>
</html>

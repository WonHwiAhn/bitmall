<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin_faq.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table class="faq-table-first">
	<tr>
		<td class="first-td-1">&nbsp 자료수 : <font color="#FF0000">2</font></td>
		<td class="first-td-2">
			<a href="faq_new.jsp"><input type="button" value="신규입력"></a> &nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="2"></td></tr>
</table>

<table class="faq-table-second">
	<tr class="second-th-1"> 
		<td class="second-td-1"><font>번호</font></td>
		<td class="second-td-2"><font>제목</font></td>
		<td class="second-td-3"><font>수정/삭제</font></td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td class="second-td-1">1</td>
		<td class="second-td-2">자주질문1</td>
		<td class="second-td-3">
			<a href="faq_edit.jsp?no=1">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
	<!-- <tr bgcolor="#F2F2F2" height="20">	
		<td width="50"  align="center">2</td>
		<td width="450" align="left">자주질문2</td>
		<td width="100" align="center">
			<a href="faq_edit.jsp?no=2">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr> -->
</table>
<br>
<jsp:include page="/WEB-INF/views/include/paging.jsp"/>
</body>
</html>
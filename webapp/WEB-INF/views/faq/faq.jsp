<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/search.jsp"/>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/faq_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/faq_title1.gif" border="0"></td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr><td colspan="2" height="3" bgcolor="#FFCC00"></td></tr>
				<tr bgcolor="#FFF5D0" >
					<td width="90" height="25" align="center">번호</td>
					<td align="center">제목</td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">1</font></td>	
					<td><a href="faq_read.jsp?no=1"><font color="#686868">자주 하는 질문 1</font></a></td>	
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">2</font></td>	
					<td><a href="faq_read.jsp?no=1"><font color="#686868">자주 하는 질문 2</font></a></td>	
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"></td>	
					<td></td>	
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"></td>	
					<td></td>	
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"></td>	
					<td></td>	
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"></td>	
					<td></td>	
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="4"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"></td>	
					<td></td>	
				</tr>

				<tr><td colspan="2" height="2" bgcolor="#FFCC00"></td></tr>
			</table>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
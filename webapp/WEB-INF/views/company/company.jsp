<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/help_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/company_title1.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="15" cellspacing="4" width="690" bgcolor="D0D8DF">
				<tr>
					<td bgcolor="white">
						<table border="0" cellpadding="0" cellspacing="0" width="652">
							<tr>
								<td width="652" valign="top"  style="line-height:19px;">

									&nbsp;&nbsp;비트닷컴은 아주 오래전부터 현재의 비트닷컴 까지 수년여의 오랜 전통과 역사를 가지고 소비자분들의 격려와 믿음을 바탕으로 성장해온 전문 쇼핑몰 입니다.<br><br><br>
									...
									<br><br><br>
									편안한 쇼핑시간이 되시기를...<br><br><br>
									감사합니다.<br>

								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br><br>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/company_title2.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="15" cellspacing="4" width="690" bgcolor="D0D8DF">
				<tr>
					<td bgcolor="white">
						<table border="0" cellpadding="0" cellspacing="0" width="652">
							<tr>
								<td width="652" valign="top"  style="line-height:19px;">
									<img src="${pageContext.servletContext.contextPath }/assets/images/company_image1.gif" border="0">
								</td>
							</tr>
						</table>
					</td>
				</tr>
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
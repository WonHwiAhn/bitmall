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
			    <td height="30" align="center"><p><img src="${pageContext.servletContext.contextPath }/assets/images/search_title.gif" width="746" height="30" border="0" /></p></td>
			  </tr>
			  <tr><td height="13"></td></tr>
			</table>

			<table width="730" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" valign="middle" colspan="3" height="5">
						<table border="0" cellpadding="0" cellspacing="0" width="690">
							<tr><td class="cmfont"><img src="${pageContext.servletContext.contextPath }/assets/images/search_title1.gif" border="0"></td></tr>
      			  <tr><td height="10"></td></tr>
			      </table>
					</td>
				</tr>
				<tr>
					<td width="730" align="center" valign="top" bgcolor="#FFFFFF"> 

        
						<table width="686" border="0" cellpadding=0 cellspacing=0 class="cmfont">
							<tr bgcolor="8B9CBF"><td height="3" colspan="5"></td></tr>
							<tr height="29" bgcolor="EEEEEE"> 
								<td width="80"  align="center">그림</td>
								<td align="center">상품명</td>
								<td width="100" align="center">가격</td>
								<td width="70"  align="center">바구니</td>
							</tr>
							<tr bgcolor="8B9CBF"><td height="1" colspan="5"  bgcolor="AAAAAA"></td></tr>

							<tr height="70">
								<td width="80" align="center" valign="middle">
									<a href="product_detail.jsp?no=110509"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="60" height="60" border="0"></a>
								</td>
								<td align="left" valign="middle">
									<a href="product_detail.jsp?no=110509"><font color="#4186C7"><b>제품명1</b></font></a><br>
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> 
								</td>
								<td width="100" align="center" valign="middle">72,000원</td>
								<td width="70" align="center" valign="middle">
									<a href="cart_insert.jsp?no=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/i_cart.gif" border="0"></a>
								</td>
							</tr>
							<tr><td align="center" valign="middle" colspan="5" height="1" background="${pageContext.servletContext.contextPath }/assets/images/ln1.gif"></td></tr>

							<tr height="70">
								<td width="80" align="center" valign="middle">
									<a href="product_detail.jsp?no=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="60" height="60" border="0"></a>
								</td>
								<td align="left" valign="middle">
									<a href="product_detail.jsp?no=0000"><font color="#4186C7"><b>제품명2</b></font></a><br>
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> 
								</td>
								<td width="100" align="center" valign="middle">99,000원</td>
								<td width="70" align="center" valign="middle">
									<a href="cart_insert.jsp?no=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/i_cart.gif" border="0"></a>
								</td>
							</tr>
							<tr><td align="center" valign="middle" colspan="5" height="1" background="${pageContext.servletContext.contextPath }/assets/images/ln1.gif"></td></tr>

							<tr height="70">
								<td width="80" align="center" valign="middle">
									<a href="product_detail.jsp?no=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="60" height="60" border="0"></a>
								</td>
								<td align="left" valign="middle">
									<a href="product_detail.jsp?no=0000"><font color="#4186C7"><b>제품명3</b></font></a><br>
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">20%</font>
								</td>
								<td width="100" align="center" valign="middle">62,400원</td>
								<td width="70" align="center" valign="middle">
									<a href="cart_insert.jsp?no=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/i_cart.gif" border="0"></a>
								</td>
							</tr>

							<tr bgcolor="8B9CBF"><td height="3" colspan="5"></td></tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="30" class="cmfont" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_prev.gif" align="absmiddle" border="0"> 
						<font color="#FC0504"><b>1</b></font>&nbsp;
						<a href="product_search.jsp?page=2"><font color="#7C7A77">[2]</font></a>&nbsp;
						<a href="product_search.jsp?page=3"><font color="#7C7A77">[3]</font></a>&nbsp;
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_next.gif" align="absmiddle" border="0">
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
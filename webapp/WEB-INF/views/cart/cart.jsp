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
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0"></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="420" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="80"  align="center">가격</td>
					<td width="90"  align="center">합계</td>
					<td width="50"  align="center">삭제</td>
				</tr>
				<c:forEach items="${dto}" var="vo" varStatus="status">
					<tr>
						<form name="form2" method="post" action="">
						<td height="60" align="center" bgcolor="#FFFFFF">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="60">
										<a href="product_detail.jsp?product_num=0000"><img src="${pageContext.servletContext.contextPath }${vo.src}" width="50" height="50" border="0"></a>
									</td>
									<td class="cmfont">
										<a href="product_detail.jsp?product_num=0000">${vo.name }</a><br>
										<font color="#0066CC">[옵션사항]</font>
										<c:forEach items="${map}" var="map" varStatus="status">
											<c:if test="${map.key eq vo.no}">
												<c:if test="${map.value eq '0' }">
													선택한 옵션이 없습니다.
												</c:if>
												<c:if test="${map.value ne '0' }">
													${map.value}
												</c:if>
												
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
						</td>
						<td align="center" bgcolor="#FFFFFF">
							<input type="text" name="num1" size="3" value="${vo.count }" class="cmfont1">&nbsp<font color="#464646">개</font>
						</td>
						<td align="center" bgcolor="#FFFFFF"><font color="#464646">${vo.price }원</font></td>
						<td align="center" bgcolor="#FFFFFF"><font color="#464646">${vo.totalCount }원</font></td>
						<td align="center" bgcolor="#FFFFFF">
							<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
							<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
						</td>
						</form>
					</tr>
				</c:forEach>
				<%-- <tr>
					<form name="form2" method="post" action="">
					<td height="60" align="center" bgcolor="#FFFFFF">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="product_detail.jsp?product_num=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="product_detail.jsp?product_num=0000">제품명2</a><br>
									<font color="#0066CC">[옵션사항]</font> 옵션2
								</td>
							</tr>
						</table>
					</td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="text" name="num2" size="3" value="1" class="cmfont1">&nbsp<font color="#464646">개</font>
					</td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">60,000</font></td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">60,000</font></td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
						<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
					</td>
					</form>
				</tr>
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(132,000원) + 배송료(2,500원) = <font color="#FF3333"><b>134,500원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr> --%>
			</table>
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="44">
					<td width="710" align="center" valign="middle">
						<a href="${pageContext.servletContext.contextPath }/"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0"></a>&nbsp;&nbsp;
						<c:if test="${dtoSize ne 0 }">
						<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0"></a>&nbsp;&nbsp;
							<a href="${pageContext.servletContext.contextPath}/order/now"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></a>
						</c:if>
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
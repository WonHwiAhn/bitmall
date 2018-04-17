<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/index.css" rel="stylesheet" type="text/css">
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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<!---- 화면 우측(신상품) 시작 -------------------------------------------------->	
			<table width="767" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="60">
						<img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
					</td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0">
				<c:forEach begin="0" step="1" end="2" varStatus="status">
					<tr>
						<c:forEach begin="0" step="1" end="4" varStatus="innerStatus">
						<c:set value="${ status.index*5 + innerStatus.index}" var="index" />
						<c:if test="${list[index].no ne null }">
						<td width="150" height="205" align="center" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
								<tr> 
									<td align="center">
										<c:if test="${list[index].no eq imageList[index].goodsNo }">
											<div class="container">
											<a href="${pageContext.servletContext.contextPath }/product/product_detail?no=${list[index].no}">
													<img src="${pageContext.servletContext.contextPath }${imageList[index].src}" class="image" width="120" height="140" border="0">
											
											<div class="middle">
										    	<div class="text">상세보기</div>
										  	</div>
										  	</a>
											</div>
										</c:if>
									</td>
								</tr>
								<tr><td height="5"></td></tr>
								<tr> 
									<td height="20" align="center">
										<a href="product_detail.jsp?no=1"><font color="444444">${list[index].name }</font></a>&nbsp; 
										<%-- <img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> --%>
										<c:forEach items="${iconList}" var="icon">
											<c:forTokens items="${list[index].iconData }" delims="-" var="item">
											    <c:if test="${item eq icon.no}">
											    	<%-- ${icon.name } --%>
											    	<img src="${pageContext.servletContext.contextPath}/${icon.src}" align="absmiddle" vspace="1">
											    	<%-- <c:if test="${icon.no eq 3 }">(${vo.discount }%)</c:if> --%>
											    </c:if>
											</c:forTokens>
										</c:forEach> 
									</td>
								</tr>
								<tr><td height="20" align="center"><b>${list[index].price } 원</b></td></tr>
							</table>
						</td>
						</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
				<!---1번째 줄-->
				<%-- <tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=1"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> 
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">20%</font>
								</td>
							</tr>
							<tr><td height="20" align="center"><strike>89,000 원</strike><br><b>70,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

				</tr>
				<tr><td height="10"></td></tr>
				<!---2번째 줄-->
				<tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
				<!---3번째 줄-->
				<tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
				</tr> --%>
				<tr><td height="10"></td></tr>
			</table>

			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
&nbsp

</body>
</html>
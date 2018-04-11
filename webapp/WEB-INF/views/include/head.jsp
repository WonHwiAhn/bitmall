<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
		<td>
			<!--  상단 왼쪽 로고  -------------------------------------------->
			<table border="0" cellspacing="0" cellpadding="0" width="182">
				<tr>
					<td>
						<a href="/ad" onclick="<input type='hidden' name='no' value='${authUser.no }'>" title="no" id="no" >
						<input type="hidden" name="no" value="${authUser.no }">
						<img src="${pageContext.servletContext.contextPath }/assets/images/top_logo.gif" width="182" height="40" border="0">
						</a>
					</td>
				</tr>
			</table>
		</td>
		<td align="right" valign="bottom">
			<!--  상단메뉴 시작 (main_topmemnu.jsp) : Home/로그인/회원가입/장바구니/주문배송조회/즐겨찾기추가  ---->	
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
	<c:choose>		
		<c:when test="${empty authUser }">
			<td><a href="${pageContext.servletContext.contextPath }/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/user/member_login"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/user/member_agree"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand"></td>
		</c:when>
		
		<c:otherwise>
			<td><a href="${pageContext.servletContext.contextPath }/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 로그아웃 -->
			<td><a href="${pageContext.servletContext.contextPath }/user/member_logout"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 회원정보수정 -->
			<td><a href="${pageContext.servletContext.contextPath }/user/member_modify/${authUser.no }"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand"></td>

		</c:otherwise>
	</c:choose>	
				</tr>
				
				
			</table>
			<!--  상단메뉴 끝 (main_topmemnu.php)  ---------->	
		</td>
	</tr>
</table>

<!--  상단 메인 이미지 --------------------------------------------------->
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image0.jpg" width="182" height="175"></td>
	  <td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image1.jpg" width="777" height="175"></td>
	</tr>
</table>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath }/assets/css/search.css" rel="stylesheet" type="text/css">
<table class="search-first-table">
	<tr><td class="search-first-td"colspan="5"></td></tr>
	<tr class="search-second-tr">
		<td class="search-second-td" >
			<c:if test="${authUser ne null }">
				<font>&nbsp; <b>Welcome ! &nbsp;&nbsp; ${authUser.name}님 아이유 월드에 오신것을 환영합니다!</b></font>
			</c:if>
		</td>
		<td class="search-third-td"></td>
		<td class="search-fourth-td"><b>상품검색 ▶&nbsp;</b></td>
		<!-- form1 시작 -->
		<form name="form1" method="get" action="product_search.jsp">
		<td class="search-fifth-td">
				<input type="text" name="findtext" maxlength="40" class="cmfont1">
		</td>
		<td class="search-sixth-td"><input type="image" src="${pageContext.servletContext.contextPath }/assets/images/i_search1.gif"></td>
		</form>
		<!-- form1 끝 -->
	</tr>
	<tr><td class="search-seventh-td" colspan="5"></td></tr>
</table>
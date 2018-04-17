<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin_product.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr>
<form name="form1" method="get" action="">
<table class="top-table">
	<tr class="first">
		<td class="product-count"> 제품수 : <font>${count }</font></td>
		<td class="option">
			<select name="sel1">
				<option value="0" >상품상태</option>
				<option value="1" >판매중</option>
				<option value="2" >판매중지</option>
				<option value="3" >품절</option>
			</select> 
			<select name="sel2">
				<option value="0" >아이콘선택</option>
				<option value="1" >New</option>
				<option value="2" >Hit</option>
				<option value="3" >Sale</option>
			</select> 
			<select name="sel3">
				<option value="0" >분류선택</option>
				<option value="1" >바지</option>
				<option value="2" >코트</option>
				<option value="3" >브라우스</option>
			</select>
			<select name="sel4">
				<option value="1" selected>제품이름</option>
				<option value="2" >제품번호</option>
			</select>
			<input class="search" type="text" name="text1" value="">
		</td>
		<td class="search-from">
			<input class="search-button" type="submit" value="검색">
			&nbsp;
			<a href="${pageContext.servletContext.contextPath }/admin/product_new"><input class="newproduct-button" type="button" value="새상품"></a>
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form>

<table class="middle-table">
	<tr class="first"> 
		<td class="category">제품분류</td>
		<td class="category-code">제품코드</td>
		<td class="product-name">제품명</td>
		<td class="product-price">판매가</td>
		<td class="product-status">상태</td>
		<td class="product-event">이벤트</td>
		<td class="product-modify">수정/삭제</td>
	</tr>
	
	<c:forEach items="${list}" begin="0" step="1" var="vo" varStatus="status">
		<tr class="second">	
			<c:forEach items="${categoryList}" var="category">
				<c:if test="${category.no eq vo.categoryNo }">
					<td class="category">${category.name }</td>
					<td class="category-code">${category.no }</td>
				</c:if>
			</c:forEach>
			<td class="product-name">${vo.name}</td>	
			<td class="product-price-content">${vo.price }</td>	
			<c:if test="${vo.status eq 1}">
				<td class="product-status">판매중</td>
			</c:if>
			<c:if test="${vo.status == 2}">
				<td class="product-status">판매중지</td>
			</c:if>
			<c:if test="${vo.status == 3}">
				<td class="product-status">품절</td>
			</c:if>
			<td>
			<c:forEach items="${iconList}" var="icon">
				<c:forTokens items="${vo.iconData }" delims="-" var="item">
				    <c:if test="${item eq icon.no}">
				    	<%-- ${icon.name } --%>
				    	<img src="${pageContext.servletContext.contextPath}/${icon.src}">
				    	<c:if test="${icon.no eq 3 }">(${vo.discount }%)</c:if>
				    </c:if>
				</c:forTokens>
			</c:forEach>
			</td>
			<%-- <td class="product-event">New Hit Sale(${vo.discount}%)</td>	 --%>
			<td class="product-modify">
				<a href="product_edit.jsp">수정</a>/
				<a href="#">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>

<br>
	<jsp:include page="/WEB-INF/views/include/paging.jsp"/>
</body>
</html>
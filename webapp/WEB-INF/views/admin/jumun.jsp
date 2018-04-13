<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin_jumun.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br>
	<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
	<hr>
	<form name="form1" method="get" action="">
	<table class="jumun-table-first">
		<tr height="40">
			<td class="first-td-1">주문수 : 
				<font>20</font>
			</td>
			<td class="first-td-2">
				기간 : 
				<input class="first-input-1" type="text" name="day1_y" value="">
				<select name="day1_m">
					<option value="01" selected>1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="day1_d">
					<option value="01" selected>1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select> - 
				<input class="first-input-1" type="text" name="day2_y" value="">
				<select name="day2_m">
					<option value="01" selected>1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="day2_d">
					<option value="01" selected>1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select> &nbsp
				<select name="sel1">
					<option value="0" selected>전체</option>
					<option value="1">주문신청</option>
					<option value="2">주문확인</option>
					<option value="3">입금확인</option>
					<option value="4">배달중</option>
					<option value="5">주문완료</option>
					<option value="6">주문취소</option>
				</select> &nbsp 
				<select name="sel2">
					<option value="1">주문번호</option>
					<option value="2">고객명</option>
					<option value="3">상품명</option>
				</select>
				<input class="first-input-2" type="text" name="text1" value="">
			</td>
			<td class="first-td-3">
				<input type="button" value="검색"> &nbsp;
			</td>
		</tr>
		<!-- <tr><td height="5"></td></tr> -->
	</table>
	</form>
	
	<table class="jumun-table-second">
		<tr class="second-tr-1"> 
			<td class="second-td-orderno">주문번호</td>
		    <td class="second-td-orderdate">주문일</td>
			<td class="second-td-productname">상품명</td>
			<td class="second-td-productcnt">제품수</td>	
			<td class="second-td-totalprice">총금액</td>
		    <td class="second-td-name">주문자</td>
			<td class="second-td-pay">결재</td>
		    <td class="second-td-status">주문상태</td>
		    <td width="50"  align="center">삭제</td>
		</tr>
		<tr class="second-tr-2">
			<!-- <form method="post" action="">  -->
			<td class="second-td-orderno"><a href="jumun_info.jsp?no=0803050004">0803050004</a></td>
			<td class="second-td-orderdate">2008-03-05</td>
			<td class="second-td-productname">파란 브라우스 외 1</td>	
			<td class="second-td-productcnt">2</td>	
			<td class="second-td-totalprice-1" width="70"  align="right">35,000&nbsp</td>	
			<td class="second-td-name">홍길동</td>	
			<td class="second-td-pay">카드</td>	
			<td class="second-td-status">
				<select class="second-td-select" name="state">
					<option value="1" selected>주문신청</option>
					<option value="2">주문확인</option>
					<option value="3">입금확인</option>
					<option value="4">배송중</option>
					<option value="5">주문완료</option>
					<option value="6">주문취소</option>
				</select>&nbsp;
				<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
			</td>	
			<td class="second-td-delete">
				<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
			</td>
			<!-- </form> -->
		</tr>
		<%-- <tr bgcolor="#F2F2F2" height="23">
			<form method="post" action="">  
			<td width="70"  align="center"><a href="jumun_info.jsp?no=0803030002">0803030002</a></td>
			<td width="70"  align="center">2008-03-03</td>
			<td width="250" align="left">&nbsp;실크 브라우스</td>	
			<td width="40" align="center">1</td>	
			<td width="70"  align="right">120,000&nbsp</td>	
			<td width="65"  align="center">이길동</td>	
			<td width="50"  align="center">무통장</td>	
			<td width="135" align="center" valign="bottom">
				<select name="state" style="font-size:9pt; color:blue">
					<option value="1">주문신청</option>
					<option value="2">주문확인</option>
					<option value="3">입금확인</option>
					<option value="4">배송중</option>
					<option value="5" selected>주문완료</option>
					<option value="6">주문취소</option>
				</select>&nbsp;
				<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
			</td>	
			<td width="50" align="center" valign="bottom">
				<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
			</td>
			</form>
		</tr>
		<tr bgcolor="#F2F2F2" height="23">
			<form method="post" action="">   
			<td width="70"  align="center"><a href="jumun_info.jsp?no=0803010006">0803010006</a></td>
			<td width="70"  align="center">2008-03-01</td>
			<td width="250" align="left">&nbsp;하얀 브라우스</td>	
			<td width="40" align="center">1</td>	
			<td width="70"  align="right">155,000&nbsp</td>	
			<td width="65"  align="center">김미자</td>	
			<td width="50"  align="center">카드</td>	
			<td width="135" align="center" valign="bottom">
				<select name="state" style="font-size:9pt; color:red">
					<option value="1">주문신청</option>
					<option value="2">주문확인</option>
					<option value="3">입금확인</option>
					<option value="4">배송중</option>
					<option value="5">주문완료</option>
					<option value="6"selected>주문취소</option>
				</select>&nbsp;
				<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
			</td>	
			<td width="50" align="center" valign="bottom">
				<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
			</td>
			</form>
		</tr> --%>
	</table>
	<br>
	<jsp:include page="/WEB-INF/views/include/paging.jsp"/>
</body>
</html>
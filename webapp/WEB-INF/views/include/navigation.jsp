<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath }/assets/css/navigation.css" rel="stylesheet" type="text/css">

<script>
	$(function(){
		/**********************************
		*         메뉴에 마우스 올렸을 경우                 *
		**********************************/
		// 메뉴1(콘서트 가즈아)에 마우스 올렸을 때
		$('#menu01').mouseover(function(){
			$('#menu01').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu01_on.png');
		});
		// 메뉴2(콘서트 용품)에 마우스 올렸을 때
		$('#menu02').mouseover(function(){
			$('#menu02').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu02_on.png');
		});
		// 메뉴3(아이유 달력이유)에 마우스 올렸을 때
		$('#menu03').mouseover(function(){
			$('#menu03').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu03_on.png');
		});
		// 메뉴4(이건 사양하는 이유)에 마우스 올렸을 때
		$('#menu04').mouseover(function(){
			$('#menu04').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu04_on.png');
		});
		// 메뉴5(생필품이유)에 마우스 올렸을 때
		$('#menu05').mouseover(function(){
			$('#menu05').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu05_on.png');
		});
		// 메뉴6(앨범이유)에 마우스 올렸을 때
		$('#menu06').mouseover(function(){
			$('#menu06').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu06_on.png');
		});
		// 메뉴7(앨범이유)에 마우스 올렸을 때
		$('#menu07').mouseover(function(){
			$('#menu07').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_on.png');
		});
		// 메뉴8(앨범이유)에 마우스 올렸을 때
		$('#menu08').mouseover(function(){
			$('#menu08').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_on.png');
		});
		// 메뉴9(앨범이유)에 마우스 올렸을 때
		$('#menu09').mouseover(function(){
			$('#menu09').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_on.png');
		});
		// 메뉴10(앨범이유)에 마우스 올렸을 때
		$('#menu10').mouseover(function(){
			$('#menu10').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_on.png');
		});
		
		
		
		/**********************************
		*         메뉴에 마우스가 나갔을 때                 *
		**********************************/
		
		// 메뉴1(콘서트 가즈아)에 마우스가 나왔을 때
		$('#menu01').mouseout(function(){
			$('#menu01').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu01_off.png');
		});
		// 메뉴2(콘서트 용품)에 마우스가 나왔을 때
		$('#menu02').mouseout(function(){
			$('#menu02').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu02_off.png');
		});
		// 메뉴3(아이유 달력이유)에 마우스가 나왔을 때
		$('#menu03').mouseout(function(){
			$('#menu03').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu03_off.png');
		});
		// 메뉴4(이건 사야하는 이유)에 마우스가 나왔을 때
		$('#menu04').mouseout(function(){
			$('#menu04').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu04_off.png');
		});
		// 메뉴5(생필퓸이유)에 마우스가 나왔을 때
		$('#menu05').mouseout(function(){
			$('#menu05').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu05_off.png');
		});
		// 메뉴6(앨범이유)에 마우스가 나왔을 때
		$('#menu06').mouseout(function(){
			$('#menu06').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu06_off.png');
		});
		// 메뉴7(준비중)에 마우스가 나왔을 때
		$('#menu07').mouseout(function(){
			$('#menu07').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png');
		});
		// 메뉴8(준비중)에 마우스가 나왔을 때
		$('#menu08').mouseout(function(){
			$('#menu08').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png');
		});
		// 메뉴9(준비중)에 마우스가 나왔을 때
		$('#menu09').mouseout(function(){
			$('#menu09').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png');
		});
		// 메뉴10(준비중)에 마우스가 나왔을 때
		$('#menu10').mouseout(function(){
			$('#menu10').attr('src','${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png');
		});
	});
</script>
<table class="nav-first-table">
	<tr> 
		<td valign="top"> 
			<!--  Category 메뉴 : 세로인 경우 -------------------------------->
			<table width="177"  border="0" cellpadding="2" cellspacing="1" bgcolor="#afafaf">
				<tr><td height="3"  bgcolor="#bfbfbf"></td></tr>
				<tr><td height="30" bgcolor="#f0f0f0" align="center" style="font-size:12pt;color:#333333"><b>Category</b></td></tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=1"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu01_off.png" id="menu01" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=2"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu02_off.png" id="menu02" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=3"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu03_off.png" id="menu03" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=4"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu04_off.png" id="menu04" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=5"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu05_off.png" id="menu05" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="product.jsp?menu=6"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu06_off.png" id="menu06" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#">
							<img src="${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png" id="menu07" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png" id="menu08" width="176" height="30" border="0" ></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png" id="menu09" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_menu07_off.png" id="menu10" width="176" height="30" border="0"></a></td></tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height="10"></td></tr>
	<tr> 
		<td> 
			<!--  Custom Service 메뉴(QA, FAQ...) -->
			<table width="177"  border="0" cellpadding="2" cellspacing="1" bgcolor="#afafaf">
				<tr><td height="3"  bgcolor="#a0a0a0"></td></tr>
				<tr><td height="25" bgcolor="#f0f0f0" align="center" style="font-size:11pt;color:#333333"><b>Customer Service</b></td></tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="qa"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_qa.gif" border="0" width="176"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="faq"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_faq.gif" border="0" width="176"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_etc.gif" border="0" width="176"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_etc.gif" border="0" width="176"></a></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr><td><a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/main_left_etc.gif" border="0" width="176"></a></td></tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
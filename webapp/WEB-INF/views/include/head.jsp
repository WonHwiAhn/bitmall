<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script> --%>
<link rel="stylesheet" href="https://thdoan.github.io/magnify/css/magnify.css">
<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<![endif]-->
<!--[if IE 9]><!-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--<![endif]-->
<script src="https://thdoan.github.io/magnify/js/jquery.magnify.js"></script>
<script>

$(function() {

	// 메인 사진 바뀌는 시간 (5초간격)
	var speed = 5000;
	var run = setInterval('rotate()', speed);	
	
	//왼쪽으로 얼마나 밀어줄지 결정 바뀔시
	var item_width = $('#slides li').outerWidth(); 
	var left_value = item_width * (-1); 
  
	console.log($('#slides li').outerWidth());
	console.log(item_width);
	console.log(left_value);

    //이전 버튼을 눌렀을 때 가장 처음 사진이면 마지막 사진 호출
	$('#slides li:first').before($('#slides li:last'));
	
	//기본 값 설정
	$('#slides ul').css({'left' : left_value});

    //이전 버튼 클릭시
	$('#prev').click(function() {

		          
		var left_indent = parseInt($('#slides ul').css('left')) + item_width;

		// 애니매이션 효과          
		$('#slides ul:not(:animated)').animate({'left' : left_indent}, 500,function(){    

            //처음사진 일 경우 마지막꺼로           	
			$('#slides li:first').before($('#slides li:last'));           

			//다시 제자리로
			$('#slides ul').css({'left' : left_value});
		
		});

		//cancel the link behavior            
		return false;
            
	});

 
    //다음 버튼 클리시
	$('#next').click(function() {
		
		//get the right position
		var left_indent = parseInt($('#slides ul').css('left')) - item_width;
		console.log(left_indent);
		//slide the item
		$('#slides ul:not(:animated)').animate({'left' : left_indent}, 500, function () {
            
            //move the first item and put it as last item
			$('#slides li:last').after($('#slides li:first'));                 	
			
			//set the default item to correct position
			$('#slides ul').css({'left' : left_value});
		
		});
		         
		//cancel the link behavior
		return false;
		
	});        
	
	//if mouse hover, pause the auto rotation, otherwise rotate it
	$('#slides').hover(
		
		function() {
			clearInterval(run);
		}, 
		function() {
			run = setInterval('rotate()', speed);	
		}
	); 
        
});

//a simple function to click next link
//a timer will call this function, and the rotation will begin :)  
function rotate() {
	$('#prev').click();
}
        
        
        
</script>

<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
		<td>
			<!--  상단 왼쪽 로고  -------------------------------------------->
			<table border="0" cellspacing="0" cellpadding="0" width="182">
				<tr>
					<td>
						<a href="${pageContext.servletContext.contextPath }/admin/" onclick="<input type='hidden' name='no' value='${authUser.no }'>" title="no" id="no" >
						<input type="hidden" name="no" value="${authUser.no }">
						<img src="${pageContext.servletContext.contextPath }/assets/images/top_logo1.png" width="182" height="40" border="0">
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
			<td>
				<div id="buttons">
					<a href="#" id="prev">prev</a>
					<a href="#" id="next">next</a>
					<div class="clear"></div>
				</div>
			</td>
			<td><a href="${pageContext.servletContext.contextPath }/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/user/member_login"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/user/member_agree"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/cart/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand"></td>
		</c:when>
		
		<c:otherwise>
			<td>
				<div id="buttons">
					<a href="#" id="prev">prev</a>
					<a href="#" id="next">next</a>
					<div class="clear"></div>
				</div>
			</td>
			<td><a href="${pageContext.servletContext.contextPath }/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 로그아웃 -->
			<td><a href="${pageContext.servletContext.contextPath }/user/member_logout"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 회원정보수정 -->
			<td><a href="${pageContext.servletContext.contextPath }/user/member_modify/${authUser.id }"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/cart/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="${pageContext.servletContext.contextPath }/jumun/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
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
<%-- <table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image0.jpg" width="182" height="175"></td>
	  <td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image1.jpg" width="777" height="175"></td>
	</tr>
</table> --%>
<div id="carousel">
	<div class="clear"></div>
	<div id="slides">
		<ul>
			<li><img src="${pageContext.servletContext.contextPath }/assets/images/slide1_1.jpg" width="959" height="164" alt="Slide 1"/></li>
			<li><img src="${pageContext.servletContext.contextPath }/assets/images/slide2_2.jpg" width="959" height="164" alt="Slide 2"/></li>
			<li><img src="${pageContext.servletContext.contextPath }/assets/images/slide3_3.jpg" width="959" height="164" alt="Slide 3"/></li>
		</ul>
		<!-- <ul>
			<li>
				<div id="buttons">
					<a href="#" id="prev">prev</a>
					<a href="#" id="next">next</a>
					<div class="clear"></div>
				</div>
			</li>
		</ul> -->
		<div class="clear"></div>
	</div>
	
	

</div>
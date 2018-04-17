<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<%-- <link href="${pageContext.servletContext.contextPath }/assets/css/magnify.css" rel="stylesheet" type="text/css"> --%>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!--[if lt IE 9]>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<![endif]-->
	<!--[if IE 9]><!-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--<![endif]-->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.11.1.js"></script> --%>
	
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script> --%>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.ae.image.resize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/magnify.js"></script> --%>
</head>
<style>
	magnify .magnify-lens {
	  width: 300px;
	  height:300px;
	}
</style>
<script>
var $zoom;
$(function(){
	// 돋보기 기능 생성자
  	$zoom = $('.zoom').magnify({
      afterLoad: function() {
        console.log('확대 기동!!!');
      }
    });
	// main-image 클릭시
	$("#main-image").click(function(){
		/* $( "#main-image" ).aeImageResize({ height: 250, width: 250 }); */
	});
	/* swal
    ({   
    	title: 'Delete?',   
    	text: 'Confirm Delete!',   
    	type: 'warning',   
    	showCancelButton: true,   
    	confirmButtonColor: '#3085d6',   
    	cancelButtonColor: '#d33',   
    	confirmButtonText: 'Yes, delete it!',   
    	closeOnConfirm: false }, function(isConfirm){
    		/* if (isConfirm) {
    			swal({
    				title: 'Delete?',   
    		    	text: 'Confirm Delete!',   
    		    	type: 'warning',   
    		    	showCancelButton: true,   
    		    	confirmButtonColor: '#3085d6',   
    		    	cancelButtonColor: '#d33',   
    		    	confirmButtonText: 'Yes, delete it!',   
    		    	closeOnConfirm: false
    			});
    		} 
    	} );  */
	
	/* swal({
	      title: "장바구니 추가 성공",
	      text: "",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonColor: "#DD6B55",
	      confirmButtonText: "Yes.",
	      cancelButtonText: "No.",
	      closeOnConfirm: false,
	      closeOnCancel: false
	    },
	    function(isConfirm) {
	      if (isConfirm) {
	        swal({
	        	title: "장바구니 추가 성공",
	  	      text: "",
	  	      type: "warning",
	  	      showCancelButton: true,
	  	      confirmButtonColor: "#DD6B55",
	  	      confirmButtonText: "Yes.",
	  	      cancelButtonText: "No.",
	  	      closeOnConfirm: false,
	  	      closeOnCancel: false
	        }, function(isConfirm) {
	           alert('고고고고고');
	        });
	      } else {
	        swal("Cancelled", "Not done.", "error");
	      }
	    }); */
	
	
	// 로그인하기 클릭시
	$('#login').click(function(){
		console.log('334');
		window.location.replace('${pageContext.servletContext.contextPath}/user/member_login?no=${vo.no}');
	});
	
	// 장바구니 버튼 클릭시
	$('#modal').click(function(event){
		event.preventDefault();
	});
	
	// modal 안에서 add버튼을 클릭할 경우
	$('#add-cart').click(function(event){
		event.preventDefault();
		
		// 이미 장바구니에 선택한 옵션이 있는지 확인해준다.
		console.log($('#optionNo').val());
		console.log($('#soptionData').val());
		
		if($('#optionNo').val() == 0){
			swal('옵션을 선택해주세요 !!');
			return ;
		}
		
		if($('#soptionData').val() == 0){
			swal('소옵션을 선택해주세요 !!!');
			return ;
		}
		
		// 소옵션, 옵션에 -로 이어붙인 다음에 서버로 넘겨줌.
		var data = {
			"option": $('#optionNo').val() + '-' + $('#soptionData').val(),
			"goodsNo": '${vo.no}',
			"customerNo" : '${authUser.no}'
		};
		
		// 선택된 옵션이 장바구니에 있는지 체크
		$.ajax({
			url:"${pageContext.servletContext.contextPath }/api/cart/checkoption",
			type:"post",
			data:data,
			success: function(response){
				console.log(response);
				// 선택한 옵션이 있을 경우
				if(response.data == "exist"){
					alert('장바구니에 있는 옵션입니다\n 수량은 장바구니에서 변경해주세요!');
					
					var move = confirm('장바구니로 이동하시겠습니까?');
					
					if(move == true){
						window.location.replace('${pageContext.servletContext.contextPath}/cart/');
					}
				}else{ // 선택한 옵션이 없을 경우 장바구니에 추가
					console.log($('#count').val()); // 수량
					console.log(data); // 옵션번호
					console.log('${vo.no}'); // 상품번호
					console.log('${authUser.no}'); // 유저번호
					
					var addData = {
							"count":$('#count').val(),
							"option":$('#optionNo').val() + '-' + $('#soptionData').val(),
							"goodsNo":'${vo.no}',
							"customerNo":'${authUser.no}'
					}
					
					$.ajax({
						url:"${pageContext.servletContext.contextPath }/api/cart/add",
						type:"post",
						data:addData,
						success: function(response){
							console.log(response);
							if(response.data == "success"){
								
								alert('장바구니 추가에 성공했습니다.');
								var move = confirm('장바구니로 이동하시겠습니까?');
								
								if(move == true){
									window.location.replace('${pageContext.servletContext.contextPath}/cart/');
								}
								
							}else{
								alert('장바구니에 추가에 실패했습니다.\n관리자에게 문의하세요.');
							}
						},
						error: function(xhr, status, e){
							console.log(status + ":" + e);
						}
					}); //end inner ajax
				}
			},
			error: function(xhr, status, e){
				console.log(status + ":" + e);
			}
		}); //end ajax
	});
	
	//상품 옵션 선택
	$('#optionNo').change(function(){
		console.log($('#optionNo option:selected').val());
		console.log($('#optionNo option:selected').text());
		
		var optionVal = $('#optionNo option:selected').val();
		
		var data = {
				"optionNo":optionVal	
			};
		
		$.ajax({
			url:"/bitmall/api/admin/getSmallOption",
			type:"post",
			dataType:"json",
			data:data,
			success:function(response){
				
				// 옵션2 셀렉박스 보이게하기
				if($("#soptionNo-div").css("display") == "none"){
					$('#soptionNo-div').css('display', 'block');
				}
				
				if(response.data.length < 1){
					if($("#soptionNo-div").css("display") == "block"){
						$('#soptionNo-div').css('display', 'none');
					}
				}
				
				
				$('#soptionData').empty();
				$('#soptionData').append("<option value='0' selected>옵션선택</option>");
				// 옵션 크기만큼 다시 그려주기
				$.each(response.data, function(idx, val){
					$('#soptionData').append("<option value='"+val.no+"'>"+val.name+"</option>");
				});
			},
			error:function(){
				alert('failed');
			}
		}); // end ajax
	});
});
</script>
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
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!-- form2 시작  -->
			<form name="form2" method="post" action="">
			<input type="hidden" name="no" value="0000">
			<input type="hidden" name="kind" value="insert">

			<table border="0" cellpadding="0" cellspacing="0" width="745">
				<tr>
					<td width="335" align="center" valign="top">
						<!-- 상품이미지 -->
						<table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
							<tr>
								<td bgcolor="white" align="center">
									<img src="${pageContext.servletContext.contextPath }${represent}" data-magnify-src="${pageContext.servletContext.contextPath }${represent}" class="zoom" id="main-image" width="315" height="315" border="0" align="absmiddle" STYLE="cursor:hand">
								</td>
							</tr>
						</table>
					</td>
					<td width="410 " align="center" valign="top">
						<!-- 상품명 -->
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<tr>
								<td width="80" height="45" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>제품명</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<font color="282828">${vo.name }</font><br>
									<c:forEach items="${iconList}" var="icon">
										<c:forTokens items="${vo.iconData }" delims="-" var="item">
										    <c:if test="${item eq icon.no}">
										    	<%-- ${icon.name } --%>
										    	<img src="${pageContext.servletContext.contextPath}/${icon.src}" align="absmiddle" vspace="1">
										    	<%-- <c:if test="${icon.no eq 3 }">(${vo.discount }%)</c:if> --%>
										    </c:if>
										</c:forTokens>
									</c:forEach>  
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 시중가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>소비자가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td width="289" style="padding-left:10px"><font color="666666">
									<b>
										${vo.price }원
									</b>
								</font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 판매가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>판매가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px"><font color="0288DD">
									<b>
										<fmt:parseNumber var="discountPrice" integerOnly="true" value="${(vo.price - vo.price*(vo.discount/100))/10*10 }"/>
										<span style="text-decoration:line-through">${vo.price }원</span> (${vo.discount }%) -&gt; ${discountPrice }원
									</b>
								</font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 옵션 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>옵션선택</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<div id="optionNo-div" style="float:left;">
								    	<select id="optionNo" name="optionNo">
									    	<option value="0" selected>옵션선택</option>
									  	 	<c:forEach items="${optionList}" begin="0" step="1" var="vo" varStatus="status">
												<option value="${vo.no}">${vo.name}</option>
											</c:forEach>
										</select>
									</div>
									<div id="soptionNo-div" style="float:left; display:none">
										<select id="soptionData" name="soptionData">
										</select>
									</div>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 수량 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>수량</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="text" id="count" name="count" value="1" size="3" maxlength="5" class="cmfont1"> <font color="666666">개</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="70" align="center">
									<%-- <a href="${pageContext.servletContext.contextPath}/order/now"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp; --%>
									<a href="#"><button id="modal" type="button" data-toggle="modal" data-target="#myModal" style="background-color:white;border:0px;"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="absmiddle"></button></a>
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="30" align="center">
									<img src="${pageContext.servletContext.contextPath }/assets/images/product_text1.gif" border="0" align="absmiddle">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			<!-- form2 끝  -->

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="200" valign=top style="line-height:14pt">
						${vo.description }
						<br>
						<br>
						<center>
							<c:forEach items="${images }" var="vo" varStatus="status">
							<img src="${pageContext.servletContext.contextPath }${images[status.index]}" width="650" height="300"><br><br><br>
							</c:forEach>
						</center>
					</td>
				</tr>
			</table>

			<!-- 교환배송정보 -->
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td align="center" class="cmfont">배송정보 어쩌고저쩌고........</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
			</table>


<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      	<c:if test="${authUser ne null }">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">장바구니</h4>
	        </div>
	        <div class="modal-body">
	          <p>선택하신 제품을 장바구니에 추가하시겠습니까?</p>
	        </div>
	        <div class="modal-footer">
	        	<button id="add-cart" type="button" class="btn btn-default" data-dismiss="modal">추가</button>
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
        </c:if>
        <c:if test="${authUser eq null }">
        	<div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">로그인이 필요한 작업입니다.</h4>
	        </div>
	        <div class="modal-footer">
	        	<button id="login" type="button" class="btn btn-default" data-dismiss="modal">로그인</button>
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
        </c:if>
      </div>
      
      
    </div>
  </div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
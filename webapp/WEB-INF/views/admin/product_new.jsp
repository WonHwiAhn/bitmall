<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	
	<script>
		$(function(){
			/****** 정규표현식 ********/
			var regexp = /^[0-9]*$/; //숫자만
			/**********************/
			// 등록하기 버튼 클릭시
			$('#reg-button').click(function(){
				// 상품분류 입력 안되있을 경우
				if($('#categoryNo').val() == 0){
					alert('상품분류를 선택해주세요!');
					$('#categoryNo').focus();
					return;
				}
				
				// 상품코드 입력이 안되있을 경우
				if($('#code').val() == ''){
					alert('상품코드를 입력해주세요!');
					$('#code').focus();
					return;
				}
				
				// 상품명이 입력이 안되있을 경우
				if($('#name').val() == ''){
					alert('상품명을 입력해주세요!');
					$('#name').focus();
					return;
				}
				
				// 제조사가 입력이 안되있을 경우
				if($('#maker').val() == ''){
					alert('제조사를 입력해주세요!');
					$('#maker').focus();
					return;
				}
				
				// 판매가가 입력이 안되있을 경우
				if($('#price').val() == ''){
					alert('판매가를 입력해주세요!');
					$('#price').focus();
					return;
				}
				
				// 판매가에 숫자 이외에 데이터가 적혀있을 경우
				
				v = $('#price').val();
				if( !regexp.test(v) ) {
					alert("판매가에 숫자만 입력하세요");
					$('#price').focus();
					return ;
					//$('#price').val(v.replace(regexp,''));
				}
				
				// 옵션이 입력이 안되있을 경우
				if($('#optionNo').val() == 0){
					alert('옵션을 선택해주세요!');
					$('#optionNo').focus();
					return;
				}
				
				// 아이콘 sale에 클릭되어있는데 할인율이 0%일 경우와 0이하 100이상일 경우
				if($('.icon_sale').prop('checked') == true){
					var discountRate = $('#discount').val();
					if(discountRate <= 0 || discountRate >= 100){
						alert('할인율을 확인주세요!\n 입력값이 1~99사이여야합니다.');
						$('#optionNo').focus();
						return;
					}
				}
				
				// 할인율에 숫자만 입력하게 하기
				v = $('#discount').val();
				if( !regexp.test(v) ) {
					alert("할인율에 숫자만 입력하세요");
					$('#discount').focus();
					return ;
					//$('#price').val(v.replace(regexp,''));
				}
				
				
				if($('#file').val() == '' && $('#file2').val() == '' ){
					alert('이미지는 1개 이상 넣어주셔야됩니다.');
					return;
				}
				
				$('#form2').submit();
			});
			
			/* $('#form2').submit(function(){
				// 상품 분류를 선택하지 않았을 경우
				var no = $('#categoryNo').val();
				if($('#categoryNo').val() == 0){
					alert('상품분류를 선택해주세요!');
					$('#categoryNo').focus();
					return;
				}
				return;
			}); */
			/* icon_new
			icon_hit
			icon_sale */
			// 아이콘은 다중선택이 가능하고... 일반 form으로 보내기 때문에
			// 클릭시에 hidden에다가 값을 넣어줌. ex) new-hit
			// 나중에 파싱
			// 1개의 버튼을 클릭할 떄마다 다른 버튼값도 체크해서 값 재생성
			$('.icon_new').on("click", function(){
				var optionData = '';
				var dataLength = $('#icon:checked').length;
				$('#icon:checked').each(function(idx) { 
			        optionData = optionData + $(this).val();
			        if(dataLength-1 > idx){
			        	optionData += '-';
			        }
			   });
				$('#iconData').val(optionData);
			});
			
			$('.icon_hit').on("click", function(){
				var optionData = '';
				var dataLength = $('#icon:checked').length;
				$('#icon:checked').each(function(idx) { 
			        optionData = optionData + $(this).val();
			        if(dataLength-1 > idx){
			        	optionData += '-';
			        }
			   });
				$('#iconData').val(optionData);
			});
			
			// 할인 아이콘 클릭시 할인 input 활성화
			$('.icon_sale').on("click", function(){
				if($('.icon_sale').prop('checked') == true){
					$('#discount').removeAttr("disabled");//제거 input 요소를 disabled 속성
				}else{
					$('#discount').attr("disabled","disabled")//는 input 요소 설정 을 disabled
					$('#discount').val(0);
				}
				
				var optionData = '';
				var dataLength = $('#icon:checked').length;
				$('#icon:checked').each(function(idx) { 
			        optionData = optionData + $(this).val();
			        if(dataLength-1 > idx){
			        	optionData += '-';
			        }
			   	});
				$('#iconData').val(optionData);
			});
			
			// 상품 옵션 선택
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
					//contentType:"application/json",
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
						
						/* if(response.data != 'nodata'){
							console.log(response.data.length);
							// map 이용할 때 console.log(response.data.list[0]);
							
							$('.member-table-second > tbody').empty();
							console.log('${test}');
							$.each(response.data, function(idx, val){
								//console.log(val);
								render(true, val);
							});
						} */
					},
					error:function(){
						alert('failed');
					}
				}); // end ajax
			});
			
			
		});
	</script>
	
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form id="form2" action="${pageContext.servletContext.contextPath }/admin/product_new"
	  method="post"
	  enctype="multipart/form-data">
<table align="center" width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    <td width="700" bgcolor="#F2F2F2">
			<select name="categoryNo" id="categoryNo">
				<option value="0" selected>상품분류를 선택하세요</option>
				<c:forEach items="${categoryList}" begin="0" step="1" var="vo" varStatus="status">
						<option value="${vo.no }">${vo.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" id="code" name="code" value="" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" id="name" name="name" value="" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="maker" id="maker" value="" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="number" min="100" name="price" id="price" value="" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td width="700" bgcolor="#F2F2F2">
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
				<option value="0" selected>옵션선택</option>
				<option value="1">사이즈</option>
				<option value="2">색상_WB</option>
				<option value="3">색상_WR</option>
			</select>
		</div>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700" bgcolor="#F2F2F2">
			<textarea id="description" name="description" rows="10" cols="80" style="resize:none;"></textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    <td width="700" bgcolor="#F2F2F2">
			<input type="radio" name="status" value="1" checked> 판매중
			<input type="radio" name="status" value="2"> 판매중지
			<input type="radio" name="status" value="3"> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="checkbox" id="icon" class="icon_new" name="icon_new" value="1"> New &nbsp;&nbsp	
			<input type="checkbox" id="icon" class="icon_hit" name="icon_hit" value="2"> Hit &nbsp;&nbsp	
			<input type="checkbox" id="icon" class="icon_sale" name="icon_sale" value="3"> Sale &nbsp;&nbsp
			<input type="text" id="iconData" name="iconData">
			할인율 : <input type="text" id="discount" name="discount" value="0" size="3" maxlength="3" disabled> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700" bgcolor="#F2F2F2">
			<b>이미지1</b>: <input type="file" id="file" name="file" size="30" value="찾아보기"><br>
			<b>이미지2</b>: <input type="file" id="file2" name="file2" size="30" value="찾아보기"><br>
			<!-- <b>이미지3</b>: <input type="file" name="file3" size="30" value="찾아보기"><br> -->
		</td>
	</tr>
</table>
<br>
<table align="center" width="800" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="button" id="reg-button" value="등록하기"> &nbsp;&nbsp
			<a href="product.jsp"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
</body>
</html>

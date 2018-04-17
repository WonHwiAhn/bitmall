<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var addressData = module(data);

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = addressData.fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = addressData.extraRoadAddr;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
    // 배송지 우편
    function sample4_getAddress(){
    	new daum.Postcode({
            oncomplete: function(data) {
				
            	var addressData = module(data);
            	
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('get_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('get_roadAddress').value = addressData.fullRoadAddr;
                document.getElementById('get_jibunAddress').value = addressData.extraRoadAddr;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide1').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide1').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide1').innerHTML = '';
                }
            }
        }).open();
    }
    
    function module(data){
    	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }
        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
        if(fullRoadAddr !== ''){
            fullRoadAddr += extraRoadAddr;
        }
        
        var addressData = {
        		"fullRoadAddr":fullRoadAddr,
        		"extraRoadAddr":extraRoadAddr
        }
        
        return addressData;
    }
</script>
	<script>
		$(function(){
			var birthData = '${vo.birth}'.split("-");
			var phoneData = '${vo.phoneNo}'.split("-");
			var telData = '${vo.telNo}'.split("-");
			
			// 생년월일 분할 데이터 삽입
			$('#birth1').val(birthData[0]);
			$('#birth2').val(birthData[1]);
			$('#birth3').val(birthData[2]);
			
			// 핸드폰 번호 분할 삽입
			$('#phone1').val(phoneData[0]);
			$('#phone2').val(phoneData[1]);
			$('#phone3').val(phoneData[2]);
			
			// 전화번호 분할 삽입
			$('#tel1').val(telData[0]);
			$('#tel2').val(telData[1]);
			$('#tel3').val(telData[2]);
			
			// 라디오 버튼 (주문자와 동일이거나 아니거나)
			$("input[name=same]").change(function() {
				var temp = $(':radio[name="same"]:checked').val();
				
				// 주문자와 동일한 정보를 가지고 있을 경우
				if(temp == 1){
					// 이름
					$('#rName').val($('#name').val());
					
					// 전화번호
					$('#rTel1').val(telData[0]);
					$('#rTel2').val(telData[1]);
					$('#rTel3').val(telData[2]);
					
					// 모바일
					$('#rPhone1').val(phoneData[0]);
					$('#rPhone2').val(phoneData[1]);
					$('#rPhone3').val(phoneData[2]);
					
					// 이메일
					$('#rEmail').val($('#email').val());
					
					// 우편번호 & 주소
					$('.rZipcode').val($('.zipCode').val());
					$('.rDestination').val($('.address').val());
				}
				// 아닌 경우
				if(temp == 2){
					// 이름
					$('#rName').val("");
					
					// 전화번호
					$('#rTel1').val("");
					$('#rTel2').val("");
					$('#rTel3').val("");
					
					// 모바일
					$('#rPhone1').val("");
					$('#rPhone2').val("");
					$('#rPhone3').val("");
					
					// 이메일
					$('#rEmail').val("");
					
					// 우편번호 & 주소
					$('.rZipcode').val("");
					$('.rDestination').val("");
				}
			});
			
			// 주문하기 버튼을 눌렀을 때
			$('#form2').submit(function(){ 
				//event.preventDefault();
				
				var datas = $(this).serialize();
				
				var data = {};
				
				$.each($(this).serializeArray(), function(idx, vo){
					// vo 자체에 name, value 값을 가진 형태로 들어옴.
					data[vo.name] = vo.value;
				});
				
				console.log(data);
				
				// name input 값이 공백일 경우
				if(data['name'] == ''){
					alert('주문자 이름을 입력해주세요!');
					
					$('#name').focus();
					return;
				}
				
				// birthday input 값이 공백일 경우
				if(data['birth1'] == '' || data['birth2'] == '' || data['birth3'] == ''){
					alert('생년월일을 입력해주세요!');
					
					$('#birthday1').focus();
					return;
				}
				
				// tel 혹은 phone input 값이 공백일 경우
				// 이 경우에는 2중 1개만 입력만 해도 pass
				if(data['tel1'] == '' || data['tel2'] == '' || data['tel3'] == ''){
					if(data['phone1'] == '' || data['phone2'] == '' || data['phone3'] == ''){
						alert('전화번호 혹은 핸드폰번호를 입력하셔야됩니다.');
						
						$('#phone1').focus();
						return;
					}
				}
				
				// address input 값이 공백일 경우
				if(data['address'] == ''){
					alert('주소를 입력해주세요');
					
					// 이 부분은 나중에 바로 링크 열어도 될 듯? window써서
					$('#address').focus();
					return;
				}
				
				// email input 값이 공백일 경우
				if(data['email'] == ''){
					alert('이메일을 입력해주세요');
					
					// 이 부분은 나중에 바로 링크 열어도 될 듯? window써서
					$('#email').focus();
					return;
				}
				
				// 전화번호와 핸드폰은 2개중 1개만 있을 때를 구별해줘야함.
				if(data['tel1'] != '' && data['tel2'] != '' && data['tel3'] != ''){
					data['telNo'] = data['tel1'] + '-' +
									data['tel2'] + '-' +
									data['tel3'];
				}
				
				if(data['phone1'] != '' && data['phone2'] != '' && data['phone3'] != ''){
					data['phoneNo'] = data['phone1'] + '-' +
									  data['phone2'] + '-' +
									  data['phone3'];
				}
				
				/* ${pageContext.servletContext.contextPath }/order/order_pay */
				//return;
				//window.location.replace('${pageContext.servletContext.contextPath }/order/order_pay');
			});
			/* if($('#radio-y').prop("checked", true)){
				console.log('2323');
			}
			if($('#radio-n').prop("checked", true)){
				console.log('345345');
			} */
			
		});
	</script>
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

			<!--  현재 페이지 자바스크립  -------------------------------------------->
			<script language="javascript">

			/* function Check_Value() {
				if (!form2.o_name.value) {
					alert("주문자 이름이 잘 못 되었습니다.");	form2.o_name.focus();	return;
				}
				if (!form2.o_tel1.value || !form2.o_tel2.value || !form2.o_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	form2.o_tel1.focus();	return;
				}
				if (!form2.o_phone1.value || !form2.o_phone2.value || !form2.o_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	form2.o_phone1.focus();	return;
				}
				if (!form2.o_email.value) {
					alert("이메일이 잘 못 되었습니다.");	form2.o_email.focus();	return;
				}
				if (!form2.o_zip1.value || !form2.o_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	form2.o_zip1.focus();	return;
				}
				if (!form2.o_juso.value) {
					alert("주소가 잘 못 되었습니다.");	form2.o_email.focus();	return;
				}

				if (!form2.r_name.value) {
					alert("받으실 분의 이름이 잘 못 되었습니다.");	form2.r_name.focus();	return;
				}
				if (!form2.r_tel1.value || !form2.r_tel2.value || !form2.r_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	form2.r_tel1.focus();	return;
				}
				if (!form2.r_phone1.value || !form2.r_phone2.value || !form2.r_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	form2.r_phone1.focus();	return;
				}
				if (!form2.r_email.value) {
					alert("이메일이 잘 못 되었습니다.");	form2.r_email.focus();	return;
				}
				if (!form2.r_zip1.value || !form2.r_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	form2.r_zip1.focus();	return;
				}
				if (!form2.r_juso.value) {
					alert("주소가 잘 못 되었습니다.");	form2.r_email.focus();	return;
				}

				form2.submit();
			}

			function FindZip(zip_kind) 
			{
				window.open("zipcode.jsp?zip_kind="+zip_kind, "", "scrollbars=no,width=500,height=250");
			}

			function SameCopy(str) {
				if (str == "Y") {
					form2.r_name.value = form2.o_name.value;
					form2.r_zip1.value = form2.o_zip1.value;
					form2.r_zip2.value = form2.o_zip2.value;
					form2.r_juso.value = form2.o_juso.value;
					form2.r_tel1.value = form2.o_tel1.value;
					form2.r_tel2.value = form2.o_tel2.value;
					form2.r_tel3.value = form2.o_tel3.value;
					form2.r_phone1.value = form2.o_phone1.value;
					form2.r_phone2.value = form2.o_phone2.value;
					form2.r_phone3.value = form2.o_phone3.value;
					form2.r_email.value = form2.o_email.value;
				}
				else {
					form2.r_name.value = "";
					form2.r_zip1.value = "";
					form2.r_zip2.value = "";
					form2.r_juso.value = "";
					form2.r_tel1.value = "";
					form2.r_tel2.value = "";
					form2.r_tel3.value = "";
					form2.r_phone1.value = "";
					form2.r_phone2.value = "";
					form2.r_phone3.value = "";
					form2.r_email.value = "";
				} 
			}*/

			</script>
<form id="form2" name="form2" method="post" action="${pageContext.servletContext.contextPath }/order/order_pay">
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="440" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="100" align="center">가격</td>
					<td width="100" align="center">합계</td>
				</tr>
				<%-- <input type="text" value="${dto }" name="goodsList"> --%>
				<c:forEach items="${dto}" var="vo" varStatus="status">
					<tr>
						
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
					</tr>
					<%-- <c:set var="totalBalance" value="${totalBalance += vo.totalCount }" /> --%>
				</c:forEach>
				
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(${sum}원) + 배송료(2,500원) = <font color="#FF3333"><b><input type="text" value="${sum + 2500}" id="rTotalPrice" name="rTotalPrice">${sum + 2500}원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br>

			<!-- 주문자 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>

			<!-- form2 시작  -->
			
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5">
						<font size="2" color="#B90319"><b>주문자 정보</b></font>
					</td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="no" value="${vo.no }">
									<input type="text" id="name" name="name" maxlength = "10" value = "${vo.name }" size="20" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="tel1" name='tel1' size = "4" maxlength = "4" class="cmfont1"><font color="898989">-</font>
									<input type="text" id="tel2" name='tel2' size = "4" maxlength = "4" class="cmfont1"><font color="898989">-</font>
									<input type="text" id="tel3" name='tel3' size = "4" maxlength = "4" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="phone1" name='phone1' size = "4" maxlength = "4" value = "${phone1 }" class="cmfont1"><font color="898989">-</font>
									<input type="text" id="phone2" name='phone2' size = "4" maxlength = "4" value = "${phone2 }" class="cmfont1"><font color="898989">-</font>
									<input type="text" id="phone3" name='phone3' size = "4" maxlength = "4" value = "${phone3 }" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="email" name='email' size = "50" maxlength = "50" value = "${vo.email }" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<%-- <input type="text" name="o_zip1" size="3" maxlength="3" value="" class="cmfont1" readonly> -
									<input type="text" name="o_zip2" size="3" maxlength="3" value="" class="cmfont1" readonly>
									<a href="javascript:FindZip(1)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="o_juso" size="50" maxlength="200" value="" class="cmfont1" readonly><br> --%>
									<input type="text" id="sample4_postcode" class="zipCode" name="zipCode" value="${vo.zipCode }"placeholder="우편번호" readonly>
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly><br>
									<input type="text" style="width:250px;"id="sample4_roadAddress" class="address" name="address" value="${vo.address }" placeholder="도로명주소" readonly>
									<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly>
									<span id="guide" style="color:#999"></span>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<!-- 배송지 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자정보와 동일</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="radio" id="radio-y" name="same" value="1">예 &nbsp;
									<input type="radio" id="radio-n" name="same" value="2" checked>아니오
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>받으실 분 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="rCustomerNo" value="${vo.no }">
									<input type="text" id="rName" name="rName" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="rTel1" name="rTel1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="rTel2" name="rTel2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="rTel3" name="rTel3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="rPhone1" name="rPhone1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="rPhone2" name="rPhone2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="rPhone3" name="rPhone3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="rEmail" name="rEmail" size="50" maxlength="50" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<%-- <input type="text" name="r_zip1" size="3" maxlength="3" value="" class="cmfont1" readonly> -
									<input type="text" name="r_zip2" size="3" maxlength="3" value="" class="cmfont1" readonly>
									<a href="javascript:FindZip(2)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="r_juso" size="50" maxlength="200" value="" class="cmfont1" readonly><br> --%>
									<input type="text" id="get_postcode" class="rZipcode" name="rZipcode" value=""placeholder="우편번호" readonly>
									<input type="button" onclick="sample4_getAddress()" value="우편번호 찾기" readonly><br>
									<input type="text" style="width:250px;"id="get_roadAddress" class="rDestination" name="rDestination" value="" placeholder="도로명주소" readonly>
									<input type="hidden" id="get_jibunAddress" placeholder="지번주소" readonly>
									<span id="guide1" style="color:#999"></span>
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>배송시요구사항</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<textarea id="rRequired" name="rRequire" cols="60" rows="3" class="cmfont1" style="resize:none;"></textarea>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="center">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			
			</form>

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
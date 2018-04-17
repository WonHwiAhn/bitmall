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
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

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
			
			$('#form2').submit(function(){ 
				event.preventDefault();
				
				var datas = $(this).serialize();
				
				var data = {};
				
				$.each($(this).serializeArray(), function(idx, vo){
					// vo 자체에 name, value 값을 가진 형태로 들어옴.
					data[vo.name] = vo.value;
				});
				
				console.log(data['password2'].length);
				console.log(data['password'].length);
				
				// password2 input 값이 공백일 경우
				//if(typeof data['password2'] != 'undefined' && data['password2'] != '' && data['password2'] != null){
				// password칸 중 1개라도 비어있을 경우 칸을 채우라고 요청한다
				// 단, 두개다 공백일 때는 수정을 안해도되므로 유효성 검사 없이 넘어간다.
				if((data['password2'].length != 0 && data['password'].length == 0) ||
				   (data['password2'].length == 0 && data['password'].length != 0)){
					
					if(data['password2'].length == 0){
						alert('비밀번호를 확인에 비밀번호를 입력해주세요 :)');
						$('#password2').focus();
						return;
					}else if(data['password'].length == 0){
						alert('비밀번호를 입력해주세요 :)');
						$('#password').focus();
						return;
					}
				}
				
				// 패스워드 입력창 2가지 값 비교
				if(data['password2'].length != 0 && data['password'].length != 0){
					if(data['password2'] != data['password']){
						alert('비밀번호와 비밀번호 확인의 값이 다릅니다.');
						$('#password').focus();
						return;
					}
				}
				
				// password2 input 값이 공백일 경우
				/* if(typeof data['password'] != 'undefined' && data['password'] != '' && data['password'] != null){
					alert('패스워드 확인을 해주세요 :)');
					
					$('#password2').focus();
					return;
				} */
				
				// name input 값이 공백일 경우
				if(data['name'] == ''){
					alert('이름을 입력해주세요!');
					
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
				
				//우편번호
				if(data['zip1'] == '' || data['zip2'] == ''){
					alert('우편번호를 입력해주세요');
					
					// 이 부분은 나중에 바로 링크 열어도 될 듯? window써서
					$('#zip1').focus();
					return;
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
				
				//console.log(JSON.stringify(data));
				
				//// validation을 다 통과할 경우 생년월일, 폰넘버 , zipconde 값을 붙여준다.
				data['birth'] = data['birth1'] + '-' +
								data['birth2'] + '-' +
								data['birth3'] ;
				
				// zipCode 생성
				//data['zipCode'] = data['zip1'] + '-' + data['zip2'];
				
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
				
				// submit해주는 부분
				$.ajax({
					url:"/bitmall/api/user/member_modify",
					type:"post",
					dataType:"json",
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(response){
						console.log(response);
						if(response.data == 'success'){
							/* $('#form2').attr('action', '/bitmall/user/login');
							$('#form2').submit(); */
							window.location.replace("/bitmall/user/member_modify_success");
						}else{
							alert('failed to modify your data');
						}
					},
					error:function(){
						alert('failed');
					}
				});
				//console.log(datas);
				return ;
			});
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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/member_edit.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<form id="form2" name="form2" method="post" action="/user/member_modifying/${authUser.no }">
			<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
				<tr>
					<td align="center" bgcolor="efefef">
						<table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>아이디</b></font>
											</td>
											<td>
												<input type="text" name="id" maxlength = "12" value="${vo.id }" size="20" class="cmfont1" readonly> 
												<%-- <a href="javascript:check_id();"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0"></a> --%>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호</b></font>
											</td>
											<td>
												<input TYPE="password" id="password" name="password" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호 확인</b></font>
											</td>
											<td>
												<input TYPE="password" id="password2" name="password2" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>이 름</b></font>
											</td>
											<td>
												<input type="text" id="name" name="name" maxlength = "10" value = "${vo.name }" size="20" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>생년월일</b></font>
											</td>
											<td>
												<input type="text" name='birth1' id="birth1" size = "4" maxlength = "4" class="cmfont1"> <font color="898989">년</font> 
												<input type="text" name='birth2' id="birth2" size = "2" maxlength = "2" class="cmfont1"> <font color="898989">월</font> 
												<input type="text" name='birth3' id="birth3" size = "2" maxlength = "2" class="cmfont1"> <font color="898989">일</font> 
												<!-- <input type="radio" name='sm' value = "1" checked> <font color="898989">양력</font> 
												<input type="radio" name='sm' value = "2" > <font color="898989">음력</font></td> -->
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>전화 번호</b></font>
											</td>
											<td>
												<input type="text" id="tel1" name='tel1' size = "4" maxlength = "4" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel2" name='tel2' size = "4" maxlength = "4" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel3" name='tel3' size = "4" maxlength = "4" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<input type="text" id="phone1" name='phone1' size = "4" maxlength = "4" value = "${phone1 }" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone2" name='phone2' size = "4" maxlength = "4" value = "${phone2 }" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone3" name='phone3' size = "4" maxlength = "4" value = "${phone3 }" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="50">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td>
												<%-- <input type="text" id="zip1" name='zip1' size = "4" maxlength = "3" value = "762" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="zip2" name='zip2' size = "4" maxlength = "3" value = "634" class="cmfont1"> 
												<a href="javascript:FindZip(0)"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a><br>
												<input type="text" id="address" name='address' size = "50" maxlength = "200" value = "${vo.address }" class="cmfont1"><br> --%>
												<input type="text" id="sample4_postcode" name="zipCode" value="${vo.zipCode }"placeholder="우편번호" readonly>
												<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly><br>
												<input type="text" style="width:250px;"id="sample4_roadAddress" name="address" value="${vo.address }" placeholder="도로명주소" readonly>
												<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly>
												<span id="guide" style="color:#999"></span>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>E-Mail</b></font>
											</td>
											<td>
												<input type="text" id="email" name='email' size = "50" maxlength = "50" value = "${vo.email }" class="cmfont1">
											</td>
										</tr>
									</table>
			
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td height="45" align="right">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" border="0">&nbsp;&nbsp;
						<a href="javascript:form2.reset();"><img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0"></a>
					</td>
				</tr>
			</table>
			</form>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
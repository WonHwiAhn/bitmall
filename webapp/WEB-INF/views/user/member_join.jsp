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
	<script>
	$(function(){
		// 아이디 중복체크
		$('#dup-check').click(function(){
			console.log("click!");
			var id = $("#id").val();
			console.log(id);
			
			if(id == ""){
				return;
			}
			
			var data = {"id": id};
			
			$.ajax({
				url:"${pageContext.servletContext.contextPath }/api/user/checkid",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json",
				success: function(response){
					console.log(response);
					if(response.result != "success"){
						console.log(response.message);
						return;
					}
					if(response.data == "exist"){
						alert('이미 사용중인 아이디입니다.');
						$("#id").val("").focus();
						return;
					}
					
					$("#img-check").show();
					$("#dup-check-img").hide();
				},
				error: function(xhr, status, e){
					console.log(status + ":" + e);
				}
			});
		});
		
		// 중복체크를 하고나서 아이디를 수정할 경우
		$('#id').keypress(function(){
			if($('#img-check').css('display') == 'inline'){
				$("#img-check").hide();
				$("#dup-check-img").show();
			}
		});
		
		/* $('#form-image').click(function(){
			console.log('123123'); */
		$('#form2').submit(function(){ 
				event.preventDefault();
				
				var datas = $(this).serialize();
				
				var data = {};
				
				$.each($(this).serializeArray(), function(idx, vo){
					// vo 자체에 name, value 값을 가진 형태로 들어옴.
					data[vo.name] = vo.value;
					console.log(vo);
				});
				
				// id input 값이 공백일 경우
				if(data['id'] == ''){
					alert('id를 입력해주세요 :)');
			
					$('#id').focus();
					return ;
				}
				
				// id 중복체크를 하지 않은 경우
				if($('#img-check').css('display') == 'none'){
					alert('아이디 중복체크를 해주세요 :)');
			
					return ;
				}
				
				// password1 input 값이 공백일 경우
				if(data['password'] == ''){
					alert('패스워드를 입력해주세요!');
					
					$('#password').focus();
					
					return;
				}
				
				// password2 input 값이 공백일 경우
				if(data['password2'] == ''){
					alert('패스워드 확인을 해주세요 :)');
					
					$('#password2').focus();
					return;
				}
				
				// 패스워드 입력창 2가지 값 비교
				if(data['password2'].length != 0 && data['password'].length != 0){
					if(data['password2'] != data['password']){
						alert('비밀번호와 비밀번호 확인의 값이 다릅니다.');
						$('#password').focus();
						return;
					}
				}
				
				// name input 값이 공백일 경우
				if(data['name'] == ''){
					alert('이름을 입력해주세요!');
					
					$('#name').focus();
					return;
				}
				
				// birthday input 값이 공백일 경우
				if(data['birthday1'] == '' || data['birthday2'] == '' || data['birthday3'] == ''){
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
				
				console.log(JSON.stringify(data));
				
				//// validation을 다 통과할 경우 생년월일, 폰넘버 , zipconde 값을 붙여준다.
				data['birth'] = data['birthday1'] + '-' +
								data['birthday2'] + '-' +
								data['birthday3'] ;
				
				// zipCode 생성
				data['zipCode'] = data['zip1'] + '-' + data['zip2'];
				
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
					url:"/bitmall/api/user/member_join",
					type:"post",
					dataType:"json",
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(response){
						console.log(response);
						if(response.data == 'true'){
							/* $('#form2').attr('action', '/bitmall/user/login');
							$('#form2').submit(); */
							window.location.replace("/bitmall/user/member_joinend");
						}else{
							alert('failed to move page');
						}
					},
					error:function(){
						alert('failed');
					}
				});
				//console.log(datas);
				return ;
			});
		/* }); */
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
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/login_title2.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<form id="form2" name="form2" method="post" action="">
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
												<input type="text" id="id" name="id" maxlength = "12" size="20" class="cmfont1"> 
												<a href="#" id="dup-check"><img id="dup-check-img" align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0"></a>
												<img id="img-check" style="display:none" src="${pageContext.servletContext.contextPath }/assets/images/check.png" />
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
												<input type="text" id="name" name="name" maxlength = "10" value = "" size="20" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>생년월일</b></font>
											</td>
											<td>
												<input type="text" id="birthday1" name='birthday1' size = "4" maxlength = "4" value = "" class="cmfont1"> <font color="898989">년</font> 
												<input type="text" id="birthday2" name='birthday2' size = "2" maxlength = "2" value = "" class="cmfont1"> <font color="898989">월</font> 
												<input type="text" id="birthday3" name='birthday3' size = "2" maxlength = "2" value = "" class="cmfont1"> <font color="898989">일</font> 
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
												<input type="text" id="tel1" name='tel1' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel2" name='tel2' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel3" name='tel3' size = "4" maxlength = "4" value = "" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<input type="text" id="phone1" name='phone1' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone2" name='phone2' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone3" name='phone3' size = "4" maxlength = "4" value = "" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="50">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td>
												<input type="text" id="zip1" name='zip1' size = "4" maxlength = "3" value = "762" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="zip2" name='zip2' size = "4" maxlength = "3" value = "634" class="cmfont1"> 
												<a href="javascript:FindZip(0)"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a><br>
												<input type="text" id="address" name='address' size = "50" maxlength = "200" value = "경기도 안양" class="cmfont1"><br>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>E-Mail</b></font>
											</td>
											<td>
												<input type="text" id="email" name='email' size = "50" maxlength = "50" value = "wzm2@naver.com" class="cmfont1">
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
						<input id="form-image" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" border="0">&nbsp;&nbsp;
						<a href="javascript:form2.reset();"><img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0"></a>
					</td>
				</tr>
			</table>
			</form>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                   	-->
		<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
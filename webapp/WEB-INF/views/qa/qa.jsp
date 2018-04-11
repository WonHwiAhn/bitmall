<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
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
		<td valign="top" align="center">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<!--  현재 페이지 자바스크립  -------------------------------------------->
			<script Language="Javascript">
				function Search_qa()	
				{
					form2.page.value=1;
					form2.submit();
				}
			</script>

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/qa_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/qa_title1.gif" border="0"></td>
				</tr>
				<tr>
					<td align="right" class="cmfont">
						<font color="#686868">게시물:</font>1000 &nbsp;&nbsp; <font color="#686868">페이지:</font>1/100
					</td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr><td colspan="5" height="3" bgcolor="8B9CBF"></td></tr>
				<tr bgcolor="F2F2F2" >
					<td width="90" height="25" align="center">번호</td>
					<td align="center">제목</td>
					<td width="90" align="center">작성자</td>
					<td width="90" align="center">작성일</td>
					<td width="90" align="center">조회</td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">3</font></td>	
					<td><a href="qa_read.jsp?no=1&page=1&sel1=1&text1="><font color="#4186C7">새소식1</font></a></td>	
					<td width="90" align="center"><font color="#686868">홍길동</font></td>	
					<td width="90" align="center"><font color="#686868">2007-01-02</font></td>	
					<td width="90" align="center"><font color="#686868">11</font></td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">4</font></td>	
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/i_re.gif" border="0" align="absmiddle">&nbsp;<a href="qa_read.jsp?no=2&page=1&sel1=1&text1="><font color="#4186C7">Re:새소식1</font></a></td>	
					<td width="90" align="center"><font color="#686868">관리자</font></td>	
					<td width="90" align="center"><font color="#686868">2007-01-02</font></td>	
					<td width="90" align="center"><font color="#686868">13</font></td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">5</font></td>	
					<td>&nbsp;&nbsp;&nbsp;
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_re.gif" border="0" align="absmiddle">&nbsp;<a href="qa_read.jsp?no=3&page=1&sel1=1&text1="><font color="#4186C7">Re:새소식1</font></a>
					</td>	
					<td width="90" align="center"><font color="#686868">관리자</font></td>	
					<td width="90" align="center"><font color="#686868">2007-01-02</font></td>	
					<td width="90" align="center"><font color="#686868">10</font></td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">2</font></td>	
					<td><a href="qa_read.jsp?no=4&page=1&sel1=1&text1="><font color="#4186C7">새소식2</font></a></td>	
					<td width="90" align="center"><font color="#686868">홍길동</font></td>	
					<td width="90" align="center"><font color="#686868">2007-01-01</font></td>	
					<td width="90" align="center"><font color="#686868">12</font></td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868">1</font></td>	
					<td><a href="qa_read.jsp?no=5&page=1&sel1=1&text1="><font color="#4186C7">새소식3</font></a></td>	
					<td width="90" align="center"><font color="#686868">홍길동</font></td>	
					<td width="90" align="center"><font color="#686868">2007-01-01</font></td>	
					<td width="90" align="center"><font color="#686868">10</font></td>
				</tr>

				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td><font color="#4186C7"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td><font color="#4186C7"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td><font color="#4186C7"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td><font color="#4186C7"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>
				</tr>
				<tr><td height="1" bgcolor="#DEDCDD"colspan="5"></td></tr>
				<tr height="25" bgcolor="#FFFFFF">	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td><font color="#4186C7"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>	
					<td width="90" align="center"><font color="#686868"></font></td>
				</tr>

				<tr><td colspan="5" height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<!-- form2 시작 -->
				<form name="form2" method="post" action="qa.jsp">
				<input type="hidden" name="page" value="1">
				<tr>
					<td height="40">&nbsp;
						<select name="sel1" class="cmfont1">
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">작성자</option>
						</select>
						<input type='text' name='text1' size="10" maxlength="20" value="" class="cmfont1">			
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/i_search.gif" align="absmiddle" border="0" onclick="javascript:Search_qa();">
					</td>
					<td align="right">
						<a href="qa_new.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_new.gif" border="0"></a>&nbsp;
					</td>
				</tr>
				</form>
				<!-- form2 끝 -->
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="30" class="cmfont" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_prev.gif" align="absmiddle" border="0"> 
						<font color="#FC0504"><b>1</b></font>&nbsp;
						<a href="qa.jsp?page=2&sel1=&text1="><font color="#7C7A77">[2]</font></a>&nbsp;
						<a href="qa.jsp?page=3&sel1=&text1="><font color="#7C7A77">[3]</font></a>&nbsp;
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_next.gif" align="absmiddle" border="0">
					</td>
				</tr>
			</table>

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
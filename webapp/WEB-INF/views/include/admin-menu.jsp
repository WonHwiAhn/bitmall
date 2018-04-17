<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath }/assets/css/admin_menu.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/paging.css" rel="stylesheet" type="text/css">


<table class="first">
<tr> 
  <td class="td-total">
    <div class="first-div"> 
 	<br>
	 	<table class="second">
	 		<tr>
	    		<td>
	      			<div> 
	        			<table class="third">
	          				<tr> 
	            				<td bgcolor='#F2F2F2'> 
	              					<div> 
	                					<table class="fourth">
	                  						<tr> 
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/admin/member'><font>회원관리</font></a></td>
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/admin/product'><font>상품관리</font></a></td>
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/admin/jumun'><font>주문관리</font></a></td>
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/admin/opt'><font>옵션관리</font></a></td>
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/admin/faq'><font>FAQ관리</font></a></td>
							                    <td><font>▶ </font><a href='${pageContext.servletContext.contextPath}/user/member_logout'><font>로그아웃</font></a></td>
						                  	</tr>
	                					</table>
	              					</div>
	            				</td>
	          				</tr>
	        			</table>
	      			</div>
	    		</td>
	  		</tr>
		</table>
    </div>
    <br>
  </td>
</tr>
</table>
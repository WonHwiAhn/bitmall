<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<title>Html5Around.com</title>
<link rel="stylesheet" href="https://thdoan.github.io/magnify/css/magnify.css">
<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<![endif]-->
<!--[if IE 9]><!-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--<![endif]-->
<script src="https://thdoan.github.io/magnify/js/jquery.magnify.js"></script>
<style>
/* 돋보기 크기 조절용 */
/* magnify .magnify-lens {
  width: 200px;
  height:200px;
}

html {
  width: 100%;
  height: 100%;
  display: table;
}

body {
  width: 100%;
  height: 100%;
  display: table-cell;
  font-family: sans-serif;
  font-size: 12px;
  padding: 1em;
  text-align: center;
  vertical-align: middle;
}

img {
  border: none;
}


#sample-watch {
  width: 100%;
  max-width: 400px;
} */
</style>
<script>
var $zoom;
$(document).ready(function() {
  // 돋보기 기능 생성자
  $zoom = $('.zoom').magnify({
      afterLoad: function() {
        console.log('확대 기동!!!');
      }
    });
});

//기능 끄기 버튼
$('#html5').click(function() {
   $zoom.destroy();
});

//기능 켜기 버튼
$('#around').click(function() {
    $zoom = $('.zoom').magnify({
      afterLoad: function() {
        console.log('확대 기동!!!');
      }
    });
});

//돋보기 사이즈 키우기 버튼
$('#com').click(function(){
	var curSize=parseInt($('.magnify .magnify-lens').css("width"));
	if(curSize > 400) curSize=200; // 맥스 400까지만 
	$('.magnify .magnify-lens').css("width",curSize+40);
	$('.magnify .magnify-lens').css("height",curSize+40);
});


$('html').on({
  magnifystart: function() {
    console.log('\'magnifystart\' 이벤트 발생!');
  },
  magnifyend: function() {
    console.log('\'magnifyend\' 이벤트 발생!');
  }
});
</script>
  </head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<!-- img 태그 src에 작은 이미지, data-magnify-src에 큰 이미지를 링크 -->

<img id="sample-watch" src="http://html5around.com/wordpress/wp-content/uploads/2017/03/html5around_msmall.jpg" alt="Sample image" class="zoom" data-magnify-src="http://html5around.com/wordpress/wp-content/uploads/2017/03/html5around_mbig.jpg">

&nbsp; &nbsp; &nbsp;


<p><br><button id="html5"> 돋보기 기능 끄기 </button>&nbsp;-&nbsp;
	   <button id="around"> 돋보기 기능 켜기 </button><br />
	   <button id="com"> 1클릭에 돋보기 40px크게 400px 까지만... </button>
</p>
</body>
</html>
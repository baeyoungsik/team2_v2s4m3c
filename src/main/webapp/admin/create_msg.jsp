<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet' >
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
     <H2 style='text-align: center;'><span class="logo"  >환영합니다</span></H2><br><br>
  </DIV>
  
  

<!--   <ASIDE style='float: left;'>
      <A href='./member/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>목록</A>
  </ASIDE> 
 -->
 <div class='menu_line'></div>
 
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL style='list-style:none; text-align: center;'>
      <c:choose>
        <c:when test="${param.cnt == 1 }">
          <LI class='li_none' style='text-align: center;'>관리자계정 생성완료.</LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none' style='text-align: center;'>계정 생성에 실패했습니다.</LI>
          <LI class='li_none' style='text-align: center;'>다시한번 시도해주세요.</LI>
          <LI class='li_none' style='text-align: center;'>계속 실패시 ☏ 000-0000-0000 문의해주세요.</LI>
             
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
          <c:choose>
          <c:when test="${param.cnt == 1 }">
             <button type='button' onclick="location.href='./login.do'">로그인(구현x)</button>
             <button type='button' onclick="location.href='./list.do'">등록 확인</button>
          </c:when>
          <c:otherwise>
            <button type='button' onclick="history.back()">다시 시도</button>
          </c:otherwise>
        </c:choose>

      </LI>
     </UL>
  </fieldset>
 
</DIV>

<!-- <DIV class='bottom_menu' style=text-align:center;>
  <button type='button'  onclick="location.hef='./login.do'">로그인</button>

</DIV>
 -->
 
 <!-- bottom -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script src="../css/jquery.min.js"></script>
<script src="../css/material-bootstrap.min.js"></script>
<script src="../js/plugins/swiper/js/swiper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 10,
      loop:true,
      loopFillGroupWithBlank: true,
      // init: false,

      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
          spaceBetween: 10,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 10,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween:10,
        },
      }
    });
  </script>
</body>
</html>
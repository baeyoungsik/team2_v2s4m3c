<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet' >

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="../menu/top.jsp" flush='false' />

  <FORM name='frm' id='frm' method='POST' action='./update.do' 
              onsubmit="return send();" class="form-horizontal">
 
 <div class="wrap">
  <div class="header">
  </div>             
  <div id="my_container" style="height: 1049px;">
    <!-- CONTENTS -->
    <!-- CONTENTS -->
    <div id="my_content" class="section_home">
      <div class="column">

        <!-- 프로필 설정 -->
        <div class="my_group">
          <div class="my_header">
            <h2>프로필</h2>
            <a href="javascript:toggle('profile');" onclick="clickcr(this,'imn.prfhelp','','',event);" class="link_help"><i id="i_profile" class="spico ico_arr3_dn">도움말</i></a>
            <!-- [D] 감추기 보이기 dislay:none/block -->
            <p id="p_profile" class="contxt" style="display:none">
                    네이버에서의 <em>'나'를 표현하는 프로필</em> 정보입니다.
                 <br>
            수정 화면에서 프로필 사진과 별명을 변경하세요.</p>
          </div>
          <div class="my_content">
            <dl class="my_lst">
            <dt class="blind">프로필 사진</dt>
            <dd class="my_pic">
              <a href="#" onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);">
                <img src="https://static.nid.naver.com/images/web/user/default.png" width="80" height="80" alt="">
                <span class="img_frame"></span>
              </a>
            </dd>
            <dt class="blind">&nbsp;</dt>
            <dd class="intro">&nbsp;</dd>
            <dt class="nick">별명</dt>
            <dd class="name">${nickname }</dd>
            </dl>
          </div>
          <p class="btn_area_btm"><a href="#" onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);" class="btn_model"><b class="btn2">수정</b></a></p>
        </div>


        <!-- 배송지 관리 -->
          <div class="my_group">
            <div class="my_header">
              <h2>배송지 관리</h2>
            </div>
            <div class="my_content">
              <p class="contxt">내가 저장한 배송지 및 최근 사용한 배송지를<br> 관리할 수 있습니다.</p>
            </div>
            <p class="btn_area_btm"><a href="https://pay.naver.com/shipping/list" class="btn_model" onclick="clickcr(this,'imn.addcheck','','',event);"><b class="btn2">조회하기</b></a></p>
          </div>
      </div>
      <div class="column">
          <!-- 일반아이디 연락처 -->
          <div class="my_group ">
            <div class="my_header">
              <h2>연락처</h2>
            </div>
            <div class="my_content">
              <dl class="my_lst2">
              <dt>연락처 이메일</dt>
              <dd>na******@n*******.com</dd>
              <dt>본인확인 이메일</dt>
              <dd>wk******@d*******.net</dd>
              <dt>휴대전화</dt>
              <dd>+82 10-7***-9***</dd>
              </dl>
              <dl class="my_lst2 nudge" id="divNudge">
                <dt></dt>
              </dl>
            </div>
            <p class="btn_area_btm"><a href="/user2/help/changeUserInfo.nhn?menu=nid&amp;lang=ko_KR" onclick="clickcr(this,'imn.cntmodify','','',event);" class="btn_model"><b class="btn2">수정</b></a></p>
          </div>
        <!-- 지역 설정 -->
        <div class="my_group">
          <div class="my_header">
            <h2>지역 설정</h2>
            <a href="javascript:toggle('region');" onclick="clickcr(this,'imn.reghelp','','',event);" class="link_help"><i id="i_region" class="spico ico_arr3_dn">도움말</i></a>
            <p id="p_region" class="contxt" style="display:none">
                    네이버 서비스에서 <em>공통으로 사용되는 지역 정보</em>입니다.
                 <br>
              설정되어 있는 모든 지역을 보거나 수정하시려면 설정하기를 클릭하세요.</p>
          </div>
          <div class="my_content">
              <p class="contxt">
                    설정된 지역이 없습니다.<br>지금 내 주변의 관심지역을 설정하세요!
                 </p>
          </div>
          <p class="btn_area_btm"><a href="/user2/help/region.nhn?menu=nid&amp;lang=ko_KR" onclick="clickcr(this,'imn.regmodify','','',event);" class="btn_model"><b class="btn2">설정하기</b></a></p>
        </div>
      </div>


    <div class="resize-triggers"><div class="expand-trigger"><div style="width: 955px; height: 1050px;"></div></div><div class="contract-trigger"></div></div></div>
    <!-- //CONTENTS -->
<script type="text/javascript">
document.getElementById("mainBody").className = "skin_main";
</script>
  </div>
  
 </FORM>
 
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
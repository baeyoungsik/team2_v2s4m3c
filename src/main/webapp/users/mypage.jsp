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
<hr>
<div class="container bootstrap snippet">
    <div class="row">
      <div class="col-sm-10"><h1 style='color:#ff4865; margin:30px auto; '>My Page</h1></div>
<!--       <div class="col-sm-2"><a href="/users" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div> -->
    </div>
    <div class="row">
      <div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>사진 업로드(구현 미정)</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>

                         
          <ul class="list-group">
            <li class="list-group-item text-muted">나의 정보 <i class="fa fa-dashboard fa-1x"></i></li>
            <li style="list-style:none"><a href="#" class="list-group-item text-right" ><strong>플레이리스트</strong></span> 2</a></li>
            <li style="list-style:none"><a href="#" class="list-group-item text-right" ><strong>좋아요 누른 곡</strong></span> 7</a></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>포인트</strong></span>&nbsp;${usersVO.user_point }p</li>
            <li style="list-style:none"><a href="#" class="list-group-item text-right" ><span class="pull-left"><strong>쿠폰</strong>&nbsp;2</span></a></li>
          </ul> 
               
          
        </div><!--/col-3-->
      <div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
              </ul>

              
  <FORM name='frm' id='frm' method='POST' action='./update.do' 
              onsubmit="return send();" class="form-horizontal">
    <input type='hidden' name='userno' id='userno' value='${usersVO.userno }'>          
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        ${usersVO.userID }        
      </div>
    </div>   
                
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_name' id='user_name' 
                   value='${usersVO.user_name }' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   
    
     <div class="form-group">
      <label for="nickname" class="col-md-2 control-label" style='font-size: 0.9em;'>닉네임<span class='text-danger'>*</span></label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='nickname' id='nickname' 
                   value='${usersVO.nickname }' required="required" style='width: 30%;' placeholder="Nickname">
      </div>
    </div>       
 
      <div class="form-group">
      <label class="col-md-2 control-label" >전화번호<span class='text-danger'>*</span></label>
      <div class="form-inline">
        <div class="col-md-10">
        <input type='text' name='user_tel' value='${usersVO.user_tel }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>   
        -
        <input type='text' name='user_tel2' value='${usersVO.user_tel2 }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='user_tel3' value='${usersVO.user_tel3 }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
      </div>
    </div> 
  </div>   

    <div class="form-group">
      <label for="user_email" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일<span class='text-danger'>*</span></label>    
        <div class="form-inline">
      <div class="col-md-10">    
        <input type='text'  name='user_email' id='user_email' 
                   value='${usersVO.user_email }' required="required" class='form-control' style='width: 20%;' placeholder="email">&nbsp;@</input>
        <input type='text'  name='user_email2' id='user_email2' 
                   value='${usersVO.user_email2 }' required="required" class='form-control' style='width: 20%;' placeholder=""/>
        </div>                    
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_zipcode' id='user_zipcode' 
                   value='${usersVO.user_zipcode }'  style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_address1' id='user_address1' 
                   value='${usersVO.user_address1 }'  style='width: 80%;' placeholder="주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_address2' id='user_address2' 
                   value='${usersVO.user_address2 }'  style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>  
      
<%--     <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>쿠폰</label>    
      <div class="col-md-10">
        ${coupon }        
      </div>
    </div>  --%>
 
    <div class="form-group">
      <div class="col-md-12">
 
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('user_address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#user_address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
 
      </div>
    </div>
    
      <div class="form-group">
           <div class="col-md-10">
                <br>
                <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> 저장</button>
                <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> 취소</button>
            </div>
      </div>
 
 
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
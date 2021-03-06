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
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet' >
<script type="text/javascript">
$(function() { // 자동 실행
  // userID가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
  $('#btn_checkID').on('click', checkID);  
  // document.getElementById('btn_checkID').addEventListener('click', checkID); 동일
  $('#btn_DaumPostcode').on('click', DaumPostcode); 
  $('#btn_send').on('click', send); 
});


//이메일 도메인 선택
$("#selectEmailDomain").change(function() {
  var selectEmailDomain = $("#selectEmailDomain").val();
  if(selectEmailDomain == "otherDomains") {
    $("#emailDomain").val("");
    $("#selectEmailDomain").hide();
    $("#emailDomain").show();
  } else {
    $("#emailDomain").val(selectEmailDomain);
  }
  $("#emailDomain").change();
});

//이메일 도메인 변경
$("#emailDomain").change(function() {
  $("#email").blur();
});

function formCheck(obj){ 
  // null 검사
   if(!obj.user_identify.value || obj.user_identify.value.trim().length==0){
    alert('주민등록번호 앞자리를 입력하세요');
    obj.user_identify.value="";
    obj.user_identify.focus();
    return false;
   }
    
  // 글자수 검사
   if(obj.user_identify.value.trim().length !==6){   
    alert('주민등록번호 앞자리는 6자여야 합니다');
    obj.user_identify.value="";
    obj.user_identify.focus();
    return false;
   }
  
  // 숫자 검사

   if(isNaN(Number(obj.user_identify.value))){
    alert('주민등록번호 앞자리는 숫자만 들어갈 수 있습니다 ');
    obj.user_identify.value="";
    obj.user_identify.focus();
    return false;
   }
   
   if(!obj.user_identify2.value || obj.user_identify2.value.trim().length ==0){
    alert('주민등록번호 뒷자리를 입력하세요 ');
    obj.user_identify2.value="";
    obj.user_identify2.focus();
    return false;
   }
   if(obj.user_identify2.value.trim().length !==7){
    alert('주민등록번호 뒷자리는 7자리 입니다');
    obj.user_identify2.value ="";
    obj.user_identify2.focus();
    return false;
   }
   if(isNaN(Number(obj.user_identify2.value))){
    alert('주민번호 뒷자리는 숫자만 넣을 수 있습니다');
    obj.user_identify2.value="";
    obj.user_identify2.focus();
    return false;
   }




$(function(){ 
  $(document).ready(function(){
    $('select[name=emailSelection]').change(function() {
      if($(this).val()=="1"){
        $('#user_email2').val("");
      } else {
        $('#user_email2').val($(this).val());
        $("#user_email2").attr("readonly", false);
      }
    });
  });
});




// jQuery ajax 요청
function checkID() {
  var frm = $('#frm');
  var userID = $('#userID', frm).val();
  var params = '';
  var msg = '';
  
  if($.trim(userID).length == 0) {   // userID 를 입력받지 않은 경우
    msg = 'ID를 입력하세요.<br>ID입력은 필수입니다.<br>ID는 3자이상 권장합니다.';
    $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
    $('#modal_title').html('ID 중복 확인'); // 제목 
    $('#modal_content').html(msg);        // 내용
    $('#modal_panel').modal();              // 다이얼로그 출력
    return false;
  } else {  // when userID is entered
    params = 'userID=' + userID; 
    var params = 'userID=' + $('#userID', frm).val();
    // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    

    $.ajax({
      url: './checkID.do',
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.cnt > 0) {
          $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
          msg = "이미 사용중인 ID 입니다.";
        } else {
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          msg = "사용 가능한 ID 입니다.";
          
          // $.cookie('checkId', 'TRUE'); // Cookie 기록
        }
        
        $('#modal_title').html('ID 중복 확인'); // 제목 
        $('#modal_content').html(msg);        // 내용
        $('#modal_panel').modal();              // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    
    // 처리중 출력
/*     var gif = '';
    gif +="<div style='margin: 0px auto; text-align: center;'>";
    gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
    gif +="</div>";
    
    $('#panel2').html(gif);
    $('#panel2').show(); // 출력 */
  }
    
  }
  
    function send() {
    if ($('#userpw').val() != $('#userpw2').val()) {
      msg = '입력된 패스워드가 일치하지 않습니다.<br>';
      msg += "패스워드를 다시 입력해주세요.<br>"; 
      
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      
      return false; // submit 중지
    }

    $('#frm').submit();
  }  
</script>
<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
 <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
<div class="wrap_create">

    <div class= "header_create">  
      <H1><span class="login_logo" >회원 가입</span></H1> 
   </div>
   
  <FORM id='join_form' method='POST' action='./create.do' >
  
  <div class='container_create'>
    
    <div class='content_create'>
      <div class='join_content'>
      <div class='row_group'>
        <div class="join_row">
           <h3 class="join_title"><label for="userID">아이디</label></h3>
                <span class="ps_box int_id">                  
                   <input type="text" id="userID" name="userID"  class="int" title="ID" required="required" placeholder="아이디" autofocus="autofocus">               
                </span>
                              
        <button type='button' id="btn_checkID" class="btn btn-info" >중복확인</button>  
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->  
       
       <span class="error_next_box" id="idMsg" style="" aria-live="assertive">필수 정보입니다.</span>
        </div>
     
     
     <div class="join_row">
        <h3 class="join_title"><label for="userpw">비밀번호</label></h3>
        <span class="ps_box int_id" id="userpw">
           <input type="password" id="userpw" name="userpw" class="int" title="비밀번호 입력" placeholder="비밀번호"maxlength="20">
               <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
        </span>
              <span class="error_next_box" id="pswd1Msg" style="display:none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

            <h3 class="join_title"><label for="userpw2">비밀번호 재확인</label></h3>
               <span class="ps_box int_id" id="userpw2">
              <input type="password" id="userpw2" name="userpw2" class="int" placeholder="비밀번호 재확인" title="비밀번호 재확인 입력"  maxlength="20">
              
            </span>
            <span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
                        <span class="error_next_box" id="pswd2Msg" style="" aria-live="assertive">필수 정보입니다.</span>
       </div>
                
      <div class='row_group'>
        <div class="join_row">
           <h3 class="join_title"><label for="user_name">이름</label></h3>
                <span class="ps_box int_id">                  
                   <input type="text" id="user_name" name="user_name" placeholder="이름"  class="int" title="이름" required="required" >               
                </span>               
       </div>   
    </div>

    
      <div class='row_group'>
        <div class="join_row">
           <h3 class="join_title"><label for="nickname">별명</label></h3>
                <span class="ps_box int_id">                  
                   <input type="text" id="nickname" name="nickname" placeholder="닉네임"  class="int" title="닉네임" required="required" >               
                </span>               
       </div>       
    </div>
 
       <div class='row_group'>
        <div class="join_row">
           <h3 class="join_title"><label for="user_identify">주민등록번호</label></h3>
            <div class="form-inline" >                  
                   <input type="text" name="user_identify" id="user_identify"  class='form-control' style='text-align: center;' title="주민등록번호" required="required" minlength='6' maxlength="6" placeholder="******" >&nbsp;─&nbsp;</input>               
                   <input type="password"  name="user_identify2" id="user_identify2" class='form-control'  minlength='7' maxlength="7"  ></input> 
                </div>              
       </div>     
   
       <div class='row_group'>
        <div class="join_row">
           <h3 class="join_title"><label for="user_email">이메일</label></h3>
            <div class="form-inline" >                  
                   <input type='text'  name='user_email' id='user_email' 
                   value='' required="required" class='form-control'  placeholder="email">&nbsp;@&nbsp;</input>
               <select id="user_email2" name="emailSelection" class='form-control'> 
                  <option value="1" selected="selected"  >도메인 선택</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="lycos.co.kr">lycos.co.kr</option>
                  <option value="empal.com">empal.com</option>
                  <option value="cyworld.com">cyworld.com</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="paran.com">paran.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="otherDomains" boxview="true">직접 입력</option>
               </select>    
               <input type="email2" id="user_email2" name="emailSelection" class="emailInput" value="" style="display: none"/>
            </div>              
       </div>   
       
      

        
        
      <div class="form-group">
      <label class="col-md-2 control-label" >전화번호(인증넣어서 다시하기)<span class='text-danger'>*</span></label>
      <div class="form-inline">
        <div class="col-md-10">
        <input type='text' name='user_tel' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>   
        -
        <input type='text' name='user_tel2' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='user_tel3' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
      </div>
    </div> 
  </div> 

    <div class="form-group">
      <label for="user_zipcode" class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_zipcode' id='user_zipcode' 
                   value='' style='width: 30%;' placeholder="우편번호">
        <input type="button" id="btn_DaumPostcode" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  

    <div class="form-group">
      <label for="user_address1" class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_address1' id='user_address1' 
                   value='' style='width: 80%;' placeholder="주소">
      </div>
    </div>   

    <div class="form-group">
      <label for="user_address2" class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='user_address2' id='user_address2' 
                   value='' style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   

    <div class="form-group">
      <div class="col-md-12">

<!-- ---------- DAUM 우편번호 API 시작 ---------- -->
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
<!-- ---------- DAUM 우편번호 API 종료 ---------- -->

      </div>
    </div>
    

    <div class="form-group">
        <button type="button" id='btn_send'  class="btn_create">가입완료</button>
       <!--  <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button> -->
   </div>
  </div>
  </div>

    
    </div>
    </div>
    </div>
    </div>
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
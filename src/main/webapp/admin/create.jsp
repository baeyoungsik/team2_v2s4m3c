<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="admin-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
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
  // adminID가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
  $('#btn_checkID').on('click', checkID);  
  // document.getElementById('btn_checkID').addEventListener('click', checkID); 동일
  $('#btn_send').on('click', send); 
});

$(function(){ 
  $(document).ready(function(){
    $('select[name=emailSelection]').change(function() {
      if($(this).val()=="1"){
        $('#admin_email2').val("");
      } else {
        $('#admin_email2').val($(this).val());
        $("#admin_email2").attr("readonly", false);
      }
    });
  });
});



// jQuery ajax 요청
function checkID() {
  var frm = $('#frm');
  var adminID = $('#adminID', frm).val();
  var params = '';
  var msg = '';
  
  if($.trim(adminID).length == 0) {   // adminID 를 입력받지 않은 경우
    msg = 'ID를 입력하세요.<br>ID입력은 필수입니다.<br>ID는 3자이상 권장합니다.';
    $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
    $('#modal_title').html('ID 중복 확인'); // 제목 
    $('#modal_content').html(msg);        // 내용
    $('#modal_panel').modal();              // 다이얼로그 출력
    return false;
  } else {  // when adminID is entered
    params = 'adminID=' + adminID; 
    var params = 'adminID=' + $('#adminID', frm).val();
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
    if ($('#adminpw').val() != $('#adminpw2').val()) {
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
<jsp:include page="../menu/top.jsp" flush='false' />
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
  

<HR style='padding-left:30px;'>
  <H2 style='text-align: center;'><span class="logo" >관리자 계정생성</span></H2>
  <H4 ><span class='text-danger'>*</span> : 필수 입력  </H4>


  <div class='menu_line'></div>
  
  <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">

    <div class="form-group">
      <label for="adminID" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디<span class='text-danger'>*</span></label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='adminID' id='adminID' value=''  style='width: 30%;' placeholder="아이디" required="required" autofocus="autofocus">
        <button type='button' id="btn_checkID" class="btn btn-info btn-md">중복확인</button>
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>
                
    <div class="form-group">
      <label for="adminpw" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드<span class='text-danger'>*</span></label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='adminpw' id='adminpw' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   

    <div class="form-group">
      <label for="adminpw2" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드 확인<span class='text-danger'>*</span></label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='adminpw2' id='adminpw2' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
    
    <div class="form-group">
      <label for="admin_name" class="col-md-4 control-label" style='font-size: 0.9em;'>성명<span class='text-danger'>*</span></label>    
      <div class="col-md-8">
        <input type='text' class="form-control" name='admin_name' id='admin_name' 
                   value='' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>
    
    

    <div class="form-group">
      <label for="admin_email" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일<span class='text-danger'>*</span></label>    
        <div class="form-inline">
      <div class="col-md-10">    
        <input type='text'  name='admin_email' id='admin_email' 
                   value='' required="required" class='form-control' style='width: 20%;' placeholder="email">&nbsp;@</input>
        <input type='text'  name='admin_email2' id='admin_email2' 
                   value='' required="required" class='form-control' style='width: 20%;' placeholder=""/>
    <select id="emailSelection" name="emailSelection" class='form-control'>
      <option value="1" selected="selected"  >직접입력</option>
      <option value="naver.com">naver.com</option>      
      <option value="gmail.com">gmail.com</option>
      <option value="daum.net">daum.net</option>      
      <option value="hanmail.net">hanmail.net</option>
    </select>
        </div>                    
      </div>
    </div>
 
    
      <div class="form-group">
      <label class="col-md-2 control-label" >전화번호<span class='text-danger'>*</span></label>
      <div class="form-inline">
        <div class="col-md-10">
        <input type='text' name='admin_tel' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>   
        -
        <input type='text' name='admin_tel2' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='admin_tel3' value='' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
      </div>
    </div> 
  </div> 


    <div class="form-group">
      <label for="admin_role" class="col-md-2 control-label" style='font-size: 0.9em;'>관리자 역할<span class='text-danger'>*</span></label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='admin_role' id='admin_role' 
                   value='' style='width: 40%;' placeholder="관리자 역할">
      </div>
    </div>   

    <div class="form-group">
      <label for="admin_power" class="col-md-2 control-label" style='font-size: 0.9em;'>관리자 권한 범위<span class='text-danger'>*</span></label>    
      <div class="col-md-10">  
     <select id="admin_power" name="admin_power" class='form-control' style='width:10%;'> 
      <option value="1">1</option>      
      <option value="2">2</option>
      <option value="3">3</option>      
    </select> 
      </div>
    </div>   


    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">가입</button>
        <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button>

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
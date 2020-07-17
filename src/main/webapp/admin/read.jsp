<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="admin-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
  <DIV class='title_line'>
    <H2 style='text-align: center;'>정보 조회 및 수정</H2>
  </DIV>
    
  <!-- 
  <ASIDE style='float: left;'>
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
  
  <DIV id='main_panel'></DIV>
 
  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal END -->
    
  <FORM name='frm' id='frm' method='POST' action='./update.do' 
              onsubmit="return send();" class="form-horizontal">
    <input type='hidden' name='adminno' id='adminno' value='${adminVO.adminno }'>          
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        ${adminVO.adminID }        
      </div>
    </div>   
                
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='admin_name' id='admin_name' 
                   value='${adminVO.admin_name }' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   
    
 
      <div class="form-group">
      <label class="col-md-2 control-label" >전화번호<span class='text-danger'>*</span></label>
      <div class="form-inline">
        <div class="col-md-10">
        <input type='text' name='admin_tel' value='${adminVO.admin_tel }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>   
        -
        <input type='text' name='admin_tel2' value='${adminVO.admin_tel2 }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='admin_tel3' value='${adminVO.admin_tel3 }' required="required"  class='form-control'  style='width: 15%;' minlength='3' maxlength='4'>
      </div>
    </div> 
  </div>   

    <div class="form-group">
      <label for="admin_email" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일<span class='text-danger'>*</span></label>    
        <div class="form-inline">
      <div class="col-md-10">    
        <input type='text'  name='admin_email' id='admin_email' 
                   value='${adminVO.admin_email }' required="required" class='form-control' style='width: 20%;' placeholder="email">&nbsp;@</input>
        <input type='text'  name='admin_email2' id='admin_email2' 
                   value='${adminVO.admin_email2 }' required="required" class='form-control' style='width: 20%;' placeholder=""/>
        </div>                    
      </div>
    </div>  
    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>직책</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='admin_role' id='admin_role' 
                   value='${adminVO.admin_role }' required="required" style='width: 15%;' placeholder="직책">     
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>권한</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='admin_power' id='admin_power' 
                   value='${adminVO.admin_power }' required="required" style='width: 5%;' placeholder="권한">     
      </div>
    </div> 
 

    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">저장</button>
        <button type="button" onclick="history.back()" class="btn btn-primary btn-md">취소</button>
 
      </div>
    </div>   
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
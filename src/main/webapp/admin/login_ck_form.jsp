<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>SolMusic : 로그인</title>

<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet'
  type='text/css'>
<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet'>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
  function loadDefault() {
    $('#adminID').val('admin1');
    $('#adminpw').val('1234');
  }
</script>

</head>

<body>
  <%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>



  <FORM name='frm' method='POST' action='./login1.do'
    class="form-horizontal">

    <DIV class="header" style='height:150px;'>
      <H1>
        <a href="${root}"><span class="login_logo">SolMusic</span></a>
      </H1>
    </DIV>

    <div class="title" aria-live="assertive">
      <p></p>
    </div>

    <div class="form-group" style='text-align: center;'>
      <label class="col-md-1 control-label" style='font-size: 0.8em;'>관리자 아이디</label>
      <input type='text' name='adminID' id='adminID' value='${ck_id }'
        required="required" placeholder="아이디" autofocus="autofocus">
      <Label> <input type='checkbox' name='id_save' value='Y'
        ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
      </Label>
    </div>


    <div class="form-group" style='text-align: center;'>
      <label class="col-md-1 control-label" style='font-size: 0.8em;'>관리자 패스워드</label>
      <input type='password' name='adminpw' id='adminpw'
        value='${ck_passwd }' required="required" placeholder="패스워드">
      <Label> <input type='checkbox' name='passwd_save'
        value='Y' ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }>
        저장
      </Label>
    </div>

    <div class="form-group" style='text-align: center;'>
      <div class="col-md-offset-8 col-md-12">
        <button type="submit" class="btn_login">관리자 로그인</button>
      </div>
    </div>

    <div class="find_info">
      <a href='${root }/admin/create.do'>관리자 생성</a> 
        <span class="bar" aria-hidden="true">|</span> <a target="_blank"
        id="pwinquiry" onclick="loadDefault();">테스트계정</a>
        <span class="bar" aria-hidden="true">|</span> 
        <a href=${root }/users/login.do>회원 로그인</a>
    </div>
  </FORM>
  </DIV>


  <jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>
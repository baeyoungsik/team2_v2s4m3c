<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="admin-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>관리자 계정 목록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
<c:set var="root" value="${pageContext.request.contextPath}"/>
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
 
  <DIV class='title_line'>
     <H2 style='text-align: center;'>
     <a href="${root }/admin/list.do"><span class="login_logo" >관리자  목록</span></a></H2>
  </DIV>
  

  
  <ASIDE style='float: right;'>
    <a href="${root}">홈</A>
    <span class='menu_divide' >│</span> 
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>관리자 생성</A>
    <span class='menu_divide' >│</span> 
    <a href="${root }/users/list.do" class="logo" style='font-weight: 800;'>회원 목록</a>
  </ASIDE> 
 
  <div class='menu_line'></div>
  
 
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 12%;'/>    
    <col style='width: 15%;'/>
    <col style='width: 6%;'/>
    <col style='width: 6%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>이메일</TH>
    <TH class='th'>직책</TH>
    <TH class='th'>권한</TH>        
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
  <c:forEach var="adminVO" items="${list }">
    <c:set var="adminno" value ="${adminVO.adminno}" /> 
  <TR>
    <TD class='td'>${adminno}</TD>
    <TD class='td'><A href="./read.do?adminno=${adminno}">${adminVO.adminID}</A></TD>
    <TD class='td'><A href="./read.do?adminno=${adminno}">${adminVO.admin_name}</A></TD> 
    <TD class='td'>${adminVO.admin_tel}-${adminVO.admin_tel2}-${adminVO.admin_tel3}</TD>
    <TD class='td'>${adminVO.admin_email}@${adminVO.admin_email2}</TD>
    <TD class='td'>${adminVO.admin_role}</TD>
    <TD class='td'>${adminVO.admin_power}</TD>        
    <TD class='td'>${adminVO.admin_date.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./passwd_update.do?adminno=${adminno}"><span class="glyphicon glyphicon-random">패스워드 변경</span></A><br>
      <A href="./read.do?adminno=${adminno}"><span class="glyphicon glyphicon-pencil">수정</span></A>
      <A href="./delete.do?adminno=${adminno}"><span class="glyphicon glyphicon-remove">삭제</span></A>
    </TD>
    
  </TR>
  </c:forEach>
  
</TABLE>
 
<DIV class='bottom_menu' style=text-align:center;>
  <button type='button' onclick="location.href='./create.do'">새 계정등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
  <button type='button' onclick="location.href='${root}'">홈으로</button>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
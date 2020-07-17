<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>

 <%--  <DIV class='title_line'>
   ${cateVO.name }
  </DIV> --%>
  
  <form name='frm' id='frm' method='get' action='./list1.do'>
    <input type='hidden' name='userno' value='${usersVO.userno }'>
    
   <ASIDE style='float: right;'>
    <a href="${root}">홈</A>
    <span class='menu_divide' >│</span> 
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <a href="${root }/admin/list.do" class="logo" style='font-weight: 800;'>관리자 목록</a>
  </ASIDE> 
    
    <ASIDE style='float: left;'>
    <%--   ${categrpVO.name } > ${cateVO.name }   --%>
      <c:choose>
        <c:when test="${param.word != '' }">   <%-- 검색하는 경우 --%>
          '${param.word }'  ${search_count } 건 검색됨.
        </c:when>
        <c:otherwise>  <%-- 검색하지 않는 경우 --%>
          > ${search_count } 건 등록됨.
        </c:otherwise>
      </c:choose>
    </ASIDE>
    <ASIDE style='float: right;'>
      <A href="./create.do?userno=${usersVO.userno }">등록</A>
      <span class ='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>
      
      <c:choose>
        <c:when test="${param.word != '' }">   <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 35%;'>
        </c:when>
        <c:otherwise>  <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 35%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list1.do?userno=${usersVO.userno}&word='">검색 취소</button>  
      </c:if>
      
      
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
  
  <div style='width: 100%;'>
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 7%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 16%;'/>
    <col style='width: 7%;'/>
    <col style='width: 13%;'/>
    <col style='width: 12%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>이메일</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>포인트</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
  <c:forEach var="usersVO" items="${list }">
    <c:set var="userno" value ="${usersVO.userno}" /> 
  <TR>
    <TD class='td'>${userno}</TD>
    <TD class='td'><A href="./read.do?userno=${userno}">${usersVO.userID}</A></TD>
    <TD class='td'><A href="./read.do?userno=${userno}">${usersVO.user_name}</A></TD>
    <TD class='td'>${usersVO.nickname}</TD>    
    <TD class='td'>${usersVO.user_tel}-${usersVO.user_tel2}-${usersVO.user_tel3}</TD>
    <TD class='td'>${usersVO.user_email}@${usersVO.user_email2}</TD>
    <TD class='td'>
      <c:choose>
        <c:when test="${usersVO.user_address1.length() > 20 }"> <!-- 긴 주소 처리 -->
          ${usersVO.user_address1.substring(0, 20) }...
        </c:when>
        <c:otherwise>
          ${usersVO.user_address1}
        </c:otherwise>
      </c:choose>
    </TD>
    <TD class='td'>${usersVO.user_point}</TD>
    <TD class='td'>${usersVO.user_date.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./passwd_update.do?userno=${userno}"><span class="glyphicon glyphicon-random">패스워드 변경</span></A><br>
      <A href="./read.do?userno=${userno}"><span class="glyphicon glyphicon-pencil">수정</span></A>
      <A href="./delete.do?userno=${userno}"><span class="glyphicon glyphicon-remove">삭제</span></A>
    </TD>
    
  </TR>
  </c:forEach>
  
</TABLE>
    <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
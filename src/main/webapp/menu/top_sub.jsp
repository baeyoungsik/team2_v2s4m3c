<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//String root = request.getContextPath(); resort추력
// ${pageContext.request.contextPath} 스프링식 방법
%>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- 화면 사이드 메뉴 -->
<div id="sidebar" class="sidenav sidenav-fixed expand-md">
  <div class="sidenav-header">
    <div class="font-26 font-weight-strong mt-2">
      <a href="${root}"><span class="logo">SolMusic</span></a>
    </div>
  </div> <!--logo END  -->
    
  <div class="divider"></div>
  <form action="javascript:;">
    <div class="input-group-icon input-group-icon-right">
      <button type="submit" class="btn btn-icon-only btn-flat btn-rounded input-icon input-icon-right mr-2">
        <span class="material-icons" style="font-size:24px">search</span>
      </button>
      <input class="form-control form-control-line border-0" type="text" placeholder="Search" style="padding-left:30px">
    </div>
  </form><!-- 검색 END--> 
    
  <div class="divider"></div>
    <ul class="collapsible collapsible-accordion">
      <li>
    <c:choose>
        <c:when test="${sessionScope.adminID == null}">
          <a href='${root}/users/login.do'><span class="fas fa-user-circle fa-lg" style="margin-right:10px;"> </span>로그인</a>
        </c:when>
        <c:otherwise>
        <li>
          <A href='#' class="collapsible-header waves-effect" ><span class="fas fa-user-circle fa-lg" style="margin-right:10px;"> </span>${sessionScope.admin_name }<i class="material-icons rotate-icon">keyboard_arrow_down</i></A> 
           <div class="collapsible-body">
              <ul>
                <li><a href='${root}/users/list.do'>회원 관리</a></li>              
                <li><a href='${root}/admin/read.do?adminno=${adminno}'>My Page</a></li>
                <li><a href='${root}/admin/logout.do'>로그아웃</a></li>          
              </ul>
           </div>
        </li>
        </c:otherwise>
    </c:choose>
      </li>    
    </ul><!-- 로그인 END--> 
    <ul class="collapsible collapsible-accordion">
    <div class="divider"></div>
    
      <li><a class="#" href="#"><i class="fas fa-home" style="margin-right:10px;"></i>투데이</a></li>
      <li><a href="#" class="waves-effect"><i class="far fa-chart-bar" style="margin-right:10px;"></i>솔차트</a></li>
      <li><a href="#" class="waves-effect"><i class="fas fa-headphones-alt" style="margin-right:10px;"></i>아티스트</a></li>
      <li><a href="#" class="waves-effect"><i class="fas fa-compact-disc" style="margin-right:10px;"></i>앨범</a></li>
      <li><a href="#" class="waves-effect"><i class="fab fa-youtube" style="margin-right:10px;"></i>뮤직비디오</a></li>
      <li><div class="divider"></div></li>
      <li><a href="#" class="waves-effect"><i class="fas fa-gift" style="margin-right:10px;"></i>이벤트</a></li>
      <li><a href="#" class="waves-effect"><i class="far fa-address-card" style="margin-right:10px;"></i>이용권</a></li>
      <li><a href="#" class="waves-effect"><i class="fas fa-ticket-alt" style="margin-right:10px;"></i>쿠폰</a></li>
      <li><a href="#" class="waves-effect"><i class="fas fa-shopping-cart" style="margin-right:10px;"></i>장바구니</a></li>    
      <li><div class="divider"></div></li>

      <li>   
        <a href="#" class="collapsible-header waves-effect">고객센터<i class="material-icons rotate-icon">keyboard_arrow_down</i></a>
        <div class="collapsible-body">
          <ul>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">QnA</a></li>          
          </ul>
        </div>
      </li>
           
     
    </ul>
</div><!-- 화면 사이드 메뉴 END -->
  
<div class="content">
  <nav class="navbar navbar-expand fixed-top navbar-light"> <!-- navbar 토글 -->
    <a class="navbar-icon waves-effect waves-light mr-3 d-md-none" data-toggle="sidebar" data-target="#sidebar" href="javascript:;"><i class="material-icons">menu</i></a>
    <!--      
    <div class="collapse navbar-collapse" id="navbarNav">
      <div class="ml-auto">
        <a class="navbar-icon waves-effect waves-light" href="javascript:;" data-toggle='tooltip' title='Navbar icon'><i class="material-icons">search</i></a>
        <a class="navbar-icon waves-effect waves-light" href="javascript:;" data-toggle='tooltip' title='Navbar icon'><i class="material-icons">more_vert</i></a>
      </div>
    </div> -->
  </nav>
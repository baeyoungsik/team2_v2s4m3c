<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
<link href="./css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./js/plugins/swiper/css/swiper.min.css" rel='Stylesheet' >

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<div class="container-fluid" style="padding: 25px 50px">
<div class="row">
  <div class="col-sm-8">
  <div class="heading" ><h1 class="chart">곡차트</h1>
    <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
    <div class="table-responsive text-nowrap"> 
      <table class="table">
        <colgroup>
          <col width="5%">
          <col width="10%">
          <col width="35%">
          <col width="25%">
          <col width="15%">
          <col width="10%">
        </colgroup>
        <thead>
          <tr>
          <th scope="col"><span  class="blind">순위</span></th>
          <th scope="col"><span  class="blind">이미지</span></th>
          <th scope="col"><span  class="blind">제목</span></th>
          <th scope="col"><span  class="blind">가수</span></th>
          <th scope="col"><span  class="blind">앨범명</span></th>
          <th scope="col"><span  class="blind">기타</span></th>
          </tr>
        </thead>
        <tbody>
        <tr>
          <td class="rank">Cell</td>
          <td class="thumb">Cell</td>
          <td class="song">Cell</td>
          <td class="artist">Cell</td>
          <td class="album">Cell</td>
          <td class="option">Cell</td>
         </tr>     
         </tbody>
      </table>
    </div> 
  </div><!-- col-sm-8 END -->
 
  <div class="col-sm-4">
    <div class="heading-album">
      <h1 class="album">앨범</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>    
    </div>
    <div class="album-box">
      <div id="carouselElbumCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselElbumCaptions" data-slide-to="0" class="active"></li>
          <li data-target="#carouselElbumCaptions" data-slide-to="1"></li>
          <li data-target="#carouselElbumCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="https://image.bugsm.co.kr/album/images/1000/203228/20322838.jpg" alt="First slide">
            <div class="carousel-caption d-none d-md-block">
              <h5>앨범명1</h5>
              <p>가수이름1</p>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="https://image.bugsm.co.kr/album/images/1000/203239/20323954.jpg" alt="Second slide">
            <div class="carousel-caption d-none d-md-block">
              <h5>앨범명2</h5>
              <p>가수이름2</p>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="https://image.bugsm.co.kr/album/images/1000/203237/20323788.jpg" alt="Third slide">
            <div class="carousel-caption d-none d-md-block">
              <h5>앨범명3</h5>
              <p>가수이름3</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselElbumCaptions" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselElbumCaptions" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div><!-- carousel slide END -->
    </div>
  </div><!-- col-sm-4 END -->
</div><!--row END -->
</div><!--container END -->

<!-- 이벤트  -->
<div class="container-fluid">
<div class="row">
  <div class="event">
    <img src="./images/event.PNG">
  </div>
</div>
</div>

<!-- 아티스트 -->
<!-- Swiper -->
<div class="artist-container-fluid"> 
  <div class="heading-artist">
    <h1>아티스트</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="swiper-container">
    <div class="swiper-wrapper">
    
      <div class="swiper-slide">
        <div class="box">
          <div class="box_img">
            <img alt="" src="./images/artist/artist1.png" >
          </div>
          <div class="box_text">
            <h3><a href="#">아무개</a></h3>
          </div>
        </div>
      </div>
      
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist2.png" >
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
        </div>
        </div>
        
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist3.png" >
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
          </div>
          </div>
          
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist4.png">
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
        </div>
        </div>
        
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist5.png">
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
          </div>       
        </div>
        
        <div class="swiper-slide">Slide 6</div>
        <div class="swiper-slide">Slide 7</div>
        <div class="swiper-slide">Slide 8</div>
        <div class="swiper-slide">Slide 9</div>
        <div class="swiper-slide">Slide 10</div>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    </div><!--swiper-container END -->
</div><!-- artist container END -->

<!-- 뮤직비디오 --> 
<div class="mv-container-fluid" style="padding: 5px 50px">
  <div class="heading-mv">
    <h1>뮤직비디오</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="mv-gallery">
    <div class="row">
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="https://www.youtube.com/watch?v=TgOu00Mf3kI">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/949/50219949_20200506155515_640.jpg/melon/resize/350/quality/80/optimize">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="https://www.youtube.com/watch?v=Raj-AuQgCTg">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/869/50219869_20200504144916_640.jpg/melon/resize/350/quality/80/optimize">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/624/50219624_20200427160545_640.jpg/melon/resize/350/quality/80/optimize">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/879/50219879_20200504162933_640.jpg/melon/resize/350/quality/80/optimize" alt="">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/20/026/50220026_20200507160518_640.jpg/melon/resize/350/quality/80/optimize" alt="">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/776/50219776_20200429161506_640.jpg/melon/resize/350/quality/80/optimize" alt="">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/18/927/50218927_20200413165815_640.jpg/melon/resize/350/quality/80/optimize" alt="">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <a class="mvbox" href="#">
          <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/607/50219607_20200427143324_640.jpg/melon/resize/350/quality/80/optimize" alt="">
        </a>
        <div class="box_text">
          <h3><a href="#">제목</a><span><a href="#">가수</a></span></h3>   
        </div>
      </div>
    </div><!-- row END -->      
</div><!-- mv-gallery END-->
</div><!-- mv-container-fluid END-->


<!--  장르 -->
<div class="genre-container-fluid" style="padding: 5px 50px">
  <div class="heading-genre">
    <h1>장르</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="genre">
    <div class="row">
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">발라드</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">댄스</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">아이돌</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">인디</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">랩/힙합</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">락/메탈</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">알앤비/소울</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <a href="">일렉트로닉</a>
        </div>
      </div>
    </div> <!-- row END -->
  </div><!-- genre END -->
 </div><!-- genre-container-fluid END -->
 
 
 <!-- bottom -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<script src="./css/jquery.min.js"></script>
<script src="./css/material-bootstrap.min.js"></script>
<script src="./js/plugins/swiper/js/swiper.min.js"></script>
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
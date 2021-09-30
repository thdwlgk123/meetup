<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="user"><sec:authentication property="principal"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>secmainpage</title>
    <!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous" >
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/css/carousel.css">
<style>
/* 폰트적용 */
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
  font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body,

ul,
li {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}

/* 라이브러리 */
.con {
  margin-left: auto;
  margin-right: auto;
}

.line-height-0 {
  line-height: 0;
}

.line-height-0 > * {
  line-height: normal;
}

.inline-block {
  display: inline-block;
}

.block {
  display: block;
}

.text-align-center {
  text-align: center;
}

.img-box > img {
  display: block;
  width: 100%;
}

.cell {
  float: left;
  box-sizing: border-box;
}

.cell-right {
  float: right;
  box-sizing: border-box;
}

.row::after {
  content: "";
  display: block;
  clear: both;
}
/* 커스텀 */
.con {
  width: 1100px;
}
/* 탑 바 메뉴 박스1 */
.top-bar{
   min-width:1100px;
}
.top-bar > .menu-box-1 > ul > li > div{
    position:absolute;
    background-color:#009aa5;
    left:0;
    right:0;
    color:white;
    transition: height 0.3s;
    height:0;
    overflow:hidden;
}
.top-bar > .menu-box-1  ul > li:hover > div{
    overflow:visible;
   height:60px;
}
.top-bar > .menu-box-1 > ul > li > div > div > ul{
    margin-left:300px;
}
.top-bar > .menu-box-1 > ul > li > div > div > ul > li > a{
    padding:16px 35px;
    border-bottom:3px solid transparent;
    transition: 0.3s;
}
.top-bar > .menu-box-1 > ul > li > div > div > ul > li:hover > a{
    border-bottom-color: white
}
.top-bar > .menu-box-1 > ul > li > a {
  padding:36px 30px;
  transition: 0.2s;
}
.top-bar > .menu-box-1 > ul > li:hover > a{
    color: #009aa5;
}
.icon-1{
    position:absolute;
    top:0;
    margin-left:130px;
    margin-top:-15px;
    color:#009aa5;
}
.last-box {
    margin-top:36px;
    margin-right:100px;
}
.point-box{
    margin-left:30px;
    margin-top:-30px;
}
.point-box > .point-1{
    color:#009aa5;
    font-size:12px;
}
.point-box > .point-2 {
    margin-left:20px;
    border:2px solid #eee; 
    border-radius:10px;
    padding:7px 10px;
    transition: 0.2s;
    font-size:12px;
}
.point-box > .point-2:hover{
    border:2px solid #009aa5;
    color: #009aa5;
}
</style>
</head>
<body>
   <nav class="navbar navbar-default" style="background-color:#F3F9F9;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">TeamProject</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/security/mainpage">HOME <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
      </ul>
	      <c:choose>
	      <c:when test="${user eq 'anonymousUser'}">
	     	<ul class="nav navbar-nav navbar-right">
	        <li><a href="/security/loginpage">로그인</a></li>
	       	<li><a id="gnbJoin" href="/security/joinForm" >회원가입</a></li>
	      	</ul>
	      </c:when>
	      <c:otherwise> 
	      	<c:set var="user"><sec:authentication property="principal.Username"/></c:set>
	      	<ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	        <li><a href="#" class="point "><img src="http://www.icounseling.co.kr/images/icon_mypage.jpg" alt=""></a></li>
	        <li>
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><sec:authentication property="principal.Username"/> 님 환영합니다<span class="caret"></span></a>	        
	         	<ul class="dropdown-menu">
	            <li><a href="/mypage/mp">마이페이지 이동</a></li>
	            <li><a href="#">회원정보 수정</a></li>
	            <li><a href="#">비밀번호 변경</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="/logout">로그아웃</a></li>
	          </ul></li>
	        </li>
			</ul>
	      </c:otherwise>
	      </c:choose>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
	<div class="container">
    <div class="row">  
    


<div class="top-bar con row">
    <nav class="menu-box-1">
      <ul class="row" style="margin-left: auto; margin-right: auto;">
          <li class="cell"><a href="/view/allclassview" class="block">전체 클래스 목록보기</a></li>
          <li class="cell"><a href="/view/meetupwriteview" class="block">클래스 개설하기</a></li>
          <li class="cell"><a href="#" class="block">프로그램</a></li>
          <li class="cell"><a href="#" class="block">상담후기</a></li>
      </ul>
  </nav>
</div>

    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img class="first-slide" src="https://cfile1.onoffmix.com/attach/x9zrIVdy4eASnqaRCXYpLWEhogPMGiZU" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1></h1>
              <p></p>
<!--               <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p> -->
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="https://cfile1.onoffmix.com/attach/73OktDlEIRWqjgZz1SfoHdnVhYuv8CTB" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">           
            </div>
          </div>
        </div>
        <div class="item active">
          <img class="third-slide" src="https://cfile1.onoffmix.com/attach/V0POg8H9yLcNBWXuqvlahEwStrTCeUxK" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->  
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#contains">Contains</a></li>
                      <li><a href="#its_equal">It's equal</a></li>
                      <li><a href="#greather_than">Greather than ></a></li>
                      <li><a href="#less_than">Less than < </a></li>
                      <li class="divider"></li>
                      <li><a href="#all">Anything</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
        <br/>
        
    <div class="container marketing" style="margin:20px;">
    <hr/>
    <div><p>최신 클래스 조회</p></div>
    <hr/>
      <!-- Three columns of text below the carousel -->
      <div class="row">
       <c:forEach items="${rblist}" var="dto" varStatus="status">
        <div class="col-lg-3">
        <div class="thumbnail" style="width: 250px; height: 350px; ">
          <img class="img-circle" src="<c:url value='/classimages/${dto.tfile }'/>" alt="Class Image" width="150" height="200">
          <h4>${dto.title}</h4>
          <p>  
          <c:if test="${dto.payment eq 'charge' }">
          &nbsp;유료 [<img src="<c:url value='/images/won.png' />" height="14px" > ${dto.price }]
          </c:if>
          <c:if test="${dto.payment eq 'free' }">
          무료
          </c:if>
          </p>
          <p><a class="btn btn-default" href="/view/classview?tid=${dto.tid }" role="button">View details »</a></p>
        </div>
        </div><!-- /.col-lg-4 -->
        </c:forEach></div><!-- /.col-lg-4 -->
     </div><!-- /.row -->
	</div>
	</div>



      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500x500" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzUwMHg1MDAvYXV0bwpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE3OWY5MzU0ZmEwIHRleHQgeyBmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjVwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTc5ZjkzNTRmYTAiPjxyZWN0IHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIiBmaWxsPSIjRUVFRUVFIi8+PGc+PHRleHQgeD0iMTg1LjExNzE4NzUiIHk9IjI2MS4xIj41MDB4NTAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true">
        </div>
      </div>

      <hr class="featurette-divider">
      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2016 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->

	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<c:set var="user"><sec:authentication property="principal"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>ContentView</title>

    <!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link href="/css/carousel.css" rel="stylesheet">

<style>
.applyclass {
	box-sizing: border-box;
	border: 5px solid gray;
	width:auto; height:auto;
	padding:7px;
	border-radius:0.4em;
}
</style>
<style>
 .portlet {
    margin-bottom: 15px;
}

.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}

.portlet {
    border: 1px solid;
}

.portlet .portlet-heading {
    padding: 0 15px;
}

.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}

.portlet .portlet-heading a {
    color: #fff;
}

.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}

.portlet .portlet-heading .portlet-title {
    float: left;
}

.portlet .portlet-heading .portlet-title h4 {
    margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}

.portlet .portlet-body {
    padding: 15px;
    background: #fff;
}

.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}

.portlet .portlet-footer ul {
    margin: 0;
}

.portlet-green,
.portlet-green>.portlet-heading {
    border-color: #16a085;
}

.portlet-green>.portlet-heading {
    color: #fff;
    background-color: #16a085;
}

.portlet-orange,
.portlet-orange>.portlet-heading {
    border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
    color: #fff;
    background-color: #f39c12;
}

.portlet-blue,
.portlet-blue>.portlet-heading {
    border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
    color: #fff;
    background-color: #2980b9;
}

.portlet-red,
.portlet-red>.portlet-heading {
    border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
    color: #fff;
    background-color: #e74c3c;
}

.portlet-purple,
.portlet-purple>.portlet-heading {
    border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
    color: #fff;
    background-color: #8e44ad;
}

.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}

.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}

.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}

.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}

@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}

.img-chat{
width:40px;
height:40px;
}

.text-green {
    color: #16a085;
}

.text-orange {
    color: #f39c12;
}

.text-red {
    color: #e74c3c;
}                
}
</style>
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
<div class="top-bar con row">
    <nav class="menu-box-1 cell-right">
      <ul class="row">
          <li class="cell"><a href="/view/allclassview" class="block">전체 클래스 목록보기</a></li>
          <li class="cell"><a href="/view/meetupwriteview" class="block">클래스 개설하기</a></li>
          <li class="cell"><a href="#" class="block">프로그램</a></li>
          <li class="cell"><a href="#" class="block">상담후기</a></li>
      </ul>
  </nav>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1 class="page-header">클래스 담당자와의 채팅</h1>         
     <div class="row featurette">
		<hr />
	<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-xs-12">
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green"></i>실시간 채팅</h4>
                    </div>
                    <div class="portlet-widgets">
                      
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">
                    <div>
                    <div id="messages" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
		                <ul id="list">
		
						</ul> 
                    <hr>
                    </div>
                    </div>
                    <div class="portlet-footer">
                        <form role="form">
                        	<input type="hidden" id="classid" value="${classid }"/>	
                            <div class="form-group" style="float:left;">
                               ${user } &nbsp;&nbsp;<input type="hidden" id="msgsender" value="${user }"/>
                            </div>
                            <div class="form-group" style="float:left;'">
                               <textarea style="height: 80px;" id="messageinput"
                                    class="form-control" placeholder="메시지를 입력하세요." width="200"></textarea>
                            </div>
                            <div class="form-group">                                
                                <button type="button" class="btn btn-default pull-right" onclick="writeUserData();">Send</button>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-md-4 -->
    </div>
</div>   			

		</div>
	</div>
</div>
</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<!-- The core Firebase JS SDK is always required and must be listed first -->
 <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
<!-- Add Firebase products that you want to use -->
<script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>



<script>
//firebase 초기화 과정
 var firebaseConfig = {
    apiKey: "AIzaSyCFKEB_NKzpL3Gjg7918sHJk3ksvEFjG6o",
    authDomain: "fcm-test-c09b0.firebaseapp.com",
    databaseURL: "https://fcm-test-c09b0-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "fcm-test-c09b0",
    storageBucket: "fcm-test-c09b0.appspot.com",
    messagingSenderId: "597270423179",
    appId: "1:597270423179:web:10beb6f19dffd00ef3d68e",
    measurementId: "G-BV1QQBWQSD"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
  
  var chatroomname='chat'+$('#classid').val();
  var inputmsg= document.getElementById('messages');
  var testref=firebase.database().ref();
  var ulList=document.getElementById('list');
  console.log("채팅방이름"+chatroomname);
  firebase.database().ref().child('chatmanager').child(chatroomname).on('child_added', snap => {
	  console.log(snap.val());
  		if(snap.exists()){ 		
  		var manId=$('#msgsender').val();
  		var chatId=snap.val().userId;
  		if(chatId=='${user}'||chatId=='${manId}'){
	  		//timestamp 값 date 로 변환
	  		var date=new Date(snap.val().timestamp);
	  		var year = date.getFullYear();
	  		var month = date.getMonth()+1;
	  		var day = date.getDate();
	  		var hour = date.getHours();
	  		var minute = date.getMinutes();
	  		
		  const li = document.createElement('li');
		  
		  li.innerHTML ="<div class=\"row\"><div class=\"col-lg-12\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle img-chat\" src=\"/images/KakaoTalk_20210624_203130625.jpg\" alt=\"\"></a><div class=\"media-body\"><h4 class=\"media-heading\">"+snap.val().userId+"<span class=\"small pull-right\"></span></h4><p>"+snap.val().message+"<span>&nbsp;&nbsp;"+year+"."+month+"."+day+" "+hour+":"+minute+"</span></p></div></div></div></div>";
//		  li.innerHTML ="<div class=\"row\"><div class=\"col-lg-12\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle img-chat\" src=\"/images/"+${profileimage}+"\" alt=\"\"></a><div class=\"media-body\"><h4 class=\"media-heading\">"+snap.val().userId+"<span class=\"small pull-right\"></span></h4><p>"+snap.val().message+"<span>&nbsp;&nbsp;"+year+"."+month+"."+day+" "+hour+":"+minute+"</span></p></div></div></div></div>";
		  // 삭제, 수정시 변동사항 체크를 위하여
		  li.id = snap.key;
		  ulList.appendChild(li);
		  }

	  }
  });
</script>
<script>
//realtime database에 채팅 등록
function writeUserData() {
	var classid=$('#classid').val();
	var userId=$('#msgsender').val();
	var message=$('#messageinput').val();
	var timestamp=firebase.database.ServerValue.TIMESTAMP;
	console.log(classid+", "+userId+","+message+", "+timestamp);
	var newPostKey = firebase.database().ref().child('chatmanager').child('chat'+classid).push().key;
	firebase.database().ref('chatmanager/' +'chat'+classid+'/'+newPostKey).set({
	    userId : userId,
		message : message,
		timestamp: timestamp
	  });
	console.log("writeUserData success");
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="user"><sec:authentication property="principal"/></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<title>MyPage</title>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>

<style>
	.sidebar {
    position: fixed;
    top: 51px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto;
    background-color: #f5f5f5;
    border-right: 1px solid #eee;
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
	        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><sec:authentication property="principal.Username"/> 님 환영합니다<span class="caret"></span></a>
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

<div class="container-fluid">
<div class="row">
<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="pwcheckview">회원정보수정 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h1 class="page-header">Profile Information</h1>
		
          <div class="row placeholders">
         
            <div class="col-xs-12 col-sm-6 placeholder">
            <form method="post">
			<table class="table">
			<tr>
				<th scope="row" >아이디</th>
			<div class="text_wrapper" style="display:none;">
			<input type="text" id="idvalue" value="<sec:authentication property="principal.Username"/>" /></div>
				<td><strong><sec:authentication property="principal.Username"/></strong></td>
			</tr>
			<c:forEach var="dto" items="${userinfo }">
			<tr>
				<th scope="row" >이메일</th>
				<td>${dto.useremail }</td>	
			</tr>
			<tr>
				<th scope="row" >이름</th>
				<td>${dto.username}</td>		
			</tr>
		
			</c:forEach>		
			</table>
			</form>			
            </div>
          </div>  
          <div class="container">
        <form method="post" action="/mypage/profileupdateaction" enctype="multipart/form-data">
            <table class="table table-bordered table-hover"
                style="text-align: center; border: 1px solid #dddddd;">
                <thead>
                    <tr>
                        <th colspan="2"><h4>프로필사진 수정</h4></th>
                    </tr>
                </thead>

                <tbody>
           
                    <tr>
                        <td style="width: 110px; background-color: #ededed;">
                            <h5>사진 업로드</h5>
                        </td>
                        <td colspan="2">
                        <input type="file" name="files" class="file">
                        <div class="input-group col-xs-12">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i> </span>
                           <input type="text" name="userProfile" class="form-control input-lg file" disabled placeholder="이미지를 업로드하세요.">
                           <span class="input-group-btn">
                            <button class="browse btn btn-default input-lg" type="button"><i class="glyphicon glyphicon-search"></i>파일찾기 </button>
                           </span>
                            </div>
                        </td>
                    </tr>
                
                    <tr>
                       <td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5>
                       <input class="btn btn-default pull-right" type="submit" value="등록"></td>
                       
                    </tr>

                </tbody>
            </table>
        </form>
    </div>       
        
        </div>        
</div>
</div>


</body>
</html>
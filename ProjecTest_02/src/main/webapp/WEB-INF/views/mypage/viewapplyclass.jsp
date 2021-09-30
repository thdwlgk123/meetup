<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="user"><sec:authentication property="principal"/></c:set>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<title>Insert title here</title>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
function quitcheck(){
	const result=confirm("해당 클래스의 신청을 취소하시겠습니까?");
	if(result){
		quitajax();
	}
}

function quitajax(){
	var userid = $('#userid').val();
	var classid = $('#classid').val();
	$.ajax({
		type : 'POST',
		url : 'http://localhost:8081/mypage/quitclass',
		data : {
			userid: userid,
			classid: classid
		},
		dataType: 'json',
		success : function(json) {
			console.log(json);
			if (json.code == "success") {
				alert(json.desc); 
				window.location.replace("viewapplyclass");
			} else {
				alert(json.desc);
			}
		}
	});
}
</script>
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
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="viewapplyclass">신청한 클래스 목록</a></li>
		  <li role="presentation"><a href="viewlikeclass">좋아요한 클래스 목록</a></li>
		  <li role="presentation"><a href="viewopenclass">개설한 클래스 목록</a></li>
		</ul>
      <h1 class="page-header">신청한 클래스 목록</h1>
		<div class="row placeholders">  
       	<c:choose>
       	<c:when test="${fn:length(applyclassinfo) eq 0 }">      		          
	         <div class="col-xs-12 col-sm-3 placeholder">
	           <div style="text-align:center;"><h2>신청한 클래스가 없습니다.</h2></div>
	         </div>
       	</c:when>
       	<c:otherwise>
       	<c:forEach var="aci" items="${applyclassinfo }">
	       <div class="row placeholders">            
	         <div class="col-xs-6 col-sm-3 placeholder">
	           <img src="/classimages/${aci.tfile }" width="200" class="img-responsive"
								alt="Generic placeholder thumbnail">
	         </div>
	         <div class="col-xs-12 col-sm-6 placeholder">
	         	<div style="float:left;">
	         		<span><h3><a href="/view/classview?tid=${aci.tid }">${aci.title }</a></h3></span>
	         		<p><span>${aci.tintro }</span>
	         	</div>	
	         	
	         	<div style="text-align:right;">
	         		<c:forEach var="cmi" items="${classmanagerinfo }">
	         			<c:if test="${cmi.classid eq aci.tid }">
		         			<c:choose>
			         		<c:when test="${cmi.paycheck eq 'y' }">
			         			<div> 
				         			<a class="btn btn-default" href=""" role="button">결제완료</a>	
				         		</div>
			         		</c:when>
			         		<c:otherwise>
				         		<div> 
				         			<a class="btn btn-default" href="/view/paymentpage?tid=${aci.tid }" role="button">결제하기</a>	
				         		</div>
			         		</c:otherwise>
			         		</c:choose>
		         		</c:if>
	         			</c:forEach>
	         		<div>
	         			<form id="quitform">
	         				<input type="hidden" id="userid" name="userid" value="<sec:authentication property="principal.Username"/>">
	         				<input type="hidden" id="classid" name="classid" value="${aci.tid }">
	         				<button onClick="quitcheck()">신청취소</button>
	         			</form>
	         		</div>
	         	</div>	
	         </div>          
	       </div>
       </c:forEach></c:otherwise></c:choose>         
</div>
</div>

</body>
</html>
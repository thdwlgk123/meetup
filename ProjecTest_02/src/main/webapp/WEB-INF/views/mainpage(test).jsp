<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Main Page(로그인, 회원가입)</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/carousel.css">
<!-- <script>
// 구글로그인
	var googleUser = {};
	var startApp = function() {
		gapi.load('auth2', function() {
			// Retrieve the singleton for the GoogleAuth library and set up the client.
			auth2 = gapi.auth2.init({
				client_id: '24703938961-d97g23oh251odcqvs54ujposj03vlm3l.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
        		// Request scopes in addition to 'profile' and 'email'
        		//scope: 'additional_scope'
			});
			attachSignin(document.getElementById('login'));
		});
	};
	
	function attachSignin(element) {
		auth2.attachClickHandler(element, {},
			function(googleUser) {
				var profile = googleUser.getBasicProfile();
				var id=profile.getId();
				var name=profile.getName();
				var email=profile.getEmail();
				var authority='googleuser';
				console.log(email);
				//계정 회원가입 여부 확인
				checkRegisterId(email, authority);
				
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
	}
	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut()

	}
 	function checkRegisterId(email, authority) {
 		var email=email;
 		var authority=authority;
 		console.log(email+" : "+authority);
		$.ajax({			
			url:'http://localhost:8081/security/checkid',
			type:'POST',
			data: {
				userID : email,
				authority : authority
			},
			dataType: 'json',
			success: function(json){
				console.log(json);
				if(json.code=="success"){
					/* alert("가입되어 있지 않은 계정입니다. 회원가입을 진행하시겠습니까?");	 */
					const result=confirm("가입되어 있지 않은 계정입니다. 회원가입을 진행하시겠습니까?");
					if(result){
						window.location.replace("/security/snsjoin?userid="+email+"&authority="+authority);
					}else{
						alert("로그인 또는 회원가입 이후에 홈페이지 이용이 가능합니다.");
					}					
				}else{
					alert("로그인 성공");
					window.location.replace("main");
				}
			}
		})
	} 
</script> -->

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
        <li class="active"><a href="#">HOME<span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><button type="button"><a href="/security/loginpage">로그인</a></button></li>
       	<li><a id="gnbJoin" href="/security/joinForm" >회원가입</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
      <c:if test="${empty principal }">
      	<li>principal 이 null값으로 찍힘</li>
      </c:if>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

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
          <img class="first-slide" src="https://pbs.twimg.com/media/Di8p6NKU4AENW6T.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="https://lh3.googleusercontent.com/proxy/qyYHnKNyylfRMVFpTUZb-0v_DxsUBwR_uxew_PrPGfBqFWcK-cgrz-DqqHBq_pDWk8bw4j4Jvs_xEjkn5LUi5Vbpu6DAZAMLAVOnIT6UCpGEz9OiCvw1dJayPmlB29MvHEoCzOdxzk77ZCgRIEJm2ZP8Rb8Q" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item active">
          <img class="third-slide" src="https://pbs.twimg.com/media/Di8qYGxUcAADa8X.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
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


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
	<div class="container">
    <div class="row">    
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
	</div>
	</div>

    <div class="container marketing" style="margin:20px;">
      <!-- Three columns of text below the carousel -->
      <div class="row">
       <c:forEach items="${rblist}" var="dto">
        <div class="col-lg-4">
        <div class="thumbnail">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Class Image" width="140" height="140">
          <h2>${dto.title}</h2>
          <p> ${dto.tintro}</p>
          <p><a class="btn btn-default" href="/view/classview?tid=${dto.tid }" role="button">View details »</a></p>
        </div>
        </div><!-- /.col-lg-4 -->
        </c:forEach></div><!-- /.col-lg-4 -->
     </div><!-- /.row -->


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

<!-- <div><button><a href="/security/joinForm" value="join">회원가입</a></button></div> -->
<!-- <div><button onClick="" value="naverlogin">네이버 로그인(구현X)</button></div>
<div><button type="button" id="login" class="btn btn-primary btn-lg btn-block"><div class="googletext"> Google 로그인(아직사용X)</div></button></div>
<div id="login" style="display: block">
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
    <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
    </a>
</div>
<div id="logout" style="display: none;">
    <input type="button" class="btn btn-success" onclick="signOut();" value="로그아웃" /><br>

    <img id="upic" src=""><br>
   	<span id="uname"></span>
</div> -->
<%-- <div>
<form action="<c:url value="j_spring_security_check" />" method="post">
       	<c:if test="${param.error !=null}">
      		<p>Login Error! <br/> ${error_message}</p>
      	</c:if> 
	<div class='subtitle'>ID</div>
	<input type='text' name="j_username" class='input-line full-width'></input>
	<div class='subtitle'>Password</div> 
	<input type='text' name="j_password" class='input-line full-width'></input>
	<div><button type="submit" class='ghost-round full-width'>LOGIN</button></div>
</form>
</div> --%>



<!-- <script>startApp();</script> -->
<!-- <script type='text/javascript'>

//카카오톡 로그인(id 값은 res.id로 저장(카카오는 이메일 제공이 선택사항), 카카오회원가입jsp 따로 구현)
    Kakao.init('673ab7a18b893ff0bebdbab03335ec54');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));
          signIn(authObj);
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };

    function signIn(authObj) {
        //console.log(authObj);
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                console.log(res.id);
                
                var id = res.id;
/*                 var name = res.properties.nickname; */
                var authority='kakaouser';

                $.ajax({			
        			url:'http://localhost:8081/security/checkid',
        			type:'POST',
        			data: {
        				userID : id,
        				authority : authority
        			},
        			dataType: 'json',
        			success: function(json){
        				console.log(json);
        				if(json.code=="success"){
        					/* alert("가입되어 있지 않은 계정입니다. 회원가입을 진행합니다.");	 */
        					const result=confirm("가입되어 있지 않은 계정입니다. 회원가입을 진행하시겠습니까?");
        					if(result){
        						window.location.replace("/security/kakaojoin?userid="+id+"&authority="+authority);
        					}else{
        						alert("로그인 또는 회원가입 이후에 홈페이지 이용이 가능합니다.");
        					}
        				}else{
        					alert("카카오톡 로그인 성공");
        					doLogin();
        					window.location.replace("main");
        				}
        			}
        		})
/* 
                $('#login').css('display', 'none');
               	$('#logout').css('display', 'block');
                $('#upic').attr('src', res.properties.thumbnail_image );
               	$('#uname').html('[ ' + res.properties.nickname + ' ]'); */
             }
         })
	}


/*     function signOut() {
	    Kakao.Auth.logout(function () {
	    	$('#login').css('display', 'block');
	    	$('#logout').css('display', 'none');
	    	$('#upic').attr('src', '');
	    	$('#uname').html('');
	    });
	} */
    
    
</script> -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</body>
</html>
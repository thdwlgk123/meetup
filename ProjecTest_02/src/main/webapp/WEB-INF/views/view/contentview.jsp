<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="user">
	<sec:authentication property="principal" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>ContentView</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link href="/css/carousel.css" rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97f32d99acd8c1d93c0887fa00241456&libraries=services"></script>
<script>
	function register() {
		console.log("register");
		var tid = $("#tid").val();
		var title = $("#title").val();
		var address = $("#searchWord").val();

		console.log(tid, title, address);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('\'' + address + '\'', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var lat = result[0].y
				var lon = result[0].x

				console.log(lat, lon);
			}

			$.ajax({
				url : 'applyclass',
				type : 'POST',
				data : {
					tid : tid,
					title : title,
					lat : lat,
					lon : lon,
					address : address
				},
				dataType : 'text',
				success : function() {
					alert("신청이 성공적으로 완료되었습니다.");
					window.location.replace("allclassview");

				}

			});
		});
	}
	


	/* function locationrecommand() {
		console.log("locationrecommand");
		var tid = $("#tid").val();
		console.log(tid);
		$.ajax({
			url : 'location',
			type : 'POST',
			data : {

				tid : tid
			},
			dataType : 'json',
			success : function(json) {
				console.log(json);
				console.log(json.lat);
				console.log(json.lon);
				var lat = json.lat;
				var lon = json.lon;
					
				console.log(lat);
				console.log(lon);
				locationview(lat, lon);
			

			}
		});
	} */
	
	/* function locationview(lat, lon) {
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표

			level : 2	// 지도의 확대 레벨
		};
		console.log(lat, lon);
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 카테고리로 은행을 검색합니다
		ps.categorySearch('CE7', placesSearchCB, {
			useMapBounds : true
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
				}
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
		
	} */
	
	
</script>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

.applyclass {
	box-sizing: border-box;
	border: 5px solid gray;
	width: auto;
	height: auto;
	padding: 7px;
	border-radius: 0.4em;
}
</style>
<style>
/* 폰트적용 */
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
	font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li {
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

.line-height-0>* {
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

.img-box>img {
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
.top-bar {
	min-width: 1100px;
}

.top-bar>.menu-box-1>ul>li>div {
	position: absolute;
	background-color: #009aa5;
	left: 0;
	right: 0;
	color: white;
	transition: height 0.3s;
	height: 0;
	overflow: hidden;
}

.top-bar>.menu-box-1  ul>li:hover>div {
	overflow: visible;
	height: 60px;
}

.top-bar>.menu-box-1>ul>li>div>div>ul {
	margin-left: 300px;
}

.top-bar>.menu-box-1>ul>li>div>div>ul>li>a {
	padding: 16px 35px;
	border-bottom: 3px solid transparent;
	transition: 0.3s;
}

.top-bar>.menu-box-1>ul>li>div>div>ul>li:hover>a {
	border-bottom-color: white
}

.top-bar>.menu-box-1>ul>li>a {
	padding: 36px 30px;
	transition: 0.2s;
}

.top-bar>.menu-box-1>ul>li:hover>a {
	color: #009aa5;
}

.icon-1 {
	position: absolute;
	top: 0;
	margin-left: 130px;
	margin-top: -15px;
	color: #009aa5;
}

.last-box {
	margin-top: 36px;
	margin-right: 100px;
}

.point-box {
	margin-left: 30px;
	margin-top: -30px;
}

.point-box>.point-1 {
	color: #009aa5;
	font-size: 12px;
}

.point-box>.point-2 {
	margin-left: 20px;
	border: 2px solid #eee;
	border-radius: 10px;
	padding: 7px 10px;
	transition: 0.2s;
	font-size: 12px;
}

.point-box>.point-2:hover {
	border: 2px solid #009aa5;
	color: #009aa5;
}
</style>
</head>
<body>

	<nav class="navbar navbar-default" style="background-color: #F3F9F9;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">TeamProject</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/security/mainpage">HOME <span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">Link</a></li>
				</ul>
				<c:choose>
					<c:when test="${user eq 'anonymousUser'}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/security/loginpage">로그인</a></li>
							<li><a id="gnbJoin" href="/security/joinForm">회원가입</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<c:set var="user">
							<sec:authentication property="principal.Username" />
						</c:set>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" class="point "><img
									src="http://www.icounseling.co.kr/images/icon_mypage.jpg"
									alt=""></a></li>
							<li><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><sec:authentication
										property="principal.Username" /> 님 환영합니다<span class="caret"></span></a>
							<li class="dropdown">
								<ul class="dropdown-menu">
									<li><a href="/mypage/mp">마이페이지 이동</a></li>
									<li><a href="#">회원정보 수정</a></li>
									<li><a href="#">비밀번호 변경</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="/logout">로그아웃</a></li>
								</ul>
							</li>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="top-bar con row">
		<nav class="menu-box-1">
			<ul class="row">
				<li class="cell"><a href="/view/allclassview" class="block">전체
						클래스 목록보기</a></li>
				<li class="cell"><a href="/view/meetupwriteview" class="block">클래스
						개설하기</a></li>
				<li class="cell"><a href="#" class="block">프로그램</a></li>
				<li class="cell"><a href="#" class="block">상담후기</a></li>
			</ul>
		</nav>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Dashboard</h1>

				<div class="row placeholders">
					<div class="col-xs-4 col-sm-3 placeholder">
						<div>
							<img src="/classimages/${classinfo.tfile }" width="400"
								height="400" class="img-responsive"
								alt="Generic placeholder thumbnail">
						</div>
						<div>
							<ul>
								<li><div>담당자 : ${classinfo.mname }</div>
								</li><li><span>이메일 : </span><span>${classinfo.memail }</span></li>
								<li><span>전화번호 : </span><span>${classinfo.mtel }</span></li>
							</ul>
							<p>문의 사항은 메일/ 전화/ 댓글을 이용해주세요.</p>
							<c:if test="${classinfo.tuserid ne user}">
								<p><button type="button"><a href="/chat/chatpage?classid=${classinfo.tid }">채팅으로 문의하기</a></button></p>
							</c:if>
						</div>
					</div>
					<c:set var="tSpaceType" value="${classinfo.tspacetype}" />


					<div class="col-xs-6 col-sm-7 placeholder">
						<h2 style="font-weight: bold;">${classinfo.title }</h2>
						<div>
							<p>${classinfo.tintro }</p>
						</div>
						<ul>
							<li><p>모임기간 : ${classinfo.classstartdate } ~
									${classinfo.classenddate }</p></li>
							<li><p>
									모임장소 : ${classinfo.tspace}<span><button type="button"
											onclick="location.href='#info2'">
											<c:choose>
								<c:when test="${classinfo.tuserid eq user}">
								<c:if test="${classinfo.tspace ne 'zoom'}">
								지도보기
								</c:if>
								</c:when>
												<c:otherwise>

													<c:if test="${tSpaceType == 'locfix'}">
									지도보기
									</c:if>
													<c:if test="${tSpaceType == 'locrecommand'}">
									내 위치선택
									</c:if>
												</c:otherwise>
											</c:choose>

										</button></span>
								</p></li>
							<li><p>
									모임정원 : ${classinfo.tmemnum}명 &nbsp;&nbsp;
									<c:if test="${availnum > 0}">
									[${availnum } 명 신청가능]
									</c:if>
									<c:if test="${availnum <= 0}">
									[모집이 마감되었습니다.]
									</c:if>

								</p></li>

						</ul>
						<h5>신청정보</h5>
						<c:choose>
							<c:when test="${classinfo.tuserid eq user}">
								<input type="hidden" id="tid" value="${classinfo.tid }">
								<c:if test="${classinfo.tspace ne 'zoom'}">								
								<table class="table table-bordered table-hover"
									style="text-align: center; border: 1px solid #dddddd;">
									<tr>
										<td>신청자</td>
										<td>위치</td>
									</tr>
									<c:forEach items="${list}" var="dto">

										<tr>
											<td>${dto.userid}</td>
											<td>${dto.address }</td>
										</tr>

									</c:forEach>
								</table>
								<button onclick="locationrecommand();">위치추천하기</button>
							</c:if></c:when>

							<c:otherwise>
								<div class="applyclass">
									<form>
										<div>
											<label><span style="font-weight: bold;">[
													${classinfo.title } ]</span> 신청하기</label>
										</div>
										<div>
											<span class="text-muted">(Something else)</span>
										</div>

										<div>
											<c:choose>
												<c:when test="${likecheck eq 0 }">
													<button type="button"
														onclick="location.href='like?tid=${classinfo.tid}&title=${classinfo.title }'"
														class="btn btn-default pull-left" value="like">
														<span class="glyphicon glyphicon-heart-empty"
															aria-hidden="true">${likecount }</span>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button"
														onclick="location.href='undolike?tid=${classinfo.tid}'"
														class="btn btn-default pull-left" value="like">
														<span class="glyphicon glyphicon-heart" aria-hidden="true">${likecount }</span>
													</button>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${checkuser eq 0}">
													<p>
														<c:if test="${tSpaceType == 'locfix'}">
															<c:if test="${availnum > 0}">
																<a class="btn btn-default"
																	href="/view/applyclass?tid=${classinfo.tid }&title=${classinfo.title}"
																	role="button">신청하기</a>
															</c:if>
															
															<c:if test="${availnum <= 0}">
																<a class="btn btn-default"
																	href="/view/applyclass?tid=${classinfo.tid }&title=${classinfo.title}"
																	role="button">대기신청</a>
															</c:if>
														</c:if>
														<c:if test="${tSpaceType == 'locrecommand'}">
															<c:if test="${availnum > 0}">
															<a class="btn btn-default"
																	href="javascript:register();"
																	role="button">신청하기</a>
<!-- 																<button type="button" onclick="register();">신청하기(test)</button>
 -->															</c:if>
															<c:if test="${availnum <= 0}">
																<a class="btn btn-default"
																	href="/view/applyclass?tid=${classinfo.tid }&title=${classinfo.title}"
																	role="button">대기신청</a>
															</c:if>
														</c:if>
														<c:if test="${tSpaceType == 'off'}">
															<c:if test="${availnum > 0}">
															<a class="btn btn-default"
																	href="/view/applyclass?tid=${classinfo.tid }&title=${classinfo.title}"
																	role="button">신청하기</a>
<!-- 																<button type="button" onclick="register();">신청하기(test)</button>
 -->															</c:if>
															<c:if test="${availnum <= 0}">
																<a class="btn btn-default"
																	href="/view/applyclass?tid=${classinfo.tid }&title=${classinfo.title}"
																	role="button">대기신청</a>
															</c:if>
														</c:if>
														<input type="hidden" id="tid" value="${classinfo.tid }">
														<input type="hidden" id="title"
															value="${classinfo.title }">

													</p>
												</c:when>
												<c:otherwise>
													<p>
														<a class="btn btn-default" href="#" role="button">신청완료</a>
													</p>
												</c:otherwise>
											</c:choose>
										</div>
									</form>
								</div>
							</c:otherwise>
						</c:choose>



					</div>
				</div>
				
				<div class="row placeholders">
				<div class="col-xs-6 col-sm-10 placeholder">
					<hr />
					<p>
						<a href="#info1">상세내용</a>&nbsp;&nbsp;<a href="#info2">지도보기</a>&nbsp;&nbsp;<a
							href="#info3">Q&A</a>&nbsp;&nbsp;<a href="#info4">신청안내</a>
					</p>
					<hr id="info1" />
					<h2>상세내용</h2>
					<p>${classinfo.tcontent }</p>
					<hr id="info2" />
					<c:choose>
						<c:when test="${classinfo.tuserid eq user}">
							<h2>신청자 위치기반 실시간 추천장소</h2>
							<c:if test="${classinfo.tnownum == 0}">
								<h5>아직 참가인원이 없습니다.<img src="/images/doo.png" width="140px"></h5>
							</c:if>

							<c:if test="${classinfo.tnownum > 0}">

								<div class="map_wrap">
									<div id="maprecommand"
										style="width: 1400px; height: 100%; position: relative; overflow: hidden;"></div>
									<ul id="category">
										<li id="BK9" data-order="0"><span
											class="category_bg bank"></span> 은행</li>
										<li id="MT1" data-order="1"><span
											class="category_bg mart"></span> 마트</li>
										<li id="PM9" data-order="2"><span
											class="category_bg pharmacy"></span> 약국</li>
										<li id="OL7" data-order="3"><span class="category_bg oil"></span>
											주유소</li>
										<li id="CE7" data-order="4"><span
											class="category_bg cafe"></span> 카페</li>
										<li id="CS2" data-order="5"><span
											class="category_bg store"></span> 편의점</li>
									</ul>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<h2>지도보기</h2>


							<c:if test="${tSpaceType == 'locfix'}">
								<p id="tSpace">${classinfo.tspace }</p>


								<div id="map" style="width: 100%; height: 350px;"></div>


								<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							var tSpace = $("#tSpace").text();
							console.log(tSpace);
							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											tSpace,
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">모임장소</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						</script>
							</c:if>


							<c:if test="${tSpaceType == 'locrecommand'}">


								<div id="map" style="width: 100%; height: 350px;"></div>
								<p>참가자의 출발위치를 입력하면, 모든 참가자의 중간위치를 추천합니다.</p>
						도로명주소를 검색하여 위치를 확인하신 후 상세주소를 입력해 주세요.
						<input type="text" class="form-control" id="searchWord"
									name="tSpace">
								<button type="button" class="btn btn-default pull-left"
									onclick="searchAction();">검색</button>
								상세주소<input type="text" class="form-control">
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97f32d99acd8c1d93c0887fa00241456&libraries=services"></script>
								<script>
							if (navigator.geolocation) {

								// GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation
										.getCurrentPosition(function(position) {

											var lat = position.coords.latitude, // 위도
											lon = position.coords.longitude; // 경도

											displayMarker(lat, lon);

										});

							}

							function displayMarker(lat, lon) {

								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								var locPosition = new kakao.maps.LatLng(lat,
										lon);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : locPosition
								});

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(locPosition);

							}

							function searchAction() {
								console.log('searchAction');
								var searchWord = $("#searchWord").val();
								console.log(searchWord);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								geocoder
										.addressSearch(
												'\'' + searchWord + '\'',
												function(result, status) {

													// 정상적으로 검색이 완료됐으면 
													if (status === kakao.maps.services.Status.OK) {

														var lat = result[0].y
														var lon = result[0].x

														displayMarker(lat, lon);

													}
												});
							}
						</script>


							</c:if>
						</c:otherwise>
					</c:choose>


					<hr id="info3" />
					<h2>Q&A</h2>
					<p>질문 및 답변</p>

					<hr id="info4" />
					<h2>신청안내</h2>
					<p>
						* 모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.<br /> * 결제한 유료모임은 환불 시 결제
						수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 취소/환불약관을 확인해주세요.<br /> *
						결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.<br /> *
						모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다.<br /> * 온오프믹스
						결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다.<br /> * 개설자 선정방식
						또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.<br /> * 온오프믹스는 참여신청 및
						참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의
						바랍니다.
					</p>
					<div class="col-md-12">
						<h2 class="featurette-heading">
							First featurette heading. <span class="text-muted">It'll
								blow your mind.</span>
						</h2>
						<p class="lead">Donec ullamcorper nulla non metus auctor
							fringilla. Vestibulum id ligula porta felis euismod semper.
							Praesent commodo cursus magna, vel scelerisque nisl consectetur.
							Fusce dapibus, tellus ac cursus commodo.</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>


	<script>


	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 
	var mapContainer = document.getElementById('maprecommand'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${lat}, ${lon}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();



// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
	var address = place.address_name;
    var content = '<div class="placeinfo">' +
    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
    '<button type="button" onclick="fixaddress(\''+address+'\');">선택</button>' +
                '</div>' + 
                '<div class="after"></div>';
                
                
/* fixaddress(place.address_name);
 */
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

function fixaddresstest(){
	console.log("fixaddresstest");
}

function fixaddress(address){
	
	console.log("fixaddress");
	var tid = $("#tid").val();
	
	console.log(tid, address);
	$.ajax({
		url : 'fixaddress',
		type : 'POST',
		data : {
			tid : tid,
			address : address
		},
		dataType : 'text',
		success : function() {
			alert("모임장소가 확정되었습니다.");
			

		}

	});
	
	
}
</script>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
		crossorigin="anonymous"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
		integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
		crossorigin="anonymous"></script>

</body>
</html>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous" >
<!-- <link href="/webjars/bootstrap/5.0.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"> -->
<link rel="stylesheet" href="/css/carousel.css">
<link rel="stylesheet" href="/css/joincss.css">
<title>JOINFORM</title>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<script>

	//아이디 중복체크
	function registerCheckFunction() {
		var userID = $('#userID').val();
		$.ajax({
			type : 'POST',
			url : 'http://localhost:8081/security/checkid',
			data : {
				userID : userID
			},
			dataType: 'json',
			success : function(json) {
				console.log(json);

				if (json.code == "success") {
					console.log(json.desc);
					$('#checkMessage').html('사용가능한 아이디입니다.');
					$('#idcheckbtn').val("true");
					$('#idvalue').val(userID);
				} else {
					console.log(json.desc);
					$('#checkMessage').html('이미 존재하는 아이디입니다.');
				}
			}
		});
	}
	//비밀번호 일치 확인
	function passwordCheckFunciton() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
	//아이디 중복체크 여부 확인
	function idCheckFunciton() {
		if($('#idvalue').val() != ""){
			if($('#userID').val() != $('#idvalue').val()){
				$('#checkMessage').html('');
				$('#idcheckbtn').val("false");
			}
		}		
	}
	
	//회원가입 form 체크
	function joinFormCheck(){
		if($('#idcheckbtn').val()=="false"){
			$('#checkMessage').html('아이디 중복체크를 진행하세요.');
			$('#userID').focus();
			return;
		}
		if($('#userID').val().length ==0){
			$('#checkMessage').html('아이디는 필수입력 사항입니다.');
			$('#userID').focus();
			return;
		}
		if($('#userPassword1').val() !=$('#userPassword2').val()){
			$('#userPassword2').focus();
			return;
		}
		if($('#userPassword1').val().length<8 | $('#userPassword1').val().length>=16) {
		    alert("비밀번호는 8~16자를 입력해주세요.");
		    return;
		 }
		if(!$('#userPassword1').val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {

		      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
		      return; 
		} 
		if($('#userName').val().length ==0){
			$('#nicknameCheckMessage').html('닉네임은 필수입력 사항입니다.');
			$('#userName').focus();
			return;
		}
		if($('#userName2').val().length ==0){
			$('#nameCheckMessage').html('이름은 필수입력 사항입니다.');
			$('#userName2').focus();
			return;
		}
		if($('#usereMail').val().length ==0){
			$('#nameCheckMessage').html('');
			$('#eMailCheckMessage').html('이메일은 필수입력 사항입니다.');
			$('#usereMail').focus();
			return;
		}
		//권한정보 동의사항 체크
		 if(!$("#check_3").is(":checked"))
		 {
			 $("#agree").val("nAgree");
		 }else {
			 $("#agree").val("Agree");
		 }
		
		 if($("#check_1").is(":checked")&&$("#check_2").is(":checked"))
		  {	  
		 	submitAjax();
		  }else if(!$("#check_1").is(":checked")){
			  $("#fCheckBox").html("필수 체크 사항 입니다.");
		  }else if(!$("#check_2").is(":checked")){
			  $("#sCheckBox").html("필수 체크 사항 입니다.");
		  }	
	}
	//회원가입 ajax 전송
	function submitAjax(){
		
		var userID = $('#userID').val();
		var userPassword1=$('#userPassword1').val();
		var userName = $('#userName').val();
		var userName2 = $('#userName2').val();
		var usereMail = $('#usereMail').val();
		var authority='ROLE_USER';
		var marketCheck= $("#agree").val();
		$.ajax({
			type : 'POST',
			url : 'http://localhost:8081/security/join',
			data : {
				userID : userID,
				userPassword1 : userPassword1,
				userName : userName,
				userName2 : userName2,
				usereMail : usereMail,
				authority : authority,
				marketCheck : marketCheck
			},
			dataType: 'json',
			success : function(json) {
				console.log(json);
				
				if (json.code == "success") {
					alert("회원가입에 성공하였습니다. 로그인 후 이용해주세요.");
					window.location.replace("mainpage");
				} else {
					alert(json.desc);

				}
			}
		});
	}
</script>

<script>
function checkGo() {
	
//체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});
// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;
    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });
    $("#check_all").prop("checked", is_checked);
});
}
//모달 창에서 동의 버튼 
function checkModal1()
{
	$("#check_1").prop("checked", true);
}
function checkModal2()
{
	$("#check_2").prop("checked", true);
	
}
function checkModal3()
{
	$("#check_3").prop("checked", true);
	
}

function fOnClick(){
	$(".fCheckBox").text("");
}
function sOnClick(){
	$(".sCheckBox").text("");
}
</script>
<style>

.navbar .navbar-nav {
  display: inline-block;
  float: none;
}

.navbar .navbar-collapse {
  text-align: center;
}

</style>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1"  role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">이용 약관</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="overflow:scroll; height:350px;">
     <p>
        제 1 장 총칙
제 1 조 목적
이 약관은 주식회사 온오프믹스(이하 “회사” 라고 함)가 운영하는 “온오프믹스” 인터넷사이트(http://www.onoffmix.com)와 스마트폰 등 이동통신기기를 통해 제공되는 “온오프믹스” 모바일 애플리케이션을 통하여 제공하는 전자상거래 관련 서비스 및 이벤트관리 및 기타 정보서비스(이하 “서비스”라고 합니다)와 관련하여 회사와 이용자간의 권리와 의무, 책임사항 및 이용자의 서비스이용절차에 관한 사항을 규정함을 목적으로 합니다.
	</p>
	<p>
제 2 조 약관의 명시, 효력 및 변경
회사는 이 약관의 내용을 회사의 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편주소 등)등과 함께 이용자가 확인할 수 있도록 “온오프믹스” 인터넷사이트 (http://www.onoffmix.com) 초기서비스화면 또는 연결화면에 게시합니다.
회사는 약관의규제에관한법률, 전자문서 및 전자거래기본법, 전자서명법, 정보통신망이용촉진 및 정보보호등에관한법률, 전자상거래등에서의 소비자보호에 관한법률, 전자금융거래법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
본 약관에 동의하는 것은 정기적으로 서비스를 방문하여 본 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지않습니다.
회사가 이 약관을 개정하는 경우 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 7일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 고객에게 중요한 사항일 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 위 제1항의 방법으로 공지합니다.
회원이 개정된 약관에 동의하지 않는 경우 회원은 탈퇴(해지)를 할 수 있습니다. 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 간주합니다.
이 약관은 회사와 이용자 간에 성립되는 서비스 이용계약의 기본약정입니다. 회사는 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 “개별약관”이라고 합니다)을 정하여 미리 공지할 수 있습니다.
이용자가 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개별약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다. 개별약관의 변경에 관해서는 위 제2항을 준용합니다.
<p>
제 3 조 용어정의
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

“서비스”라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 “이용자”가 이용할 수 있는 온오프믹스 및 온오프믹스 관련 제반 서비스를 의미합니다.
“이용자”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 회원 및 비회원을 말합니다.
"회원"이라 함은 회사의 "서비스"에 회원가입을 한 자로서, 계속적으로 "회사"가 제공하는 "서비스"를 이용할 수 있는 자를 말합니다.
"비회원"이라 함은 회원에 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.
“아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합으로 이루어진 전자우편 주소를 의미합니다.
“비밀번호”라 함은 “회원”이 부여 받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
“유료서비스”라 함은 “회사”가 유료로 제공하는 서비스를 의미합니다.
“포인트”라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 “서비스” 상의 가상 데이터를 의미합니다.
“게시물”이라 함은 “이용자”가 “서비스”를 이용함에 있어 “서비스상”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
“제휴업체”란 회사와 별도의 계약을 맺고 회사와 함께, 또는 회사로부터 위탁을 받아 서비스를 제공하는 개인, 단체 또는 회사를 말합니다.
</p>
<p>
제 4 조 약관 외 준칙
본 약관은 회사가 제공하는 서비스에 관한 별도의 이용안내와 함께 적용합니다.
이 약관에 명시되지 않은 사항에 대해서는 관계법령 및 회사가 정한 서비스의 세부이용지침 등의 규정에 의합니다.
</p>
<p>
제 5 조 이용자에 대한 통지
회사 및 회사와 제휴한 업체가 이용자에게 통지하는 경우, 이용자에게 전자우편 및 기타 방법을 통해 할 수 있습니다. 이 때 이용자가 회사에 알린 연락처 중 가장 최근의 정보를 활용하여 통지하며, 이로써 적법한 통지를 완료한 것으로 봅니다.
회사 및 제휴업체가 불특정 다수의 이용자에 대한 통지를 하는 경우는 7일 이상의 기간 동안 인터넷사이트에 공지함으로써 제1항에 따른 개별 통지에 갈음할 수 있습니다.
</p>
<p>
제 2 장 서비스이용계약의 체결
제 6 조 서비스이용계약의 체결
회원의 이용계약은 회원으로 등록하여 서비스를 이용하려는 자(이하 가입신청자)의 본 약관 내용에 대한 동의와 가입신청에 대하여 회사가 이용을 승낙함으로써 성립합니다.
이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
회원으로 등록하여 서비스를 이용하려는 자는 서비스 가입신청 시 본 약관을 읽고 아래에 있는 "약관 동의"를 체크하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.
비회원의 이용계약은 온오프믹스의 회원으로 등록하지 않고 행사/이벤트 등에 참가 신청하여 비회원으로서 서비스를 이용하려는 자가 본 약관 내용에 대한 동의와 함께 참가신청을 함으로써 성립합니다.
이용계약의 성립 시기는 참가신청 내역을 신청 절차 상에서 표시하거나, 이메일(E-mail) 또는 기타 회사가 정하는 방법으로 비회원에게 도달한 시점으로 합니다.
비회원으로 등록하여 서비스를 이용하려는 자는 이벤트 참가신청 시 본 약관을 읽고 아래에 있는 "약관 동의"를 체크하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.
약관을 읽지 않음으로 발생할 수 있는 피해의 책임은 전적으로 이용자에게 있습니다.
“회사”는 “이용자”에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
</p>
<p>
제 7 조 서비스이용신청
서비스를 이용하고자 하는 자는 아래 사항을 회사가 온라인으로 제공하는 양식에 따라 기재하여야 합니다.
개인
성명
아이디(E-MAIL주소)
비밀번호
휴대전화번호
사업자
사업자명
대표자성명
사업장주소
전화번호
담당자휴대전화번호
팩스번호
아이디 (E-MAIL주소)
비밀번호
사업자등록번호(개인사업자, 법인포함) 또는 법인등록번호(법인인 경우)
업태
종목
정산정보
개인 : 신분증 사본, 결제정산금액 입금통장 사본
사업자 : 사업자등록증 사본, 결제정산금액 입금통장 사본
신청정보
신청그룹
이름
아이디 (E-MAIL)
비밀번호
휴대전화번호
</p>
<p>

제 4 장 서비스 이용
제 15 조 서비스 이용시간
서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 회사는 시스템 정기점검, 증설 및 교체를 위해 회사가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사전에 공지합니다.
회사는 다음 경우에 대하여 사전 공지나 예고 없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.
긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우
국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우
서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
전항에 의한 서비스 중단의 경우 회사는 사전에 공지사항 등을 통하여 회원에게 통지합니다. 단, 회사가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 예외로 합니다.
회사는 서비스를 특정범위로 분할하여 범위 별로 이용가능시간을 별도로 지정할 수 있으며 이 경우 그 내용을 사전공지합니다.
</p>
<p>
제 16 조 서비스 이용해지
회원이 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록 해지 신청을 하여야 합니다.
비회원이 이용계약을 해지하고자 하는 경우에는 비회원 본인이 온라인을 통하여 참여신청을 취소 하여야 합니다.
회사가 제3자에게 합병 또는 분할 합병되거나 서비스를 제3자에게 양도함으로써 서비스의 제공 주체가 변경되는 경우, 회사는 사전에 이메일과 공지 사항으로 회원에게 통지합니다. 이 경우 합병, 분할합병, 서비스 양도에 반대하는 회원은 서비스 이용계약을 해지할 수 있습니다.
</p>
<p>
제 17 조 서비스 이용제한
이용자는 다음 각 호에 해당하는 행위를 하여서는 아니 됩니다. 해당 행위를 한 경우에 회사는 이용자에게 경고 누적 등 적법한 조치를 취할 수 있으며, 이 경우 회사는 이용자에게 이메일, 전화, 기타의 방법으로 사유를 명시하여 사전 통지하고, 경중에 따라 한시적, 영구적으로 서비스 이용을 제한하거나 이용계약을 해지할 수 있습니다.
회원가입 신청 또는 회원정보 변경 시 허위내용을 등록하는 행위
다른 이용자의 ID, 비밀번호, E-MAIL, 연락처 등 개인정보를 도용하는 행위
이용자 ID를 타인과 거래하는 행위
회사의 운영진, 직원 또는 관계자를 사칭하는 행위
회사로부터 특별한 권리를 부여 받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
서비스에 위해를 가하거나 고의로 방해하는 행위
본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위
공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
용도에 대한 자세하고 정확한 설명 없이 Active X, 스파이웨어, 애드웨어 등을 무조건 설치하도록 유도하는 행위
다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위
회사의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는 저장하는 행위
범죄와 결부된다고 객관적으로 판단되는 행위
본 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용 조건을 중대하게 위반하는 행위
기타 관계법령에 위배되는 행위
이용자는 제1항의 귀책사유로 인하여 회사나 다른 이용자에게 입힌 손해를 배상할 책임이 있습니다.
</p>
<p>
제 18 조 게시물의 관리
회사는 다음 각 호에 해당하는 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.

다른 이용자 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
불법복제 또는 해킹을 조장하는 내용인 경우
영리를 목적으로 하는 광고일 경우
범죄와 결부된다고 객관적으로 인정되는 내용일 경우
다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
기타 관계법령에 위배된다고 판단되는 경우
[모임 게시물 원칙]
모임 게시물의 범위는 모임페이지 개설을 위해서 작성되는 모든 내용에 해당합니다.
</p>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기 </button>
        <button type="button" class="btn btn-primary" onclick= "checkModal1()" data-bs-dismiss="modal">동의 </button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModal2" tabindex="-1"role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     
<p>
       기타 신청내용
서비스를 이용하려는 자는 반드시 본인의 정보를 거짓없이 기재하여야 합니다. 본인의 정보로 등록하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용 시에 불이익을 당할 수 있습니다.
또한 서비스에서의 어떠한 권리도 주장할 수 없습니다.
회사는 회원가입 및 모임 참여신청 시의 실명확인을 위하여 실명확인 조치를 할 수 있습니다.
타인의 명의(이름, 회사명, 단체명)를 도용하여 이용신청을 한 이용자의 모든 ID는 삭제되며, 관계법령에 따라 처벌을 받을 수 있습니다.
</p>
<p>
제 8 조 이용신청의 승낙
“회사”는 “이용자”의 신청에 대하여 “서비스” 이용을 승낙함을 원칙으로 합니다. 다만, “회사”는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
이용자가 이 약관에 의하여 이전에 서비스 이용 자격을 상실한 적이 있는 경우, 다만, 자격 상실 후 1년이 경과한 자로서 “회사”로부터 서비스 이용 승낙을 얻은 경우에는 예외로 함.
실명이 아니거나 타인의 명의를 이용한 경우
허위의 정보를 기재하거나, “회사”가 제시하는 내용을 기재하지 않은 경우
이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
제1항에 따른 신청에 있어 “회사”는 “회원”의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
“회사”는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
제1항과 제3항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, “회사”는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
제 9 조 서비스의 위탁
회사는 필요하다고 인정하는 경우 서비스의 일부를 제휴업체에 위탁할 수 있습니다.
</p>
<p>
제 10 조 개인정보보호정책
회사는 관계법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위하여 노력을 합니다.
이용자의 개인정보보호에 관하여 관계법령 및 회사가 정하는 “개인정보취급방침”에 정한 바에 따릅니다. 단, 이용자의 귀책사유로 인해 노출된 정보에 대해 회사는 회사의 고의 또는 중과실이 있는 경우를 제외하고 일체의 책임을 지지 않습니다.
회사는 이용자가 미풍양속에 저해되거나 국가안보에 위배되는 파일 등 위법한 자료를 등록 배포할 경우 관련기관의 요청이 있을 시 이용자의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.
</p>
<p>
제 11 조 회원정보의 변경
“회원”은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디 등은 수정이 불가능합니다.
“회원”은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 “회사”에 대하여 그 변경사항을 알려야 합니다.
제2항의 변경사항을 “회사”에 알리지 않아 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.
</p>
<p>
제 12 조 회원ID 부여 및 변경 등
회사는 이용고객에 대하여 약관에 정하는 바에 따라 이용자 ID를 부여합니다.
회원ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경하고자 하는 경우에는 해당 ID를 해지하고 재가입해야 합니다.
회원ID는 이용자 본인의 동의 하에 회사가 운영하는 자사 사이트의 회원ID와 연결될 수 있습니다.
회원ID는 다음 각 호에 해당하는 경우에는 이용고객 또는 회사의 요청으로 변경할 수 있습니다.
타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우
기타 합리적인 사유가 있는 경우
서비스 회원ID 및 비밀번호를 제3자에게 노출하거나 제3자가 이를 이용하게 하여서는 안 됩니다. 이를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 제3자에 의한 부정이용 등에 대한 책임은 이용자에게 있습니다. 단, 이것이 회사의 고의 또는 과실로 인하여 야기된 경우는 회사가 책임을 부담합니다.
기타 이용자 개인정보 관리 및 변경 등에 관한 사항은 서비스 별 안내에 정하는 바에 의합니다.
제 3 장 계약 당사자의 의무
</p>
<p>
제 13 조 회사의 의무
회사는 관련법과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다합니다.
회사는 이용자가 안전하게 서비스를 이용할 수 있도록 보안 시스템을 구축하며 개인정보보호정책을 공시하고 준수합니다.
회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
회사는 서비스 제공과 관련하여 알고 있는 이용자가 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 관계법령에 의한 수사상의 목적으로 관계기관으로부터 요구 받은 경우나 방송통신심의위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다.
회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.
</p>
<p>
제 14 조 이용자의 의무
이용자는 회원가입 신청 또는 회원정보 변경 시 실명으로 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다.
이용자는 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등 회사가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상시키는 행위를 해서는 안됩니다.
이용자는 주소, 연락처, 전자우편 주소 등 이용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 회사에 즉시 알려야 합니다.
회사가 관계법령 및 ‘개인정보 보호정책’에 의거하여 그 책임을 지는 경우를 제외하고 회원에게 부여된 ID의 비밀번호 관리소홀, 비회원에게 부여된 참여신청 비밀번호 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 이용자에게 있습니다. 단, 이것이 회사의 고의 또는 과실로 인하여 야기된 경우는 회사가 책임을 부담합니다.
이용자는 회사의 사전 승낙 없이 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동의 결과에 대해 회사는 책임을 지지 않습니다. 또한 이용자는 이와 같은 영업활동으로 회사가 손해를 입은 경우, 이용자는 회사에 대해 손해배상의무를 지며, 회사는 해당 이용자에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.
이용자는 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.
이용자는 회사 및 제 3자의 지적 재산권을 침해해서는 안 됩니다.
이용자는 다음 각 호에 해당하는 행위를 하여서는 안 되며, 해당 행위를 하는 경우에 회사는 사전통보 없이 이용자의 서비스 이용제한 및 적법 조치를 포함한 제재를 가할 수 있습니다.
회원가입 신청 또는 회원정보 변경 시 허위내용을 등록하는 행위
다른 이용자의 ID, 비밀번호, E-MAIL, 연락처 등 개인정보를 도용하는 행위
이용자 ID를 타인과 거래하는 행위
회사의 운영진, 직원 또는 관계자를 사칭하는 행위
회사로부터 특별한 권리를 부여 받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
서비스에 위해를 가하거나 고의로 방해하는 행위
본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위
공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
용도에 대한 자세하고 정확한 설명 없이 Active X, 스파이웨어, 애드웨어 등을 무조건 설치하도록 유도하는 행위
다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위
회사의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는 저장하는 행위
범죄와 결부된다고 객관적으로 판단되는 행위
본 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용 조건을 위반하는 행위
기타 관계법령에 위배되는 행위
</p>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기 </button>
        <button type="button" class="btn btn-primary" onclick= "checkModal2()" data-bs-dismiss="modal">동의 </button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
<p>      
회사는 참여신청 기능을 사용하지 않는 모임은 ‘외부접수’로 판단합니다.
‘모임소개’ 또는 ‘모임상세정보’에 외부접수 방법으로 연결된 url이 존재할 경우 ‘외부접수’로 판단합니다.
외부접수를 사용하는 모임은 ‘외부접수’ 로 분류하여 관리합니다.
무료모임을 개설하고 ‘모임소개’ 또는 ‘모임상세정보’에 비용을 받는 것으로 확인되는 경우 ‘유료모임’으로 판단하며 ‘유료모임’으로 분류하여 관리 합니다.
</p>
<p>

제 19 조 게시물에 대한 저작권
이용자가 서비스 내에 게시한 게시물의 저작권은 게시한 이용자에게 귀속됩니다. 또한 회사는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만, 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.
이용자는 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.
이용자는 회원이 게시하거나 등록하는 서비스 내의 내용물, 게시 내용에 대해 제18조 제1항의 각 호에 해당한다고 판단되는 경우 사전통지 없이 수정, 삭제하거나 이동 또는 등록을 거부할 수 있습니다.
</p>
<p>
제 20 조 서비스 내 링크에 대한 보증
회사가 제공하는 서비스 내에는 다양한 배너와 링크(Link)를 포함하고 있습니다. 많은 경우 타 사이트의 페이지와 연결되어 있으며, 이는 광고주와의 계약관계에 의하거나 제공받은 콘텐츠의 출처를 밝히기 위한 조치입니다. 서비스 내에 포함되어 있는 링크를 클릭하여 타 사이트의 페이지로 옮겨갈 경우 해당 사이트의 개인정보보호정책은 회사와 무관하므로 새로 방문한 사이트의 정책을 검토하셔야 합니다.
</p>
<p>
제 21 조 정보의 제공
회사는 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 전자우편이나 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.
회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 추가적인 개인 정보를 요구할 수 있습니다.
</p>
<p>
제 22 조 광고게재 및 광고주와의 거래
회사가 이용자에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 이용자는 서비스 이용 시 노출되는 광고게재에 대해 동의합니다.
회사는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.
</p>
<p>
제 5 장 손해배상 및 기타사항
제 23 조 손해배상 등
회사는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 회사는 개설자가 제공하거나 이용자가 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 허위성, 위법성이 객관적으로 확인된 경우를 제외하고 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 그와 관련하여 회사의 고의 또는 중과실이 있는 경우를 제외하고 어떠한 책임도 지지 않습니다.
회사는 회사의 과실로 인하여 이용자가 손해를 입게 될 경우 본 약관 및 법령에 따라 이용자의 손해를 배상하겠습니다. 다만 회사는 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다.
회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.
회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 회사의 고의 또는 중과실이 있는 경우를 제외하고 책임이 면제됩니다.
회사는 이용자의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 회사의 고의 또는 중과실이 있는 경우를 제외하고 책임을 지지 않습니다.
회사는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 이용자가 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
회사는 이용자가 서비스를 이용하여 기대하는 이익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.
회사는 이용자가 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 회사의 고의 또는 중과실이 있는 경우를 제외하고 책임을 지지 않습니다.
회사는 이용자가 서비스를 이용하며 다른 이용자로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을 지지 않습니다.
회사는 이용자 상호간 및 이용자와 제3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.
</p>
<p>
제 24 조 분쟁의 해결
회사와 이용자는 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 노력을 합니다.
회사는 이용자로부터 제출되는 불만사항 및 의견을 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보합니다.
제 25 조 재판권 및 준거법
이 약관에 명시되지 않은 사항은 대한민국 관계법령과 상관습에 따릅니다.
회사의 정액 서비스 회원 및 기타 유료 서비스 이용 회원의 경우 회사가 별도로 정한 약관 및 정책에 따릅니다.
서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 민사소송법상의 주소지를 관할하는 법원을 합의관할로 합니다.
부칙
책임 한계와 법적고지
회사는 회원 및 일반 이용자들이 서비스(http://www.onoffmix.com)에서 제공하는 각종 정보와 서비스를 이용하는데 있어 유의하여야 할 사항들을 다음과 같이 고지 합니다.
</p>
<p>

회사가 제공하는 서비스에 관한 저작권 및 기타 지적재산권은 회사에 속합니다.
이용자는 회사가 제공하는 서비스를 무단으로 전재하거나 회사의 사전동의 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
회사는 회원들에 대한 서비스 제고를 위해 외부의 전문 업체들과 협력, 다양한 정보와 상품 컨텐츠를 제공받고 있습니다.
회사 및 정보제공자가 제공하는 이들 정보는 오류가 있을 수 있고, 서비스가 지연될 수도 있으며, 이러한 정보의 오류나 서비스의 지연에 대해 회사는 회사의 고의 또는 중과실이 있는 경우를 제외하고 어떠한 책임도 지지 않습니다.
회사가 직접 주최/주관하는 모임/행사 이외에 회원이 개설한 모임/행사의 컨텐츠 및 상품은 회사의 통제 권한 밖에서 제작되었습니다.
회사의 통제 권한 밖에서 제작된 컨텐츠의 경우 컨텐츠의 내용이 제3 자에 의하여 개발되었으므로 회사의 책임여부와는 무관하며, 사이트 내에 수록된 자료의 정확성이나, 상표법, 저작권법 등의 관계법령의 준수 여부에 대하여 회사의 고의 또는 중과실이 있는 경우를 제외하고 어떠한 책임도 지지 않습니다.
회사의 결제수단을 이용하지 않는 모임은 회사의 통제 권한 밖에서 진행되는 행사 입니다.
회사는 모임 개설자와 모임 참석자간의 사고가 발생하지 않게 하기 위해서 회사의 결제수단을 사용하는 경우 행사종료일 +7일 이후에 정산이 되는 것을 원칙으로 하고 있습니다. 개설자통장입금을 통해서 참석자가 모임 개설자의 계좌번호로 직접 입금을 한 경우에는 회사의 통제 권한이 닿지 못하는 관계로 보호해드릴 수 없습니다.
이용자는 회사의 서비스를 통하여 욕설, 비방, 외설, 폭력적 내용의 표현, 허위정보 유포, 바이러스 등의 유포 등의 행위를 하여서는 안됩니다.
이러한 내용을 담고 있거나 담고 있을 것이라고 의심되는 게시물 또는 링크 등은 사전통보 없이 수정 또는 삭제 조치될 수 있으며, 그 정도에 따라 회원탈퇴 및 기소 등의 조치가 취해질 수도 있습니다.
이용자는 다량의 정보를 전송하거나 동일한 또는 유사한 내용의 정보를 반복적으로 게시하여 서비스의 안정적인 운영을 방해하거나, 광고성 정보를 수신자의 의사에 반하여 전자우편으로 지속적으로 전송 또는 게시판에 게시하여 다른 이용자의 서비스 이용을 방해하는 행위를 하여서는 안됩니다. 이러한 내용을 담고 있거나 담고 있을 것이라고 의심되는 게시물이나 링크 등은 사전통보 없이 수정 또는 삭제 조치될 수 있으며, 그 정도에 따라 회원탈퇴 및 기소 등의 조치가 취해질 수도 있습니다.
</p>
<p>
이용자는 서비스 또는 서비스에 연결되어 있는 서버나 네트워크를 방해 또는 간섭하거나, 서비스에 관련된 네트워크의 요건, 절차, 정책 또는 규정을 준수하지 않는 등의 방법으로 업무나 서비스의 운영을 방해하여서는 안됩니다.


온오프믹스의 “책임한계와 법적고지”에 관하여 의문사항이 있으시면 연락 바랍니다.

문의 : (02) 6080-5579 (webmaster@onoffmix.com)


[부칙] (2007. 10. 20)
(시행일) 본 약관은 2007년 10월 20일부터 시행합니다.
[부칙] (2010. 06. 18)
(시행일) 본 약관은 2010년 06월 18일부터 시행합니다.
[부칙] (2013. 02. 14)
(시행일) 본 약관은 2013년 02월 14일부터 시행합니다.
[부칙] (2014. 04. 10)
(시행일) 본 약관은 2014년 04월 10일부터 시행합니다.
[부칙] (2014. 06. 02)
전자금융거래이용약관이 삭제 되었습니다.
(시행일) 본 약관은 2014년 06월 02일부터 시행합니다.
[부칙] (2017. 06. 14)
(시행일) 본 약관은 2017년 06월 14일부터 시행합니다.
[부칙] (2019. 11. 07)
(시행일) 본 약관은 2019년 11월 07일부터 시행합니다.
</p>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기 </button>
        <button type="button" class="btn btn-primary" onclick= "checkModal3()" data-bs-dismiss="modal">동의 </button>
      </div>
    </div>
  </div>
</div>

 <nav class="navbar navbar-default" style="background-color:#F4F8FB;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
		<a class="navbar-brand" href="/security/mainpage"><span style="font-style: italic ; font-weight: bold; font-size: 1.5em;">MeetUp</span> <span class="sr-only">(current)</span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/security/mainpage">HOME</a></li>
        <li><a href="/view/allclassview" >전체 클래스 목록보기</a></li>
        <li><a href="/view/meetupwriteview">클래스 개설하기</a></li>
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

<div class="container-fluid">
<div class="row">
	<div style="margin:0 auto; width:850px;">
		<div id="coverall">
		<div style="margin-left:30px;margin-top:20px;"><span style="font-size: 2.0em;"><strong> 회원가입 </strong></span></div>
<!-- 	 <div class="row placeholders" style="margin-bottom:20px;"> -->
	   <div class="joinform">
	   		<div class="joinid">
	   			<label>아이디</label>
	   			<input type="text" onkeyup="idCheckFunciton();" id="userID" name="userID"> 
	   			<span><button onclick="registerCheckFunction();" type="button" class="btn btn-default btn-sm" id="idcheckbtn" value="false">중복체크</button></span>
	   			<div id="checkMessage"></div>
	   			<div class="text_wrapper" style="display:none;"><input type="text" id="idvalue" value="" /></div>
	   		</div>
	   		<div class="joinpw">
	   			<label>비밀번호</label>
	   			<input onkeyup="passwordCheckFunciton();" type="password" id="userPassword1" name="userPassword1" size="20">	   				
	   		</div>
	   		<div class="joinpwcheck">
	   			<label>비밀번호 확인</label>
	   			<input onkeyup="passwordCheckFunciton();" type="password" id="userPassword2" name="userPassword2" size="20">
	   			<div id="passwordCheckMessage"></div>	
	   		</div>
	   		<div class="joinname">
	   			<label>이름</label>
	   			<input type="text" id="userName2" name="userName2">
	   			<div id="nameCheckMessage"></div>	
	   		</div>
	   		<div class="joinnick">
	   			<label>닉네임</label>
	   			<input type="text" id="userName" name="userName">	
	   			<div id="nicknameCheckMessage"></div>
	   		</div>
	   		<div class="joinmail">
	   			<label>이메일</label>
	   			<input type="text" id="usereMail" name="usereMail">
	   			<div id="eMailCheckMessage"></div>
	   		</div>
	   	</div>	
	   	<hr/>
			<div class="checkbox_group">
				<div><h2 style="font-size:20px;">이용약관 / 개인정보 수집 및 이용 동의</h2></div>
				<div id="agreement">	
					<div id="allcheck">
				  		<input type="checkbox" id="check_all" onclick="checkGo()" >
				 		 <label for="check_all">전체 동의</label>
					</div>
					<div>
					 	<input type="checkbox" id="check_1" class="normal" onclick="fOnClick()" >
					 	<label for="check_1"><span style="color:red">(필수)</span>개인정보 처리방침 동의</label>
					 	 <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModal1">
					 	 내용보기 
						</button>
						<div style="text-align: left;color: red; font-size: 0.8em;display:none;" colspan="3" id="fCheckBox"></div>
					</div>					
					<div>
					  <input type="checkbox" id="check_2" class="normal" onclick="sOnClick()">
					  <label for="check_2"><span style="color:red">(필수)</span>서비스 이용약관 동의</label>					
					  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModal2">
					  내용보기 
					  </button>
					  <div style="text-align: left;color: red; font-size: 0.8em;display:none;" colspan="3" id="sCheckBox"></div>
					</div>
					<div>
						<input type="checkbox" id="check_3" class="normal" >
						<label for="check_3">(선택)마케팅 수신 동의 </label>				
						<button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModal3">
						  내용보기 
						</button>
						<input type="hidden" value="agree" name="agree" id="agree">	
					</div>
				</div>
			</div>
		<div class="joinsubmit"><input type="button" class="btn btn-primary" value="회원가입" onclick="joinFormCheck()"></div>
	</div>
	</div>
</div>
</div>
<!--  <script src="/webjars/bootstrap/5.0.1/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
 -->
 <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
 	
</body>
</html>
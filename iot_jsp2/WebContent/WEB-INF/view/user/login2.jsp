<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/login.css" />
<body>
<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
<div id="login">
  <form>
    <h1>Sign In</h1>
    <input type="text" placeholder="Username"  id="userId" name="userId" autofocus >
    <input type="password" id="userPwd" name="userPwd" placeholder="Password">
					<input	type="checkbox" id="saveId">아이디 저장
    <button id="loginBtn" type="button" value="Login" onclick="checkValue()">Sign in</button>
    <a href="/view/user/signin">회원가입</a>
    
  </form>
</div>
</body>
<script>

function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

$(document).ready(function() {
	var userId = getCookie("userId");
	var saveId = getCookie("saveId");
	if (userId) {
		$("#userId").val(userId);
		$("#saveId").prop("checked", true);
	}
});
function checkValue(){
	var objs = $(".container");
	var userId = $("#userId").val().trim();
	var userPwd = $("#userPwd").val().trim();
	var saveId = $("#saveId").prop("checked");
	if(userId.length<3){
		alert("아이디를 확인해주세요");
		$("#userId").focus();
		return;
	}
	if(userPwd.length<3){
		alert("비밀번호를 확인해주세요");
		$("#userPwd").focus();
		return;
	}
	var param = {uiId:userId, uiPwd:userPwd,saveId:saveId};
	
	param = "param=" + encodeURIComponent(JSON.stringify(param));
	$.ajax({
		url : '<%=rootPath%>/user/login',
		data : param,
		type :'get',
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.login=="ok"){
				location.href="<%=rootPath%>/";
			}
		},
		error:function(xhr){
			alert(xhr.responseText);
		}
	})
}
</script>
</html>
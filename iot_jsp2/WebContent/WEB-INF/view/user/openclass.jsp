<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />

	<div class="container">
		<div class="starter-template">

			<form class="form-signin">
				<table class="table">
					<tr>
						<th>클래스이름</th>
						<td><input type="text" id="ciName" name="ciName"
							class="form-control" placeholder="클래스이름" autofocus></td>
					</tr>
					<tr>
						<th>클래스설명</th>
						<td><input type="text" id="ciDesc" name="ciDesc"
							class="form-control" placeholder="클래스설명"></td>
					</tr>
				
					<tr>
						<td colspan="2"> 
							<input class="btn btn-lg btn-primary btn-block" type="button"
								id="insertBtn" value="insert" onclick="insertClass()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function insertClass(){
	var ciName = $("#ciName").val().trim();
	var ciDesc = $("#ciDesc").val().trim();
	var param= {ciName:ciName,ciDesc:ciDesc};
	param = "param=" +JSON.stringify(param);
	$.ajax({
		url : '/class/openclass',
		type : 'post',
		data : param,
		success:function(res){
			alert(res);
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="/view/user/classlist";
			}
		},
		error:function(xhr,status,error){
			
		}		
	})
}
$(document).ready(function(){
	$.ajax({
		url : '/class/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str = "";
			for(var ci of list){
				str += "<option value='" + ci.ciNo + "'>" + ci.ciName +"</option>";
			}
			//document.getElementById("ciNo").insertAdjacentHTML("beforeend",str);
			$("#ciNo").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
</html>
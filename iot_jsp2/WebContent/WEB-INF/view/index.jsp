<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(user==null){
	//response.sendRedirect("/view/user/login");
}else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IOT_TEST</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/index.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
    <div class="container">

      <div class="starter-template">
        <h1><%=user.getUiName()%>님 환영합니다.</h1>
        
      </div>
    </div><!-- /.container -->
</body>
</html>
<%
}
%>
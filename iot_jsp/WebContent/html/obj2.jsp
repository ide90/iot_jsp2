<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	var arr = {};
	arr["wheels"] = 4;
	arr["engines"] = 1;
	arr["seats"] = 5;

/* 	var arr = {
			wheels : 4,
			engines : 1,
			seats : 6
		}	
	
	
	arr.wheels=3;
	arr["wheels"]=5; 
	위와같음
	*/
	for (var key in arr) {
		alert(key + ":" + arr[key]);

	}
</script>
<body>

</body>
</html>
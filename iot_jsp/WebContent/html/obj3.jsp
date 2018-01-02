<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	var obj = {
		func1 : function() {
			alert(1);
		},
		func2 : function() {
			alert(2);
		}
	} 
	//obj.func1();
	//obj.func2();
	 
	var func = function(obj){
		this.callAllFunc = function(){
			obj.func1();
			obj.func2();
		}
	}
	var f = new func(obj);
	f.callAllFunc();
	
	
	
	var Car = function(arr){
		this.wheels =arr[0];
		this.engines = arr[1];
		this.seats = arr[2]; //p1,p2,p3
	}
	var c = new Car([1,2,3]);

	
	
</script>
<body>

</body>
</html>
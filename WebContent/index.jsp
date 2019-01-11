<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jq/jquery-3.1.1.js"></script>

<script type="text/javascript">
$(function() {
	/* 获取input框姓名输入框的对象并且给他注册失去焦点时的函数 */
	$("#name").blur(
		function () {			
			/* 获取input框中你输入的value值 */
			 var val	=$("#name").val();
			
			$.ajax({
			  	url : "AjaxServlet",                      //要提交的URL路径
				type : "POST",                   //发送请求的方式
				data : {"name":val},                    //要发送到服务器的数据
				dataType : "json",              //指定传输的数据格式
				success : function(result) {//请求成功后要执行的代码
				/*  */ //通过html的工具给span标签更改内容
		          console.log(result.msg);
		          console.log(result.data);
		          console.log(val);
		        /* 通过后台selvet传过来的key值进行判断让获取到的对象颜色改变 */
		          if (result.msg=="201"||result.msg=="200") {
		        	 /* 获取div对象并且操作样式 */
		        	  $("#hh").css("color","red");
				}
		          /* 给提示框就是获取到的div对象添加内容,内容是后台传过来的value值 */
		          $("#hh").html(result.data);
				},
				error : function() { //请求失败后要执行的代码
				}
			});

			
			
			
			
			
			
		}	
	
	)

}
)

function change() {
var v=$("#hh").html();
console.log(v);


$.ajax({
  	url : "AjaxServlet",                      //要提交的URL路径
	type : "POST",                   //发送请求的方式
	data : {"name":"zhangsan5","age":"19"},                    //要发送到服务器的数据
	dataType : "json",              //指定传输的数据格式
	success : function(result) {//请求成功后要执行的代码
	/* $("#hh").html(result); */ //通过html的工具给span标签更改内容
	
	
	
	
	console.log(result);
	console.log(result.msg);
	console.log(result.data);
	
	
	
	},
	error : function() { //请求失败后要执行的代码
	}
});











}


</script>


</head>

<body>

姓名<input type="text"  id="name"    />   
<span id="hh"></span>
<br />
密码<input type="text" />
<input type="submit" value="注册"  />







<button id="butt" onclick="change()" >点击改变</button>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style type="text/css">
	    body{
	    	/*background: rgba(4,40,68,0.85);*/
	    	background: 	#f98033;
	    	font-family: "微软雅黑";
	    }
       .login{
       	border-radius: 2px 2px 5px 5px;
       	background: #ffffff;
       	width: 400px;
       	box-shadow: 3px 10px 5px rgba(0,0,0,0.3);
       	padding-bottom: 20px;
       	padding: 10px 20px 20px 20px;
       	margin:150px auto;
       }
       .login .title{
			color: #444;
			font-size: 1.2em;
			font-weight: bold;
			/*margin: 10px 0 5px 0;*/
			padding-bottom: 20px;
			border-bottom: 1px solid #eee;
		}
		.login .userinput{
			display: block;
			padding: 15px 10px;
			margin-bottom: 10px; 
			width: 90%;
			border: 1px solid #ddd;
			border-radius: 2px;
			color: #ccc;
			margin: 15px auto;
			transition: border-width 0.2s ease;/*移动效果*/
			outline: none;

		}
		.login .userinput:focus{
			/*border-color: #2196F3;*/
			border-color:#FFA54F;
			border-left-width: 35px;
			width: 80%; 
		}
		.login .btn{
			display: block;
			color: #fff;
			/*background: #2196F3;*/
			background:#FFA54F;
			border: none;
			height: 35px;
			width: 100%;
			margin: 10px auto;
			border-radius: 0 0 2px 2px;
			box-shadow: 0px 1px 3px #FFA54F;
			font-size: 14px;
		}
		p{
			font-size: 13px;
		}
    </style>
</head>
<body>
	<form class="login">
		<h2 class="title">登录页面</h2>
		<input type="text" placeholder="请输入用户名" class="userinput">
		<input type="password" placeholder="请输入密码" class="userinput">
		<input type="button" value="登录" class="btn">
		<p><a href="page/register.jsp">立即注册</a></p>
	</form>

</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	var nameobj=document.getElementsByClassName("userinput")[0];
	var pwdobj=document.getElementsByClassName("userinput")[1];
	
	var btnobj=document.getElementsByClassName("btn")[0];
	
	btnobj.onclick=function()
	{
		var namevalue=nameobj.value;
		var pwdvale=pwdobj.value;		
		$.ajax({
				type:"get",
				url:"users",
				data:{"username":namevalue,"userpwd":pwdvale,"action":"login"},
				dataType:'json',
				success:function(data){					
					if(data==0)
					{
						alert("您输入的用户名和密码不对，请重新输入！");
					}
					else
					{
						alert("登录成功！");
						window.location.href="index.jsp";
					}					
			}
		});		
	}

</script>
</html>
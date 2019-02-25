<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
		font-family: "微软雅黑";		
	}
	body{
		/*display: flex;
		justify-content: center;
		align-items: center;*/
		background: 	#f98033;
	}

	.basc{
		width: 400px;
		padding: 25px 20px 20px 20px;
		border-radius: 2px 2px 5px 5px;
		background-color: #fff;
		box-shadow: 3px 10px 5px rgba(0,0,0,0.3);
       	padding-bottom: 20px;
       	margin: 80px auto;
	}
	p{
		display: flex;
		justify-content:space-between;
		align-items: center;
		padding-bottom: 15px;
		border-bottom: 1px solid #eee; 
		/*border: 1px solid #fc0;*/
		width: 90%;
	}
	.tital{
		font-size: 24px;
		font-weight: bold;
		/*margin: 10px 0 5px 0;*/
		
	}
	form{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	form div{
		display: block;
		padding: 3px 3px;
		/*margin-bottom: 10px; */
		width: 90%;
		margin: 3px auto;
		/*border:  1px solid #fc0;*/
	}
	form div input{
		border:  1px solid #ddd;
		border-radius: 2px;
		color: #ccc;
		width: 90%;
		margin: 5px auto;
		display: block;
		padding: 15px 10px;
		font-size: 14px;
		outline: none;
	}
	form div button{
		display: block;
		color: #fff;
		background:#FFA54F;
		border: none;
		height: 40px;
		width: 100%;
		margin: 10px auto;
		border-radius: 0 0 2px 2px;
		box-shadow: 0px 1px 3px #FFA54F;
		font-size: 14px;		
	}
	.code{
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.code div{
		border: 1px solid #eee;
		width: 40%;
		display: block;
		padding: 13px 10px;
		margin-left: 10px;
	}
	#code{
		background: #f98033;
		color:#fff;
		text-align: center;
		letter-spacing: 4px;
		font-style: italic;
		font-weight: bold;
		display: block;
		cursor: pointer;
	}
</style>
<body>
<div class="basc">
	
	<form>
		<p>
			<span class="tital">用户注册</span>
			<span>
				<span>已有账号</span>
				<span><a href="../login.jsp">立即登录</a></span>
			</span>
		</p>
		<div><input type="text" name="name" placeholder="请输入用户名" class="userinput"></div>
		<div><input type="password" name="pwd" placeholder="请输入密码" class="userinput"></div>
		<div><input type="password" name="respwd" placeholder="请再次确认密码" class="userinput"></div>
		<div class="code"><input type="text" placeholder="请输入验证码" class="userinput"><div id="code">验证码</div></div>
		<div><button id="btn">注册</button></div>
	</form>
</div>

</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	//注册
	var nameobj=document.getElementsByClassName("userinput")[0];
	var pwdobj=document.getElementsByClassName("userinput")[1];
	var resobj=document.getElementsByClassName("userinput")[2];	
	var btnobj=document.getElementById("btn");
	var codeobj=document.getElementsByClassName("userinput")[3];
	
	
	
	//生成验证码
	
	var randomobj=document.getElementById("code");
	
	function randomCode()
	{
		$.ajax({
			type:"get",
			url:"/users",
			data:{"action":"randomdata"},
			dataType:'json',
			async:true,
			success:function(resp){	
				//alert(resp);
				randomobj.innerText=resp;
			}
		});
	}
	window.onload=function()
	{		
		randomCode();
	}		
	
	randomobj.onclick=function()
	{
		randomCode();
	}
	
	btnobj.onclick=function()
	{
		namevalue=nameobj.value;
		pwdvalue=pwdobj.value;
		resvalue=resobj.value;
		codevalue=codeobj.value;
		randomvalue=randomobj.innerText;
		//alert(namevalue+","+pwdvalue+","+resvalue+","+codevalue+"->"+randomvalue);
		if(namevalue==""||pwdvalue==""||codevalue=="")
			{
				alert("用户名，密码，验证码等都不能为空，请重新输入！");
			}
		else
		{
			if(pwdvalue!=resvalue)
			{
				alert("两次密码不一致，请重新输入！")
			}
			else if(randomvalue!=codevalue)
				{
					alert("请填写正确的验证码！");
				}
			else{			
				$.ajax({
					type:"get",
					url:"/users",
					data:{"username":namevalue,"userpwd":pwdvalue,"action":"register"},
					dataType:'json',
					async:true,
					success:function(resp){
					 	/*alert(resp);*/
						if(resp=="success")
							{
							alert("注册成功！");
							window.location.href="../index.jsp";
							}
						
						else{
							alert("对不起，您输入的账户已重复！");
						}
					}
				});		
			}	
		}
			
	}


</script>
</html>
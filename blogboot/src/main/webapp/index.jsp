<%@ page language="java" contentType="text/html; charset=utf-8"
  import="com.yxl.blogboot.model.Cont,java.util.List"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>blog 首页</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<%-- 	<%List<Cont> list=(List<Cont> )request.getAttribute("cont");
		for(Cont item:list)
		{
		
		}
	
	%> --%>
<div class="box">

	<div class="top">
		<div class="left">
			<img src="images/er.JPG" width="100%" height="100%">
			<!-- <div>觉得我写的不错，支持一下哈</div> -->	
		</div>
		<!-- <div class="right">
			<button id="checklogin">登录</button>
			<button id="checkres">注册</button>
		</div> -->
	</div>
	<div class="main">
		<div class="mainleft">
			<div class="peo">
				<div class="peotop">
					<div class="peoimg">
						<img src="images/peo.jpg" width="100%" height="100%">						
					</div>
					<div class="lotice">加关注</div>
				</div>
				<div class="ming">一叶扁舟</div>
				<div class="peofooter">					
					<div class="fen">粉丝<br>1</div>
					<div class="like">喜欢<br>1</div>
					<div class="guanzhu">关注<br>1</div>
				</div>

			</div>
			
			<div class="nav">
				<h3>个人菜单栏</h3>
				<ul>
					<li><a href="users?action=peo" target="conframe">个人介绍</a></li>
					<li><a href="#" target="conframe">技术博客</a></li>
					<li><a href="/users?action=lianjie" target="conframe">连接资料</a></li>
					<li><a href="#" target="conframe">站内消息</a></li>
					<li><a href="users?action=message" target="conframe">我的留言<a></li> 
				</ul>
			</div>
		</div>
		<div class="mainright" >
			<iframe name="conframe" src="/users?action=lianjie" class="mainframe"></iframe>
		</div>
	</div>
	
</div>


</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">

</script>

</html>
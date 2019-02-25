<%@ page language="java" contentType="text/html; charset=utf-8"
   import="java.util.List,com.yxl.blogboot.model.Code" pageEncoding="utf-8"%>
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
.box{
	width:90%;
	height:150px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 15px 20px;
	background: rgba(255,255,255,0.5);
	margin:10px;
}
.tital{
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	border-bottom: 1px dotted #999;
}
.tital div{
	margin:10px;
}
.username{
	font-size: 18px;

}
.usercom{
	font-size: 14px;
	color:#4682B4;	
}
.context{
	width: 100%;
	display: flex;
	text-indent: 2em;
	margin-top: 25px;
	
}
</style>
</head>
<body>
<%List<Code> data=(List<Code>)request.getAttribute("codedata");
	
	for(Code s : data)
	{
%>
	<div class="box">
		<div class="tital">
			<div class="username"><%= s.getCname()%></div>
			<div class="usercom"><%=s.getCemail() %></div>
		</div>

		<div class="context"><p><%=s.getCtext() %></p></div>
	</div>
		
	<%}%>



	
</body>
</html>
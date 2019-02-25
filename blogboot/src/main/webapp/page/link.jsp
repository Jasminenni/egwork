<%@ page language="java" contentType="text/html; charset=utf-8"
   import="com.yxl.blogboot.model.Csdn,java.util.List" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<% List<Csdn> datas=( List<Csdn> )request.getAttribute("data"); 
	for (Csdn item : datas)
	{
%>
		<div class="conter">
			<div class="top">
				<div class="time"><%=item.getCtime() %></div>
				<div class="tital"><a href="<%=item.getCurl()%>" target="_blank"><%=item.getCtital() %></a></div>
			</div>
			<div class="content"><%=item.getContent() %></div>
			<div class="foot"><%=item.getCfoot() %></div>
		</div>	
	<%}%>





</body>
</html>
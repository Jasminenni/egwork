<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人介绍</title>
</head>
<link href="../css/peo.css" type="text/css" rel="stylesheet">
<body>
<div style="width: 900px;">
    <header>
        <div id="head">

          <section class="right"><marquee>欢迎来到我的主页</marquee></section>
        </div>
    </header>
    <div id="bigbox">
      <section id="first">
          <article>
           <div id="art">
              <div class="home">
                    <p class="tital">一叶扁舟</p>
                    
                        <h1>个人说明</h1>
                        <p class="left_pra">我是来自四川自贡的巨蟹座一枚，平时没事做的时候喜欢看看电视，打打游戏，本人性格比较开朗，喜欢笑，喜欢新事物，喜欢睡懒觉，并且还很懒,优点很少，缺点很多 <br><a href="#second"><button>更多</button></a></p>                    
                        <p class="left_pic"><img src="../images/peo.jpg" width="100%" height="100%"></p>                                       
              </div>
             </div>
          </article>
     </section>
     <section id="second">
         <article>
             <div id="art2">
                 <div class="about">
                    <h1>个人简介</h2>
                    <h3>个人项目经验</h3>
                    <p>1,&nbsp;&nbsp;启用maven工程，运用MVC思想，并结合Spring Boot框架、jQuery 的 ajax，模拟开发了一个博客系统，该系统主要完成了用户登录注册，生成验证码，客户留言，数据实时更新等模块，模型层：采用jdbc来实现和处理数据，
                    视图层采用JSP来负责数据的展示，控制层采用Servlet来接收用户的请求并分析用户的请求，再将用户的请求转给具体的模型层来具体实现业务。再利用Spring来整个项目。
                    </p>
                    <p>2,&nbsp;&nbsp;采用Web Server技术，实现多端接入，完成了以java为服务端，python作为中间界，Android作为移动客户端，利用内网穿透与python连接制作完成了15个antv报表</p>
                    <p>3,&nbsp;&nbsp;采用python的flask框架，利用内网穿透完成微信小程序的开发，只要功能有用户登录注册，生成验证码，图片轮播，九宫格，利用聚合数据制作的头条新闻，tabbar菜单，音乐播放等模块</p>
                    <h3>专业技能</h3>
                 	<p>熟悉RMI远程方法调用技术，熟悉JS直接呼叫java的DWR技术，熟悉SPI技术，熟悉Web Service的多端接入技术，了解hessian技术，了解Struts2技术，对数据库的操作，熟悉jdbc，mybatis技术</p>
                 </div>
             </div>
         </article>
     </section>
     <section id="third">
        <article>
          <div id="art3">
             <div class="contact">
                 <p>联系我</p>
                 <div class="form">
                 <form>
                    <input type="text" placeholder="用户名" style="margin-top:30px;" class="userinput">
                    <input type="email" placeholder="邮箱" class="userinput"> 
                    <textarea name="" cols="45" rows="7" placeholder="请填写留言消息" class="userinput"></textarea>
                	<button id="submitbtn">提交</button>
                 </form>
                 
                 </div>
                 <aside>
                 <hgroup>
                    <h3>那些喜欢的句子</h3>
                    <p>既然启航了，就不要问路在哪里，迎风向前是唯一方法！</p>
                    <p>天助自助者，自强者天下无双</p>
                    <p>曾经拥有的，不要忘记。不能得到的，更要珍惜。属于自己的，不要放弃。已经失去的，留作回忆。</p>
                 </hgroup>
               
                 <!-- 也不知道该怎么用华丽的词语来评价，就觉的你写的挺好的 -->
                 </aside>
             </div>
        </div>
        </article>
     </section>
   </div>
</div>
<body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	var nameobj=document.getElementsByClassName("userinput")[0];
	var comobj=document.getElementsByClassName("userinput")[1];
	var treaobj=document.getElementsByClassName("userinput")[2];
	
	var btnobj=document.getElementById("submitbtn");
	
	btnobj.onclick=function(){
		
		var namevalue=nameobj.value;
		var comvalue=comobj.value;
		var treavalue=treaobj.value;
		if(namevalue==""||comvalue==""||""==treavalue)
			{
				alert("提交的用户名，邮箱，必须都要填写");
			}
		else
			{
			$.ajax({
				type:"get",
				url:"users",
				data:{"username":namevalue,"usercom":comvalue,"usertrea":treavalue,"action":"submit"},
				dataType:"json",
				success:function(data){					
				/*alert(data);*/
				if(data==1)
					alert("留言成功！感谢你的留言！");
			}
		});		
			}
	}

</script>
</body>
</html>
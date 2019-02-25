package com.yxl.blogboot.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.yxl.blogboot.model.Code;
import com.yxl.blogboot.model.Cont;
import com.yxl.blogboot.model.Csdn;
import com.yxl.blogboot.model.User;
import com.yxl.blogboot.service.DB;
import com.yxl.blogboot.util.CheckModel;

@WebServlet(name="UserServlet",urlPatterns="/users")
public class UserServlet extends HttpServlet
{
	@Autowired
	private DB db;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		System.out.println("UserServlet  doGet  ....");
		
		String  headerInfo=req.getHeader("user-agent");
		System.out.println("headerInfo-->"+headerInfo);
		
		
		
		String action=req.getParameter("action");
		System.out.println("action---->"+action);
		if(null==action||"".equals(action))
		{			
			List<Cont> datas=this.db.getData();
			
			if(CheckModel.checkMobile(headerInfo))
			{
				System.out.println("是手机端的请求！");
				String  strjson=JSON.toJSONString(datas);
				System.out.println("strjson-->"+strjson);
				
				
				//1.构建输出流
				PrintWriter  pw=resp.getWriter();
				//2.输出json字符串
				pw.println(strjson);
				//3.立即发送
				pw.flush();
				
				pw.close();
			}
			else
			{
				req.setAttribute("cont",datas);
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
			
		}
		else if("lianjie".equals(action))
		{
			List<Csdn> data=this.db.getData();
			System.out.println(data.size());
			req.setAttribute("data", data);
			req.getRequestDispatcher("page/link.jsp").forward(req, resp);
		}
		else if("login".equals(action))
		{
			String name=req.getParameter("username");
			String pwd=req.getParameter("userpwd");
//			User u = new User();
//			u.setName(name);
//			u.setPwd(pwd);
			System.out.println(name+"-->"+pwd);
			long result=this.db.checkName(name, pwd);
			//req.setAttribute("result", result);
//			req.getSession().setAttribute("loginname", u);
			PrintWriter pw= resp.getWriter();
			pw.print(result);
			pw.flush();
			pw.close();
			
		}
		else if("register".equals(action))
		{
			String name=req.getParameter("username");
			String pwd=req.getParameter("userpwd");
			System.out.println(name+"-->"+pwd);
			String res="";
			
				long count=this.db.checkName(name, pwd);
				
				if(count>0)
				{
					res="fail"; 
				}
				else
				{
					
					int result=this.db.addUser(name, pwd);
					if(result==1)
					{
						res="success";
					}
					
				}
			
			resp.setCharacterEncoding("utf-8");
			String strJson=JSON.toJSONString(res);
			System.out.println("转换成json格式的返回数据"+strJson);
			PrintWriter pw= resp.getWriter();
			pw.println(strJson);
			pw.flush();
			pw.close();						
		}
		else if("peo".equals(action))
		{
			req.getRequestDispatcher("page/peo.jsp").forward(req, resp);
		}
		else if("submit".equals(action))
		{
			
			String name=req.getParameter("username");
			String com=req.getParameter("usercom");
			String trea=req.getParameter("usertrea");
			System.out.println(name+"-->"+com+"--->"+trea);
			int count =this.db.addCode(name,com,trea);
			if(count==1)
			{
				PrintWriter pw= resp.getWriter();
				pw.println(count);
				pw.flush();
				pw.close();		
			}
		}
		
		else if ("message".equals(action))
		{
			List<Code> datas=this.db.queryCode();
			req.setAttribute("codedata", datas);
			req.setCharacterEncoding("UTF-8");
			req.getRequestDispatcher("page/message.jsp").forward(req, resp);
		}
		else if ("randomdata".equals(action))
		{
			String code=this.db.leaveCodeRandom();
			
			resp.setCharacterEncoding("utf-8");
			String codeJson=JSON.toJSONString(code);
			System.out.println("转换成json格式的返回数据"+codeJson);
			PrintWriter pw= resp.getWriter();
			pw.println(codeJson);
			pw.flush();
			pw.close();		
		}
								
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		System.out.println("UserServlet  doPost  ....");
		doGet(req,resp);
	}

}

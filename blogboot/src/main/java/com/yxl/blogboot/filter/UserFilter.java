package com.yxl.blogboot.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns="/*")
public class UserFilter implements Filter
{
	
	@Override
	public void init(FilterConfig arg0) throws ServletException
	{
		// TODO Auto-generated method stub
		System.out.println("UserFilter is init start..");
		
		
	}
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException
	{
		// TODO Auto-generated method stub
		
		//1.过滤所有的用户的请求的字符集是UTF-8,一次设置字符集，中文不乱码
		arg0.setCharacterEncoding("UTF-8");
		HttpServletResponse resp=(HttpServletResponse) arg1;
		
		//2.安全页面的保护，不是登录用户不能访问
		//取出用户请求的url
		HttpServletRequest request1=(HttpServletRequest) arg0;
		String url=request1.getRequestURI();
		System.out.println("所有的请求的URL："+url);
		
		if(url.contains("index")||url.contains("page"))
		{
			//如果用户访问的url里面包括这些关键字（其实就是目录),我们去检查是不是成功 的登录用户
			HttpSession session = request1.getSession();
			
			if(null==session.getAttribute("loginname"))
			{
				resp.sendRedirect("login.jsp");
				//必须加返回，下面的代码不能执行
				return;
			}
			
		}
		//满足条件的放行
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void destroy()
	{
		// TODO Auto-generated method stub
		System.out.println("UserFilter is destroy start..");
	}

}

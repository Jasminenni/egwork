package com.yxl.blogboot.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckModel 
{
	public  static  boolean  checkMobile(String  headerInfo)
	{
		String[]  heads= {"android","mac os","window mobile"};
		
		for(String  head:heads)
		{
			if(headerInfo.toLowerCase().contains(head))
			{
				return  true;
			}
		}
		
		return false;
	}
}

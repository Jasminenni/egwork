package com.yxl.blogboot.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.yxl.blogboot.model.Code;

public class MyCodeMapper implements RowMapper<Code>
{

	@Override
	public Code mapRow(ResultSet rs, int arg1) throws SQLException
	{
		// TODO Auto-generated method stub
		
		Code c = new Code();
		
		c.setCname(rs.getString(2));
		c.setCemail(rs.getString(3));
		c.setCtext(rs.getString(4));
		
		return c;
	}

}

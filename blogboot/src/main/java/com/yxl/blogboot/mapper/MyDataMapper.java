package com.yxl.blogboot.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.yxl.blogboot.model.Cont;

public class MyDataMapper implements RowMapper<Cont>
{

	@Override
	public Cont mapRow(ResultSet rs, int arg1) throws SQLException
	{
		// TODO Auto-generated method stub
		
		Cont c= new Cont();
		c.setUid(rs.getInt(1));
		c.setUname(rs.getString(2));
		c.setUpwd(rs.getString(3));
		c.setUgender(rs.getString(4));
		c.setUage(rs.getInt(5));
		c.setUfan(rs.getInt(6));
		c.setUatten(rs.getInt(7));
		c.setUlike(rs.getInt(8));
		c.setUimg(rs.getString(9));
		
		return c;
	}

}

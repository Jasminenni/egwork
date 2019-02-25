package com.yxl.blogboot.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.yxl.blogboot.model.Csdn;

public class MyRowMapper implements RowMapper<Csdn>
{

	@Override
	public Csdn mapRow(ResultSet rs, int arg1) throws SQLException
	{
		// TODO Auto-generated method stub
		Csdn s=new Csdn();
		s.setCid(rs.getInt(1));
		s.setCtime(rs.getString(2));
		s.setCtital(rs.getString(3));
		s.setContent(rs.getString(4));
		s.setCfoot(rs.getString(5));
		s.setCurl(rs.getString(6));		
		return s;
		
	}


}
